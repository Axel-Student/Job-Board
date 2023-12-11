<?php
session_start();

require './connection_bdd.php';
if (!isset($_GET["action"])) {
    header("Location:../index.php?page=admin_pannel&action=client&token=" . $_SESSION["token"]);
}
switch ($_GET["action"]) {



    case "modifier":
        if (!$_GET["id_client"]) {
            header("location:../index.php?page=admin_pannel&action=client&token=" . $_SESSION["token"]);
        }
        if (
            isset($_POST["nom"]) &&
            isset($_POST["prenom"])  &&
            isset($_POST["mail"]) && 
            isset($_POST["telephone"]) 
        ) {

            $modif_client = $bdd->prepare("UPDATE `client` SET `nom_client`=:nom_client, `prenom`=:prenom_client, `telephone_client`=:telephone_client,`email_client`=:email_client WHERE `id_client`= " . $_GET["id_client"]);
                echo"cc";
            $modif_client->execute(array(
                ":nom_client" => $_POST["nom"],
                ":prenom_client" => $_POST["prenom"],
                ":email_client" => $_POST["mail"],
                ":telephone_client" => $_POST["telephone"]
            ));
            header("location:../index.php?page=candidat&action=info&retour=success&token=" . $_SESSION["token"]);
        }else{
            var_dump($_POST);

        }

        break;
    case "supprimer":
        if (!$_GET["id_client"]) {
            header("location:../index.php?page=admin_pannel&action=client&token=" . $_SESSION["token"]);
        }
        $delete_client = $bdd->prepare("DELETE FROM `client` WHERE `id_client` = ?");
        $delete_client->execute(array($_GET["id_client"]));
        header("location:../index.php?page=admin_pannel&action=client&retour=success&token=" . $_SESSION["token"]);

        break;

    case "mdp":
        if (!$_GET["id_client"]) {
            header("location:../index.php?page=admin_pannel&action=client&token=" . $_SESSION["token"]);
        }
        if (isset($_POST["old_pass"]) && isset($_POST["new_pass"])) {
            $id_client = $_GET["id_client"];
        
            // Vérifier l'ancien mot de passe
            $checkmdp = $bdd->prepare("SELECT `mot_de_passe` FROM `client` WHERE `id_client` = ?");
            $checkmdp->execute(array($id_client));
            $mdpbdd = $checkmdp->fetch();
        
            if ($mdpbdd && password_verify($_POST["old_pass"], $mdpbdd["mot_de_passe"])) {
                // Le mot de passe actuel est correct, vous pouvez maintenant mettre à jour le mot de passe.
        
                $hash = password_hash($_POST["new_pass"], PASSWORD_BCRYPT);
        
                $changemdp = $bdd->prepare("UPDATE `client` SET `mot_de_passe` = :mdp WHERE `id_client` = :id_client");
                $changemdp->execute(array(
                    ":mdp" => $hash,
                    ":id_client" => $id_client
                ));
        
                echo "Mot de passe mis à jour avec succès!";
            } else {
                echo "Ancien mot de passe incorrect.";
            }
        
        


            header("location:../index.php?page=home");
        }
        break;
}
