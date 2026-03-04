BI E-Commerce Analysis – Olist Dataset

Contexte

Ce projet présente une analyse Business Intelligence réalisée à partir du dataset public Olist Brazilian E-Commerce.

L’objectif est de construire un modèle BI structuré, analyser les performances commerciales et produire un dashboard décisionnel via Power BI.


Objectifs du projet

Mesurer le chiffre d’affaires global et mensuel

Analyser la croissance temporelle

Identifier les catégories produits les plus performantes

Étudier la concentration du revenu

Analyser le comportement et la fidélité client


Modèle de données

Le modèle a été structuré selon une logique BI :

Fact Tables

fact_orders

Grain : 1 ligne = 1 commande

Utilisée pour les KPI globaux (CA, AOV, réachat)

fact_sales

Grain : 1 ligne = 1 item produit

Utilisée pour l’analyse produit

Transformation clé

Les paiements ont été agrégés au niveau commande afin d’éviter les doublons liés aux jointures entre items et paiements.


KPI principaux

💰 Chiffre d’affaires total : 16,0 M

📦 Nombre de commandes : ~99 000

🛒 Panier moyen : ~161

🔁 Taux de réachat : 3,12 %

🔎 Insights clés


Forte accélération du chiffre d’affaires fin 2017 avec un pic en novembre 2017.

Les 10 meilleurs clients représentent moins de 0,5 % du chiffre d’affaires total (revenu très distribué).

Le taux de réachat est faible (3,12 %), mais les clients fidèles dépensent presque 2x plus que les clients uniques.

Les catégories beleza_saude et cama_mesa_banho dominent en volume.

La catégorie relogios_presentes se distingue par un prix moyen élevé.


📊 Dashboard

Le dashboard Power BI inclut :

KPI globaux

Courbe du chiffre d’affaires mensuel (mois incomplets exclus)

Top catégories produits

Filtrage dynamique par période

Ajouter ici une capture écran :

![Dashboard Preview](assets/dashboard_screenshot.png)

🛠 Stack technique

PostgreSQL

SQL (JOIN, agrégations, window functions)

Power BI



Modélisation en étoile

📂 Structure du projet
BI_Olist_Ecommerce_Project/
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_create_views.sql
│   ├── 03_kpi_queries.sql
│
├── dashboard/
│   └── olist_dashboard.pbix
│
├── assets/
│   └── dashboard_screenshot.png
│
└── README.md