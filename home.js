let users = [];
let messages = [];
let aside = document.querySelector("#aside");
let main = document.querySelector("#main");
let submit = document.querySelector("#submitMessagePublic");
submit.addEventListener("click", envoyerMessagePublic);
let deconnexion = document.querySelector("#deconnexion");
deconnexion.addEventListener("click", () => {
    document.location.href = "deconnexion.php";
});
let messagePublic = document.querySelector("#messagePublic");
messagePublic.addEventListener("keypress", enter);
// let neutre = document.querySelector("#neutre");
// neutre.addEventListener("click", () => {
//     messagePublic.value += "\ud83d\ude10";
// });

async function getAllUsers() {
    const baseUrl = "getAllUsers.php";
    try {
        let donnees = await fetch(baseUrl);
        if (!donnees.ok) {
            throw new Error(donnees.status);
        } else {
            let data = await donnees.json();
            users = data;
            affichageUsers();
        }
    } catch (e) {
        if (e) {
            console.error(e);
        }
    }
}

function affichageUsers() {
    let html = `<p class="titre">Listes d'Amis</p>`;
    for (const user of users) {
        html += `<div class="group"><img class="max" src="./images/${user.avatar}" alt="fffff" /><p>${user.prenom} ${user.nom}</p></div>`;
    }
    aside.innerHTML = html;
    let abcd = document.querySelectorAll(".group");
    for (let i = 0; i < abcd.length; i++) {
        abcd[i].addEventListener("click", () => {
            document.location.href = `messageprive.php?id=${users[i].id}`;
        });
    }
}

getAllUsers();

async function getAllMessages() {
    const baseUrl = "getAllMessages.php";
    try {
        let donnees = await fetch(baseUrl);
        if (!donnees.ok) {
            throw new Error(donnees.status);
        } else {
            let data = await donnees.json();
            messages = data;
            affichageMessages();
        }
    } catch (e) {
        if (e) {
            console.error(e);
        }
    }
}

function affichageMessages() {
    const messagesPublics = messages.filter(
        (message) => message.id_recepteur == null
    );
    console.log(messagesPublics);
    let html = "";
    for (const messagePub of messagesPublics) {
        html += `<div class="discution"><img width="50px" src="./images/${
            messagePub.avatar
        }" alt="fvvfvffvee"/><div><div class="heurnom"><p class="nomdis">${
            messagePub.pseudo
        }</p><p class="heur">${messagePub.heure.slice(
            5,
            10
        )} ${messagePub.heure.slice(11, 16)}</p></div><h2>${
            messagePub.contenu
        }</h2></div></div>`;
    }
    main.innerHTML = html;
    main.scrollTop = main.scrollHeight;
}

getAllMessages();

async function envoyerMessagePublic() {
    let url = "apimessagerie.php?action=ajoutMessagePublic";
    let donnees = new FormData();
    donnees.append("contenu", messagePublic.value);
    let data = {
        method: "post",
        body: donnees,
    };
    let envoi = await fetch(url, data);
    messagePublic.value = "";
    getAllMessages();
}

function enter(e) {
    if (e.keyCode == 13) {
        envoyerMessagePublic();
    }
}
