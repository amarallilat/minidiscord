let message = document.querySelector("#message");
message.addEventListener("keypress", enter);
let listeUsers = document.querySelector("#listeUsers");
let messagesPrives = document.querySelector("#messagesPrives");
let userDiv = document.querySelector("#user");
let users = [];
let messages = [];
let session = [];
let user = [];

async function getSession() {
    let urlSession = "apimessagerie.php?action=getSession";

    try {
        let session = await fetch(urlSession);
        if (!session.ok) {
            throw new Error(session.status);
        } else {
            let aaa = await session.json();
            session = aaa;
            console.log(session);
            if (window.location.href.split("?id=")[1] != undefined) {
                selectInfoUser();
                selectMessagePrive();
            }
        }
    } catch (e) {
        if (e) {
            console.error(e);
        }
    }
}

async function getAllUsers() {
    const baseUrl = "apimessagerie.php?action=getAllUsers";
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
    let html = `<div><input class="recherches" type="text"placeholder="Recherches:"></div>`;
    for (const user of users) {
        html += `<div class="amis group"><p>${user.prenom} ${user.nom}</p><img class="max" src="./images/${user.avatar}" alt="fffff"/></div>`;
    }
    listeUsers.innerHTML = html;
    let abcd = document.querySelectorAll(".group");
    for (let i = 0; i < abcd.length; i++) {
        abcd[i].addEventListener("click", () => {
            document.location.href = `messageprive.php?id=${users[i].id}`;
        });
    }
}

getAllUsers();

async function envoyerMessagePrive() {
    let id_recepteur = window.location.href.split("?id=")[1];
    let url = "apimessagerie.php?action=ajoutMessagePrive";
    let donnees = new FormData();
    donnees.append("id_recepteur", id_recepteur);
    donnees.append("contenu", message.value);
    let data = {
        method: "post",
        body: donnees,
    };
    let envoi = await fetch(url, data);
    message.value = "";
    selectMessagePrive();
}

async function selectInfoUser() {
    let id_expediteur = window.location.href.split("?id=")[1];
    console.log(id_expediteur);
    let url = "apimessagerie.php?action=selectInfoUser";
    let donnees = new FormData();
    donnees.append("id_expediteur", id_expediteur);
    let data = {
        method: "post",
        body: donnees,
    };

    try {
        let donnees = await fetch(url, data);
        if (!donnees.ok) {
            throw new Error(donnees.status);
        } else {
            let data = await donnees.json();
            user = data;
            affichageUser();
        }
    } catch (e) {
        if (e) {
            console.error(e);
        }
    }
}

async function selectMessagePrive() {
    let id_expediteur = window.location.href.split("?id=")[1];
    let url = "apimessagerie.php?action=selectMessagePrive";
    let donnees = new FormData();
    donnees.append("id_expediteur", id_expediteur);
    let data = {
        method: "post",
        body: donnees,
    };

    try {
        let donnees = await fetch(url, data);
        if (!donnees.ok) {
            throw new Error(donnees.status);
        } else {
            let data = await donnees.json();
            messages = data;
            console.log(messages);
            affichageMessagePrive();
        }
    } catch (e) {
        if (e) {
            console.error(e);
        }
    }
}

getSession();

function enter(e) {
    if (e.keyCode == 13) {
        envoyerMessagePrive();
    }
}

function affichageMessagePrive() {
    let html = "";
    for (const message of messages) {
        html += `<div class="discution"><img width="50px" src="./images/${
            message.avatar
        }" alt="fvvfvffvee"/><div><div class="heurnom"><p class="nomdis">${
            message.pseudo
        }</p><p class="heur">${message.heure.slice(
            5,
            10
        )} ${message.heure.slice(11, 16)}</p></div><h2>${
            message.contenu
        }</h2></div></div>`;
    }
    messagesPrives.innerHTML = html;
    messagesPrives.scrollTop = messagesPrives.scrollHeight;
}

function affichageUser() {
    let html = `<img class="photos" width="200px" src="./images/${user.avatar}" alt="crgfuihfd"/><h2>${user.prenom} ${user.nom}</h2><h2 style="text-align: center;">(${user.pseudo})</h2><button id="btnPlus" class="plusinfo">plus d'information</button>`;
    userDiv.innerHTML = html;
    message.placeholder = `Ecrire un message à ${user.prenom} ideuh...`;
    let btnPlus = document.querySelector("#btnPlus");
    btnPlus.onclick = popup;
}

function popup() {
    let html = `<div class="popup"></div><div class="fadePopup"></div>`;
    document.body.innerHTML += html;
    let fadePopup = document.querySelector(".fadePopup");
    fadePopup.addEventListener("click", closepop);
    let btnPlus = document.querySelector("#btnPlus");
    btnPlus.onclick = popup;
}

function closepop() {
    let popup = document.querySelector(".popup");
    let fadePopup = document.querySelector(".fadePopup");
    document.body.removeChild(popup);
    document.body.removeChild(fadePopup);
}
