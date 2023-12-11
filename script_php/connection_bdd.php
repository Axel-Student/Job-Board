<?php
try {
    $bdd = new PDO('mysql:host=localhost;port=3306;dbname=Job-board;charset=utf8', 'bdd', 'bdd');
    $bdd->setAttribute(PDO::MYSQL_ATTR_USE_BUFFERED_QUERY, false);
} catch (PDOException $e) {
    die('Erreur : ' . $e->getMessage());
}
?>