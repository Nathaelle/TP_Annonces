# TP Annonces : réaliser un site de partage de petites annonces

En préambule, je vous rappelle que vous pouvez consulter sans restriction aucune cette documentation ésotérique [PHP Manual](https://php.net/manual/fr/) qui n'est pas rédigée en latin mais en Français, et je vous promet, pour l'avoir testée, que rien ne va exploser, que vous n'allez pas réveiller un dragon endormi ni créer de trou noir en vous y plongeant.... ; )

## Enoncé initial

Ce projet fait echo à votre demande d'avoir une proposition de correction, ainsi qu'une architecture complète MVC.
D'un point de vue méthodologie, nous allons procéder par phases, qui elles mêmes seront découpées en itérations incrémentales. En gros, on va faire les choses dans l'ordre où cela doit être fait...

## 3ème PHASE : Définition des fonctionnalités d'affichage - Les vues

Maintenant que nous avons prédéfini la structure de nos composants d'accès aux données, définissont nos fonctionnalités d'affichage : les vues, et pour cela, nous allons créer (ou récupérer) une maquette HTML.

Reprennons nos fonctions principales, et regardons nos besoins fonctionnels vis-à-vis de l'affichage :
- Afficher la page d'accueil : vue de la page d'accueil
- Afficher toutes les annonces : vue de toutes les annonces sous forme de liste, groupées par catégories
- Afficher toutes les annonces d'une catégorie : vue des annonces d'une catégorie sous forme de liste
- Afficher une annonce singulière : vue d'une annonce particulière
- Permettre à un utilisateur de s'enregistrer, modifier ses informations personnelles, se désinscrire : vue d'un formulaire d'inscription
- Afficher les informations relatives à un utilisateur : vue des données d'un utilisateur
- Afficher les annonces d'un utilisateur : vue d'une liste des annonces d'un utilisateur
- Permettre à un utilisateur de publier une annonce, de la modifier, de la supprimer : vue d'un formulaire d'ajout/modification d'une annonce
- Permettre à un utilisateur de se connecter/déconnecter du système : vue d'un formulaire de connexion

Nous allons donc prévoir ces 9 vues différentes à partir d'une maquette HTML.