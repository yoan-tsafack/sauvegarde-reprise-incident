# Sauvegarde et reprise après incident — PostgreSQL

Ce projet documente une procédure complète de sauvegarde et de restauration sur une base PostgreSQL, testée dans des conditions proches du réel : une vraie sauvegarde, un vrai incident simulé, et une vraie restauration, pas juste de la théorie.

## Contexte

Une base de données de gestion des stocks et fournisseurs ("achats_pme", voir le projet [gestion-stocks-pme](https://github.com/Yoan-Tsafack/gestion-stocks-pme)) sert de terrain d'expérimentation. L'objectif : être capable de réagir correctement si quelqu'un supprime des données par erreur, ce qui arrive régulièrement en entreprise (un DELETE sans WHERE, une mauvaise manipulation).

## Ce que j'ai fait

1. **Sauvegarde complète** de la base avec pgAdmin, au format Custom (compressé), avant toute modification.
2. **Simulation d'un incident** : suppression de toutes les commandes et de leurs lignes (`DELETE FROM commandes` et `DELETE FROM lignes_commande`), pour reproduire une erreur humaine classique.
3. **Vérification des dégâts** : confirmation que les tables étaient bien vides après l'incident.
4. **Restauration** de la base à partir de la sauvegarde, avec vérification que toutes les données étaient revenues à l'identique.
5. **Automatisation** de la sauvegarde avec un script (`sauvegarde_achats_pme.bat`) qui utilise `pg_dump` en ligne de commande, pour pouvoir planifier des sauvegardes régulières sans passer par une interface graphique.

## Le script

`sauvegarde_achats_pme.bat` lance une sauvegarde de la base directement depuis l'invite de commandes Windows. Avant de l'utiliser, remplace `Mot_de_passe` par ton propre mot de passe PostgreSQL.

## Ce que ce projet démontre

- Bonnes pratiques de sauvegarde avec `pg_dump` / pgAdmin
- Capacité à diagnostiquer une perte de données et à la corriger
- Automatisation avec un script en ligne de commande
- Bon réflexe de sécurité : ne jamais publier un mot de passe réel dans du code partagé
