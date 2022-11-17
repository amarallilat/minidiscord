let user = [];

async function getUserInfo() {
    let id_expediteur = window.location.href.split("?id=")[1];
    let url = "apimessagerie.php?action=selectCompleteInfoUser";
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
            console.log(user);
        }
    } catch (e) {
        if (e) {
            console.error(e);
        }
    }
}
getUserInfo();
