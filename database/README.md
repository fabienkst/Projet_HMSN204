# PROJET HMSN204 - Partie Base de Données
KON-SUN-TACK Fabien, BATTISTEL Clementine, BOUVIER Quentin, MARCO Corentin

## Mise en place d'une espace de travail Mysql pour Unbuntu 18.04 et supérieur :

1. Ouvrir un terminal de commande.

1. (Facultatif) Si Mysql n’est pas installé sur votre ordinateur :  $ sudo apt install mysql-server

1. Démarrer votre serveur Mysql :$  sudo systemctl start mysql 

1. (Facultatif) Première utilisation :  $sudo mysql        
Dans votre terminal mysql>  s’affiche.

1. (Facultatif) Changer le mot de passe de votre root :  mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'le_mot_de_pass_choisi';

1. Mise à jour des privilèges : mysql> FLUSH PRIVILEGES;

1. (Facultatif mais recommandé) Créer un nouvel utilisateur pour interagir avec la base de données :  mysql> CREATE USER 'nom_utilisateur_choisi'@'localhost' IDENTIFIED BY 'mot_de_passe_solide';

1. Créer votre base de données :  
  ```sql
  mysql>  CREATE DATABASE nom_de_la_base;
  ```
  
1. Donner les droits sur la base de données à un utilisateur : mysql>  GRANT ALL ON nom_base.* TO 'nom_utilisateur'@'localhost';

1. Mise à jour des privilège : mysql> FLUSH PRIVILEGES;

1. Quitter Mysql : mysql> QUIT;

1. Ouvrir Mysql avec l’utilisateur : $ mysql -u nom_utilisateur -p

1. Mettre son mot de passe , il ne s’affiche pas c’est normal.

1. Choisir la base de données que vous voulez utiliser : 
mysql> USE nom_de_la_base;

## Avant utilisation de la base de données :

1. Ouvrir Mysql en mode administrateur root : $ sudo mysql -u root -p
1. Quand Mysql est ouvert faire : SET GLOBAL local_infile=true;
1. Quittez Mysql : quit;
1. Se connecter à Mysql avec la commande : mysql --local_infile=1 −u nom_utilisateur -p
Voila vous pouvez utilisez notre base de données convenablement

## Implémentation et peuplement de la base de données

1. Ouvrir un terminal avec pour chemin le dossier où se trouve les dossiers DatabaseV3.sql,remplissage.sql,table_plant.csv,table_plate.csv,table_mesure.csv ou crée se dossier. $ cd le_chemin_dossier
1. Se connecter à Mysql : mysql --local_infile=1 −u nom_utilisateur -p 
1. Lancer le script DatabaseV3.sql : source DatabaseV3.sql
1. Lancer le script remplissage.sql : source remplissage.sql
1. Vous pouvez maintenant tapez vos requête SQL.
1. Nous avons m'y à votre disposition un ensemble de requêtes SQL dans le fichier requetes.sql
