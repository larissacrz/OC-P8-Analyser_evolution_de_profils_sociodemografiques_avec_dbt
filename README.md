# Analyser l'évolution de profils sociodémographiques avec dbt

---

## Objectif du projet 

Analyser l’évolution du profil sociodémographique des étudiants OpenClassrooms inscrits au parcours Data Analyst entre 2022 et 2025, afin d'observer les tendances (répartition par âge, genre et région) et d'alimenter les réflexions stratégiques de l’entreprise sur l’accessibilité et l’égalité des chances.

---
## Sources de données 

1. Données des étudiants du parcours Data Analyst :
    - issues de base internes d'OpenClassrooms
    - fichier csv
2. Données publiques démographiques statistiques de la population Française par région, sexe et tranche d'âge :
    - issues de l'INSEE
    - fichier csv
---
## Snowflake 

Stockage et environnement d'exécution des données (warehouse)

- Création de la base de données et du schéma
- Chargement des données sources brutes
- Connexion avec dbt Cloud
- Accès aux vues et tables matérialisées produites par les modèles dbt
---
## Architecture dbt 

### Sources

- Déclaration et documentation des sources de données (models/sources/sources.yml)

### Models

Modèles SQL organisés en trois couches (models/) :

- staging : nettoyage, standardisation et préparation des données sources
- intermediate : transformations selon les règles métier, déduplication, agrégations et jointures nécessaires à l'analyse 
- mart : modèle final réunissant les données nécessaires à l'analyse et à la comparaison avec les données INSEE

### Documentation et tests

- Documentation des modèles et des colonnes, avec tests génériques (schema.yml)
- Tests personnalisés SQL (tests/)

### Relation entre les modèles

Lineage des modèles représentant leurs dépendances 

<img src='/chart/0_lineage_dbt.png' width=80%>

---
## Transformations principales 

- Nettoyage et standardisation des données sources
- Déduplication des étudiants selon une règle métier
- Normalisation des catégories et des noms de régions
- Transformation et préparation des données INSEE
- Enrichissement des données étudiants avec les données démographiques INSEE
- Agrégation des données pour produire les indicateurs analytiques

---
## Indicateurs analysés 

- Répartition des étudiants par genre, tranche d'âge et région ;
- Evolution des indicateurs entre 2022 et 2025 ; 
- Comparaison du profil des étudiants avec celui de la population française.

---
## Résultats principaux 

### Combien d'étudiants OpenClassrooms étaient inscrits dans le parcours de formation data entre 2022 et 2025?

L'échantillon contient **4 010 étudiants distincts** sur la période étudiée.

---
### Comment les effectifs évoluent-ils ?

**2022 est l’année qui compte le plus d’étudiants inscrits**, avec 1 696 étudiants, suivie d'une forte décroissance dans les années suivantes, soit −61 % en deux ans, puis une legère hausse en 2025 (727, +11 %).

<img src='/chart/1_students_over_time.png' width=60%>

---
### Premier constat sociodémographique : le genre

**Les femmes sont fortement sous-représentées parmi les étudiants** et l'écart avec la population française reste globalement stable entre 2022 et 2025.

<img src='/chart/2_gender_distribution.png' width=60%>

Les hommes représentent 50 % des étudiants, contre 22,9 % de femmes et 27,1 % de genre inconnu. La population française est, elle, proche de la parité (51,5 % femmes / 48,5 % hommes).

<img src='/chart/3_gender_over_time.png' width=70%>

La part des femmes progresse continuellement : de 17,8 % en 2022 à 31,6 % en 2025, tandis que la part des hommes augmente surtout à partir de 2024 (de 40,6 % à 64,2 % entre 2022 et 2025). 

Cette comparaison est désormais à interpréter avec prudence car entre 2022–2023 on observe une forte proportion de données non renseignées (genre unknown).

La forte baisse du genre inconnu (de 41,6 % à 4,1 %) à partir de 2024 indique toutefois une amélioration importante de la qualité des données.

---
### Deuxième dimension : l’âge

**Le profil des étudiant est structurellement beaucoup plus jeune que celui de la population française**, avec une concentration particulièrement forte entre 25 et 39 ans, et une quasi-absence des 60 ans et plus.

<img src='/chart/4_age_distribution.png' width=60%>

les étudiants sont fortement concentrés entre 25 et 44 ans, notamment 30–34 ans (25,6 %) et 25–29 ans (19,9 %). Les 60 ans et plus sont très minoritaires (1,6 %).

<img src='/chart/5_age_over_time.png' width=60%>

La structure d’âge évolue : les 20–24 ans progressent fortement (de 1,2 % à 9,9 %), tandis que les 30–34 ans restent un groupe majeur. La part des 60+ reste marginale.

---
### Troisième dimension : le territoire

**Forte concentration des étudiants en Île-de-France**, qui reste la **région la plus surreprésentée** malgré une diminuition de sa part au fil de la période.

<img src='/chart/6_region_distribution.png' width=60%>

l’Île-de-France domine très nettement avec 45,2 % des étudiants, contre 18,3 % de la population française. Les autres régions sont globalement sous-représentées.

<img src='/chart/7_region_over_time.png' width=60%>

L’Île-de-France reste surreprésentée, mais son poids baisse fortement entre 2022 et 2024 avant de remonter légèrement en 2025. En 2025, son écart avec son poids démographique reste positif (+2,18 points).

---
### Croisement territoire vs genre : le phénomène est généralisé

**Les femmes restent sous-représentées dans la majorité des régions**, tandis que la **représentation masculine est supérieure à celle observée dans la population**. 

<img src='/chart/8_region_genre_distribution.png' width=60%>

---
### Zoom temporel et territorial : l’intensité du déséquilibre varie fortement selon les régions

La part des femmes progresse dans plusieurs régions entre 2024 et 2025, mais **le déséquilibre de genre reste très marqué**.

En 2025, le Centre-Val de Loire présente l’écart le plus faible (-12,9 points), avec 38,5 % de femmes, contre -53 points dans les DROM, où aucune femme n’est représentée dans l'échantillon observé.

<img src='/chart/9_region_genre_over_time.png' width=70%>

Ces écarts doivent toutefois être interprétés avec prudence lorsque les effectifs régionaux sont faibles.

---
## Conclusion 

Le profil des étudiants évolue entre 2022 et 2025, mais trois caractéristiques dominent : 

- une population principalement **masculine**, concentrée sur les **25-39 ans** et fortement polarisée vers **l'Île-de-France**. 

La baisse importante du genre inconnu améliore la qualité de la comparaison et permets de mieux observer le déséquilibre femmes-hommes au fil du temps. 
Parallèlement, la concentration francilienne diminue fortement, tandis que le profil d'âge reste très éloigné de celui de la population de référence, avec une forte présence des adultes de 25 à 39 ans et une sous-représentation massive des 60 ans et plus.

---
## Limites du projet

### Données

- Période d’étude courte : 2022-2025 ne permet pas d'établir une tendance de long terme.
- Effectifs relativement faibles : certaines régions ou catégories d'âge ont peu d'étudiants, ce qui peut rendre les pourcentages plus sensibles aux variations.
- Proportion importante de valeurs inconnues pour le genre, particulièrement en 2022-2023.
- Pas de données permettant d'expliquer les causes des écarts observés. 
- Absence d'indicateurs contextuels régionaux (chômage, niveau de qualification, accès au numérique, mobilité, etc.).

### Technique

- `dbt docs serve` n'est pas disponible dans la version Fusion de dbt Cloud utilisée pour le projet, ce qui ne permets pas de visualiser la documentation générée.

---
## Refléxions stratégiques

### Accessibilité territoriale 

- La forte concentration en Île-de-France peut constituer un point de départ pour approfondir l'analyse de l'accès à la formation dans les autres territoires.

#### Actions

- Étudier les facteurs pouvant expliquer la sous-représentation de certaines régions avant d'envisager des campagnes de recrutement ciblées ;
- Explorer le développement de partenariats locaux dans les territoires identifiés comme sous-représentés.

### Egalité des chances 

- La surreprésentation masculine peut justifier une analyse complémentaire des facteurs pouvant expliquer l'accès des femmes à la formation ; 

#### Actions 

- Analyser les canaux de recrutement et les profils d'inscription afin d'identifier d'éventuels leviers pour améliorer la représentation des femmes ;
- Envisager des actions de communication ciblées sur la base des résultats de cette analyse complémentaire.

---
## Compétences mobilisées 

- SQL 
- dbt Cloud
- Configuration warehouse
- Version control Git/Github
- Modélisation des données
- Tests et documentation dbt
- Transformation et nettoyage des données
- Python/Pandas
- Analyse statistique et interprétation des données

---
## Environnement de travail

- Snowflake
- dbt Cloud
- VS Code (Python/Pandas)

---
## Règlement Général sur la Protection des Données - RGPD 

- Les données sources stockées dans Snowflake, sur l’infrastructure AWS EU-West, contiennent des données personnelles pseudonymisées via un identifiant unique, qui n’a pas été conservé dans les modèles analytiques. 
- Le modèle final contient uniquement des données agrégées et statistiques nécessaires à l’analyse sociodémographique des étudiants, en cohérence avec les principes de limitation des finalités (article 5.1.b) et de minimisation des données (article 5.1.c). 


--
### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
