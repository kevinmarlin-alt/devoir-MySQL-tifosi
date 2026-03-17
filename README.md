# 📘 README – Projet Base de Données Tifosi

## 📖 Description
Ce projet met en place une base de données MySQL pour une application de gestion d’une pizzeria spécialisée dans les focaccias 🍕.

Il comprend :
- La création de la base de données
- La structure des tables
- Le peuplement des données
- Une série de requêtes SQL d’analyse

## ⚙️ Prérequis
Avant de commencer, assure-toi d’avoir installé :
- MySQL (ou MariaDB)
- Un client SQL (ex : MySQL Workbench, DBeaver, phpMyAdmin)

## 🚀 Installation du projet
### 1. Cloner le projet
`git clone <url-du-repo>`

`cd tifosi`
### 2. Créer la base de données
Exécuter le fichier :

`tifosi_db.sql`

👉 Ce script va :
- Créer la base `tifosi`
- Créer un utilisateur :
  - login : `tifosi`
  - mot de passe : `tifosi123`
- Donner tous les droits sur la base
- Créer toutes les tables

### 3. Importer les données
Exécuter ensuite :
`tifosi_data.sql`

👉 Ce script insère :
- Les marques
- Les ingrédients
- Les boissons
- Les focaccias
- Les relations entre focaccias et ingrédients

## 🔐 Connexion à la base
### Via ligne de commande :

`mysql -u tifosi -p`

Puis entrer le mot de passe :

`tifosi123`

Ensuite :

`USE tifosi;`

### Via un client (Workbench / DBeaver)

- Host : `localhost`
- Port : `3306`
- User : `tifosi`
- Password : `tifosi123`
- Database : `tifosi`

## 🧱 Structure de la base

**Tables principales :**
- `foccacia` → Liste des focaccias
- `ingredient` → Liste des ingrédients
- `boisson` → Liste des boissons
- `marque` → Marques des boissons
- `comprend` → Relation focaccia ↔ ingrédients
- `menu` → Menus proposés
- `client` → Clients
- `achete` → Historique des achats

## 🧪 Requêtes SQL fournies
Le fichier :

`tifosi_test.sql`

contient plusieurs requêtes permettant de tester et manipuler la base.

**Exemples :**
- 📋 Liste des focaccias triées
- 🔢 Nombre total d’ingrédients
- 💰 Prix moyen des focaccias
- 🧾 Liste des boissons avec leur marque
- 🧀 Ingrédients d’une focaccia spécifique
- 🥇 Focaccia avec le plus d’ingrédients
- 🚫 Ingrédients non utilisés
- 🍄 Focaccias sans champignons

## 📌 Ordre d’exécution recommandé

1. `tifosi_db.sql` → création de la base
2. `tifosi_data.sql` → insertion des données
3. `tifosi_test.sql` → tests et requêtes

## 💡 Remarques
- Les contraintes SQL sont utilisées :
    - `CHECK`
    - `FOREIGN KEY`
    - `UNIQUE`
- Le modèle respecte une logique relationnelle claire
- Les requêtes montrent l’utilisation de :
    - `JOIN`
    - `GROUP BY`
    - `COUNT`, `AVG`
    - `NOT EXISTS`

## 👨‍💻 Kevin MArlin
Projet réalisé dans le cadre d’un exercice SQL.