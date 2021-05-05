# PROJET HMSN204 - Partie Base de Données
KON-SUN-TACK Fabien, BATTISTEL Clementine, BOUVIER Quentin, MARCO Corentin

## Mise en place d'une espace de travail Mysql pour Unbuntu 18.04 et supérieur :

1. Ouvrir un terminal de commande.

2. (Facultatif) Si Mysql n’est pas installé sur votre ordinateur :  
```bash
sudo apt install mysql-server
```

3. Démarrer votre serveur Mysql :$  
```bash
sudo systemctl start mysql 
```

4. (Facultatif) Première utilisation :  
```bash
sudo mysql
```
Dans votre terminal mysql>  s’affiche.

5. (Facultatif) Changer le mot de passe de votre root :  
```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'le_mot_de_pass_choisi';
```

6. Mise à jour des privilèges : 
```sql
FLUSH PRIVILEGES;
```

7. (Facultatif mais recommandé) Créer un nouvel utilisateur pour interagir avec la base de données :  
```sql
CREATE USER 'nom_utilisateur_choisi'@'localhost' IDENTIFIED BY 'mot_de_passe_solide';
```

8. Créer votre base de données :  
```sql
CREATE DATABASE nom_de_la_base;
```
  
9. Donner les droits sur la base de données à un utilisateur : 
```sql
GRANT ALL ON nom_base.* TO 'nom_utilisateur'@'localhost';
```

10. Mise à jour des privilège : 
```sql
FLUSH PRIVILEGES;
```

11. Quitter Mysql : 
```sql
QUIT;
```

12. Ouvrir Mysql avec l’utilisateur : 
```bash
mysql -u nom_utilisateur -p
```

13. Mettre son mot de passe , il ne s’affiche pas c’est normal.

14. Choisir la base de données que vous voulez utiliser : 
```sql
USE nom_de_la_base;
```

## Avant utilisation de la base de données :

1. Ouvrir Mysql en mode administrateur root : 
```bash
sudo mysql -u root -p
```
2. Quand Mysql est ouvert faire : 
```sql
SET GLOBAL local_infile=true;
```
3. Quittez Mysql : 
```sql
quit;
```
4. Se connecter à Mysql avec la commande : 
```bash
mysql --local_infile=1 −u nom_utilisateur -p
```
Voila vous pouvez utilisez notre base de données convenablement

## Implémentation et peuplement de la base de données

1. Ouvrir un terminal avec pour chemin le dossier où se trouve les dossiers ```DatabaseV3.sql,remplissage.sql,table_plant.csv,table_plate.csv,table_mesure.csv``` ou crée se dossier.
```bash
cd le_chemin_dossier
```
2. Se connecter à Mysql : 
```bash
mysql --local_infile=1 −u nom_utilisateur -p 
```
3. Lancer le script DatabaseV3.sql : 
```sql
source DatabaseV3.sql
```
4. Lancer le script remplissage.sql : 
```sql
source remplissage.sql
```
5. Vous pouvez maintenant tapez vos requête SQL.

6. Nous avons m'y à votre disposition un ensemble de requêtes SQL dans le fichier ```requetes.sql```
