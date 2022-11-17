let email = document.querySelector("#email");
let password = document.querySelector("#password");
let error = document.querySelector("#error");
email.addEventListener("keypress", enter);
password.addEventListener("keypress", enter);

async function connexion() {
    let url = "apimessagerie.php?action=connexion";
    let donnees = new FormData();
    donnees.append("email", email.value);
    donnees.append("password", password.value);
    let data = {
        method: "post",
        body: donnees,
    };
    let envoi = await fetch(url, data);
    let retour = await envoi.json();
    let message = "";
    switch (retour) {
        case "aaa":
            document.location.href = "home.php";
            break;
        case "bbb":
            message = "le mot de passe est incorrect";
            showError(message);
            break;
        case "ccc":
            message = "l'utilisateur n'existe pas";
            showError(message);
            break;
    }
}

function enter(e) {
    if (e.keyCode == 13) {
        connexion();
    }
}

function showError(message) {
    error.innerHTML = message;
}
