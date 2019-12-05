# TP Annonces : réaliser un site de partage de petites annonces

En préambule, je vous rappelle que vous pouvez consulter sans restriction aucune cette documentation ésotérique [PHP Manual](https://php.net/manual/fr/) qui n'est pas rédigée en latin mais en Français, et je vous promet, pour l'avoir testée, que rien ne va exploser, que vous n'allez pas réveiller un dragon endormi ni créer de trou noir en vous y plongeant.... ; )

## Enoncé initial

Ce projet fait echo à votre demande d'avoir une proposition de correction, ainsi qu'une architecture complète MVC.
D'un point de vue méthodologie, nous allons procéder par phases, qui elles mêmes seront découpées en itérations incrémentales. En gros, on va faire les choses dans l'ordre où cela doit être fait...

## 1ère PHASE : Analyse, bibliothèque de données, modélisation BDD

En préambule à la première phase de développement, vous aurez analysé la problèmatique, et en aurez déduit les regroupements suivants, en terme de fonctionnalités :
- Afficher la page d'accueil
- Afficher toutes les annonces
- Afficher toutes les annonces d'une catégorie
- Afficher une annonce singulière
- Permettre à un utilisateur de s'enregistrer, modifier ses informations personnelles, se désinscrire
- Afficher les informations relatives à un utilisateur
- Afficher les annonces d'un utilisateur
- Permettre à un utilisateur de publier une annonce, de la modifier, de la supprimer
- Permettre à un utilisateur de se connecter/déconnecter du système

Maintenant, mettons en lumière et regroupons nos données :
- Afficher toutes les annonces : ensemble des `annonces` groupées par `catégories`
- Afficher toutes les annonces d'une catégorie : ensemble des `annonces` appartenants à une `catégorie`
-> Les entités élémentaires dégagées sont donc : `annonces` et `catégories`, et leur relation pouvant être définie comme suit : une catégorie regroupe plusieurs annonces, une annonce appartient à une catégorie.
- Afficher les informations relatives à un utilisateur : données d'un `utilisateur`
- Afficher les annonces d'un utilisateur : ensemble des `annonces` appartenants à un `utilisateur`
-> Les entités élémentaires dégagées sont donc : `annonce` et `utilisateur`, et leur relation pouvant être définie comme suit : un utilisateur possède zéro, une ou plusieurs annonces, une annonce appartient à un utilisateur
- Les autres fonctionnalités feront appel aux mêmes entités

## Modélisons nos relations - création du MCD (cf. cours sur les bases de données)

Propriétés atomiques normalisées :

Pour l'entité `categorie` :
- identifiant
- titre
___________________________
        |
        1,n
        |
    APPARTENIR
        |
        1,1
        |
____________________________
Pour l'entité `annonce`:
- identifiant
- titre
- description
- date_creation
- image
___________________________
        |
        1,1
        |
    APPARTENIR
        |
        0,n
        |
____________________________
Pour l'entité `utilisateur`:
- identifiant
- nom
- prenom
- adresse_mail
- mot_de_passe

## Modélisons nos relations - convertion du MCD en MLD (cf. cours sur les bases de données)

Pour l'entité `categorie` :
- identifiant
- titre
_________._________________
        / \
         |
         | (référence)
         |
____________________________
Pour l'entité `annonce`:
- identifiant
- titre
- description
- date_creation
- image
- identifiant_utilisateur
- identifiant_categorie
___________________________
        |
        | (référence)
        |
_______\./___________________
Pour l'entité `utilisateur`:
- identifiant
- nom
- prenom
- adresse_mail
- mot_de_passe

## Modélisons nos relations - convertion du MLD en MPD pour MySql (cf. cours sur les bases de données)

Voir fichier bdd_creation.sql