# TP Annonces : réaliser un site de partage de petites annonces

En préambule, je vous rappelle que vous pouvez consulter sans restriction aucune cette documentation ésotérique [PHP Manual](https://php.net/manual/fr/) qui n'est pas rédigée en latin mais en Français, et je vous promet, pour l'avoir testée, que rien ne va exploser, que vous n'allez pas réveiller un dragon endormi ni créer de trou noir en vous y plongeant.... ; )

## Enoncé initial

Ce projet fait echo à votre demande d'avoir une proposition de correction, ainsi qu'une architecture complète MVC.
D'un point de vue méthodologie, nous allons procéder par phases, qui elles mêmes seront découpées en itérations incrémentales. En gros, on va faire les choses dans l'ordre où cela doit être fait...

## 2ème PHASE : Définition des composants d'accès aux données - CRUD

Maintenant que notre base de données est opérationnelle, et que son import (exécution du script) s'est correctement déroulé, il convient de définir nos composants (modèles) d'accès aux données.

Reprennons nos fonctions principales :
- Afficher la page d'accueil
- Afficher toutes les annonces
- Afficher toutes les annonces d'une catégorie
- Afficher une annonce singulière
- Permettre à un utilisateur de s'enregistrer, modifier ses informations personnelles, se désinscrire
- Afficher les informations relatives à un utilisateur
- Afficher les annonces d'un utilisateur
- Permettre à un utilisateur de publier une annonce, de la modifier, de la supprimer
- Permettre à un utilisateur de se connecter/déconnecter du système

Maintenant, regardont nos besoins fonctionnels vis-à-vis de notre base de données :
- Afficher toutes les annonces : nécessite la lecture de l'ensemble des occurences de la table `annonce`
- Afficher toutes les annonces d'une catégorie : nécessite la lecture d'un ensemble d'occurences de la table `annonce` restreint à une categorie
- Afficher une annonce singulière : nécessite la lecture d'une occurence de la table `annonce` restreinte à son identifiant
- Permettre à un utilisateur de s'enregistrer, modifier ses informations personnelles, se désinscrire : nécessite l'écriture d'une nouvelle occurence dans la table `utilisateur`, la modification d'une occurence existante restreinte à l'identifiant d'un utilisateur, la suppression d'une occurence existante restreinte à l'identifiant d'un utilisateur
- Afficher les informations relatives à un utilisateur: nécessite la lecture d'une occurence de la table `utilisateur` restreinte à l'identifiant d'un utilisateur
- Afficher les annonces d'un utilisateur : nécessite la lecture d'un ensemble d'occurences de la table `annonce` restreint à un utilisateur
- Permettre à un utilisateur de publier une annonce, de la modifier, de la supprimer : nécessite l'écriture d'une nouvelle occurence dans la table `annonce`, la modification d'une occurence existante restreinte à l'identifiant d'une annonce et de sa propriété par un utilisateur, la suppression d'une occurence existante restreinte à l'identifiant d'une annonce et sa propriété par un utilisateur
- Permettre à un utilisateur de se connecter/déconnecter du système : necessite la lecture de l'ensemble des occurences de la table `utilisateur` restreinte à une propriété discriminante, nécessite la lecture d'une occurence de la table `utilisateur` restreinte à son identifiant

Nous allons donc créer 3 modèles d'accès aux données : Utilisateur, Annonce et Categorie.