let users = [];
let listeUsers = document.querySelector("#listeUsers");

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
    let html = ``;
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
