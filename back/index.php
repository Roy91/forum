<?php
$user = 'root';
$password = 'simplonco';
$dbname = 'Forum';
$host = 'localhost';
$port = 3306;

try {
  $db = new PDO('mysql:host=localhost;dbname=Forum;charset=utf8', 'root', 'simplonco', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));/*precise l'erreur*/

}
catch (Exception $e)
{
        die('Erreur : ' . $e->getMessage());
}

if (isset($_FILES['avatar']) AND $_FILES['avatar']['error'] == 0)
{
  if ($_FILES['avatar']['size'] <= 8000000)/*=8Mo*/
        {
          $infosfichier = pathinfo($_FILES['avatar']['name']);
          $extension_upload = $infosfichier['extension']; /*variable qui contiendra autre variable*/
          $extensions_autorisees = array('jpg', 'jpeg', 'gif', 'png');
                if (in_array($extension_upload, $extensions_autorisees))
                {

                        move_uploaded_file($_FILES['avatar']['tmp_name'], '/etc/apache2/uploads/' . basename($_FILES['avatar']['name']));
                        echo "L'envoi a bien été effectué !";
                }
        }
}


if (isset($_POST['pseudo'], $_POST['mail'], $_POST['pwd'])) {

  $_POST['pseudo'] = htmlspecialchars($_POST['pseudo']);
  $_POST['mail'] = htmlspecialchars($_POST['mail']);
  $_POST['pwd'] = htmlspecialchars($_POST['pwd']);
  $_POST['pwd'] = sha1($_POST['pwd']);
}



if (preg_match('#^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$#', $_POST['mail'])) {

  $req = $db->prepare('INSERT INTO user(pseudo, pwd, mail, date_inscription) VALUES(:pseudo, :pwd, :mail, CURDATE())');
  $req->execute(array(
      'pseudo' => $_POST['pseudo'],
      'pwd' => $_POST['pwd'],
      'mail' => $_POST['mail']));
    $req->closeCursor();

}

    else {

      echo 'L\'adresse : '.$_POST['mail'].' n\'est pas bonnne.<br/>';
    }


    //  Récupération de l'utilisateur et de son pass hashé
    $con = $db->prepare('SELECT id_u, pwd FROM user WHERE pseudo = :pseudo');
    $con->execute(array(
        'pseudo' => $pseudo));
    $resultat = $con->fetch();

    // Comparaison du pass envoyé via le formulaire avec la base
    $isPasswordCorrect = password_verify($_POST['pwd'], $resultat['pwd']);

    if (!$resultat)
    {
        echo 'Mauvais identifiant ou mot de passe !';
    }
    else
    {
        if ($isPasswordCorrect) {
            session_start();
            $_SESSION['id_u'] = $resultat['id_u'];
            $_SESSION['pseudo'] = $pseudo;
            echo 'Vous êtes connecté !';
        }
        else {
            echo 'Mauvais identifiant ou mot de passe !';
        }
    }
