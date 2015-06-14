<?php
require_once('BDD.php');
global $link;

if ($_GET['action'] == 'like') {
  $nblikes = $_GET['nblike'];	
  $id = $_GET['id'];
  $like_query = "UPDATE Creation SET likes=" . ($nblikes + 1) . " WHERE id=" . $id;
  mysql_query($like_query, $link);
}

if ($_POST['action'] == 'commentaire') {
  $comment = $_POST['commentaire'];	
  $id = $_POST['id'];
  $comment_query = "INSERT INTO Commentaire (auteur, message, id_creation) VALUES ('" . $_SERVER['REMOTE_ADDR'] . "', '" . $comment . "', " . $id . ");";
  mysql_query($comment_query, $link);
}

if ($_POST['action'] == 'reserver') {
  $nom = $_POST['nom'];	
  $prenom = $_POST['prenom'];	
  $adresse = $_POST['adresse'];	
  $tel = $_POST['tel'];	
  $email = $_POST['email'];	
  $id = $_POST['id'];
  $res_query = "INSERT INTO Reservation (nom, prenom, adresse, email, tel, id_creation) VALUES ('" . $nom . "', '" . $prenom . "', '" . $adresse . "', " . $tel . ", '"  . $email . "', " . $id . ");";
  mysql_query($res_query, $link);
}
?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MODA</title>
<link href="style1.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="fb-root"></div>
<section id="menu">
    <!--  Navigation  menu-->
    <header>
        <nav>
            <img src="image.jpg" width="960" height="300" onClick="window.top.location = 'index.html';">
            <ul id="navigation">
                <li><a href="vetements.php">Vêtements</a></li>
                <li><a href="accessoires.php">Accessoires</a></li>
            </ul>    
        </nav>
    </header>
    <!-- footer -->
    <footer>
        <ul>
            <li id="mailto"><a href="mailto:contact@moda.com">contact@moda.com</a></li>
        </ul>
    </footer>
</section>
<!-- body : carré gris au milieu -->
<section class="body">
<div class="fb-like" data-href="file:///Volumes/Macintosh%20HD/Users/juliemoreau/Desktop/MODA/vetements.html" data-layout="button" data-action="like" data-show-faces="false" data-share="false"></div><iframe name="frame1" width="1" height="1" align="middle" src="http://bouton-facebook.over-blog.com/2014/06/zz.html" frameborder="no" scrolling="no"></iframe>
    <article>
    
    	<?php
		require_once('BDD.php');
		global $link;
        $query = "SELECT * FROM Creation WHERE description='vetements'";

        // Exécution de la requête
        $result = mysql_query($query, $link);

		// Vérification du résultat
		// Ceci montre la requête envoyée à MySQL ainsi que l'erreur. Utile pour déboguer.
		if (!$result) {
			$message  = 'Requête invalide : ' . mysql_error() . "\n";
			$message .= 'Requête complète : ' . $query;
			die($message);
		}

		// Utilisation du résultat
		while ($row = mysql_fetch_assoc($result)) {

			// Récupération de l'image
        	$img_query = "SELECT * FROM Image WHERE id_creation=" . $row['id'];

        	// Exécution de la requête
        	$img_result = mysql_query($img_query, $link);
			$img_row = mysql_fetch_assoc($img_result);
		?>
        <div class='item'>
            <br>
            <?php echo $row['libelle']; ?> 
            <br><br>
            <img src="<?php echo $img_row['url']; ?> " width="420" height="300">
            <br>
            <br>
            <form action="vetements.php" method="POST">
               <div>
                 <label for="commentaire">Commentaire:</label>
                 <input type="text" name="commentaire" id="Commentaire">
                 <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                 <input type="hidden" name="action" value="commentaire">
                 <input type="submit" value = "Valider" name ="Valider" id="Valider">
               </div>
               
               
            <img src="image4.jpeg" width="60" onClick="window.top.location = 'accessoires.php?action=like&id=<?php echo $row['id']; ?>&nblike=<?php echo $row['likes']; ?>';">
               - <?php echo $row['likes']; ?>
            </form>

            <?php
            // Récupération de l'image
        	$reser_query = "SELECT * FROM Reservation WHERE id_creation=" . $row['id'];

        	// Exécution de la requête
        	$reser_result = mysql_query($reser_query, $link);
			$reser_rows = mysql_num_rows($reser_result);
			
			// S'il y a réservation, non affichage du formulaire.
			if ($reser_rows == 0) {
			?>
            <form action="vetements.php" method="POST">
               <div>
               <br/>
                 <label for="nom">Nom : </label><input type="text" name="nom" id="nom"><br/><br/>
                 <label for="prenom">Pr&eacute;nom : </label><input type="text" name="prenom" id="prenom"><br/><br/>
                 <label for="adresse">Adresse : </label><input type="text" name="adresse" id="adresse"><br/><br/>
                 <label for="email">Email : </label><input type="mail" name="email" id="email"><br/><br/>
                 <label for="tel">Telephone : </label><input type="text" name="tel" id="tel" maxlength="10">
                 <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                 <input type="hidden" name="action" value="reserver">
               </div>            
               <input type="submit" value="Réserver">
            </form>
            <?php
			}
			?>
        </div>
        <?php
		}
		?>
    </article>
</section>
</body>
</html>