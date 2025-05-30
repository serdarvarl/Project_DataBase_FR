---
title: "Rapport de groupe des UE \\newline  Bases de données + Sciences des Données 2"
author: ""
date: "04 May 2025"
output:
  pdf_document:
    fig_caption: yes
    keep_md: yes
    keep_tex: yes
    md_extensions: +raw_attribute
    number_sections: yes
    pandoc_args:
    - --top-level-division="chapter"
    - --bibliography="references.bib"
    template: template.tex
    toc: yes
    toc_depth: 1
  html_document:
    df_print: paged
    toc: yes
    toc_depth: '2'
    output_file: "rapport_TDDT_2025.pdf"   # ça marche pas ça marche pas pas passssssssssssqsdqasdasd
  word_document:
    fig_caption: yes
    number_sections: yes
    pandoc_args: 
    - --top-level-division="chapter"
    - --to="odt+native_numbering"
    toc: yes
    toc_depth: '2'
toc-title: "Table des matières"
bibliography: references.bib
coursecode: TV15MI-TV25MI
csl: iso690-author-date-fr-no-abstract.csl
Acknowledgements:
- Nos plus sincères remerciements vont à notre encadrant pédagogique pour les conseils
  avisés sur notre travail.
- Nous remercions aussi ...
biblio-style: elsarticle-harv
session: 2025
team: TDDT
groupeTD : TD1 
Abstract: |
  
  Notre projet vise à analyser les performances financières des entreprises françaises entre 2012 et 2016 à partir des données du Registre National du Commerce et des Sociétés (RNCS). Nous cherchons à comprendre quels sont les facteurs qui influencent la rentabilité des entreprises et comment ces dernières évoluent en fonction de leur secteur d’activité. Plus précisément, nous allons :
  - Comparer les performances des entreprises selon leur chiffre d'affaires et leur rentabilité.
  - Étudier l’impact de la fiscalité sur la profitabilité des entreprises.
  - Analyser l’évolution des ventes, des stocks et des taxes pour identifier des tendances économiques.
always_allow_html: True
---





# Introduction {.label:s-intro}

## Présentation du projet

Les données financières des entreprises jouent un rôle crucial dans la compréhension de leur santé économique. Ce projet se concentre sur l'analyse des performances financières des entreprises françaises entre 2012 et 2016, en utilisant les données fournies par le Registre National du Commerce et des Sociétés (RNCS).


\bigskip

\begin{itemize}[label=$\circ$]
    \item \textbf{Comparer les performances des entreprises selon leur chiffre d'affaires et leur rentabilité.}
    \item \textbf{Étudier l’impact de la fiscalité sur la profitabilité des entreprises.}
    \item \textbf{Analyser l’évolution des ventes, des stocks et des taxes pour identifier des tendances économiques.}
\end{itemize}


\medskip 

## Responsabilités et composition de l’équipe


\medskip

MOUTCHACHOU Lydia : N°Étudiant 22212656

IBNMTAR Hazem :N°Étudiant 22309227

BERETTI--PRENANT Esteban : N°Étudiant 22208752

VAROL Serdar : N°Étudiant 22009668




\bigskip
## Objectifs et questions de recherche

Notre projet vise à analyser les performances financières des entreprises françaises entre 2012 et 2016. Pour ce faire, nous allons examiner plusieurs facteurs qui pourraient influencer la rentabilité des entreprises. Les questions spécifiques que nous allons aborder sont les suivantes :

\medskip

 **Comparaison de la rentabilité par rapport au chiffre d'affaires :**

 a. Comment la rentabilité varie-t-elle en fonction de la taille de l'entreprise ?

 b. Y a-t-il une différence notable entre les entreprises qui ont recours au refinancement et celles qui n'en ont pas besoin ?
 
 
 **Comparaison de la rentabilité par rapport au chiffre** 

 a. La rentabilité des entreprises diffère-t-elle selon la ville où elles sont implantées ?

 b. Les entreprises qui exportent leurs produits ou services sont-elles plus rentables que celles qui opèrent uniquement sur le marché national ?
 
 
 
  **Impact fiscal et sectoriel :**

 a. Quel est l'impact des taxes sur la rentabilité des entreprises ?

 b. Comment la rentabilité varie-t-elle selon le secteur d'activité des entreprises ?


 **Évolution temporelle :**

 a. Comment la rentabilité des entreprises a-t-elle évolué entre 2012 et 2016 ?

 b. Peut-on identifier des tendances spécifiques ou des périodes de croissance/déclin dans les performances financières des entreprises ?
 

\medskip
En répondant à ces questions, pour des raisons de temps, nous avons dû restreindre le nombre de questions étudiées et sélectionner quelques facteurs clés, afin de proposer une diversité de graphiques, de points de vue et de représentations. À travers cette approche, nous espérons identifier les principaux facteurs influençant la rentabilité des entreprises françaises

\medskip



# Base de données

## Provenance des données
<!-- serdar varol -->

Les données utilisées dans ce projet proviennent du jeu de données Kaggle :
\medskip

\begin{itemize}[label=$\circ$]
  \item \textnormal{\textbf{Profit and loss \- Ontology.csv :} Contient les comptes de résultat de 100 000 entreprises françaises, avec des informations détaillées sur les revenus, les dépenses et les bénéfices.}
  
  \item \textnormal{\textbf{APE\_Fusion.csv :} Utilise le code APE pour classer les entreprises selon leur secteur d’activité, permettant des comparaisons sectorielles précises.}

  \item \textnormal{\textbf{Data\_Kaggle.csv :} Fournit des données globales sur les entreprises, incluant les ventes, les stocks et les taxes, permettant d'analyser l’évolution des performances financières sur plusieurs années.}
\end{itemize}

\medskip

\textit{Lien vers les données :} \href{https://www.kaggle.com/datasets/briaclg/financial-data-of-french-compagnies/data?select=Profit+and+loss+-+Onthology.csv}{Kaggle Dataset}





## Descriptif des tables
\bigskip

### Table 1: APE_Fusion.csv
\begin{table}[H]
\centering
\scriptsize
\begin{tabular}{|p{3.2cm}|p{1.2cm}|p{7.5cm}|p{2.5cm}|}
\hline
\textbf{Nom colonne} & \textbf{Type} & \textbf{Signification} & \textbf{Caractéristique} \\
\hline
Unname d: 0 & int & Index ou identifiant de ligne (peut être ignoré dans l'analyse) & \\
\hline
ape & object & Code APE complet de l'activité principale de l'entreprise & Clé primaire \\
\hline
ape\_name & object & Nom ou description de l'activité correspondant au code APE & \\
\hline
ape\_len & int & Longueur du code APE, indiquant le nombre de caractères qu'il contient & \\
\hline
ape\_cat0 & int & Premier niveau du code APE (division), composé des 2 premiers chiffres & \\
\hline
ape\_cat1 & float & Deuxième niveau du code APE (groupe), composé des 3 premiers chiffres & \\
\hline
ape\_cat2 & float & Troisième niveau du code APE (classe), composé des 4 premiers chiffres & \\
\hline
ape\_cat3 & object & Dernier niveau du code APE (sous-classe) & \\
\hline
Libellé & object & Description du secteur d'activité auquel appartient le code APE & \\
\hline
Code & object & Code alphabétique supplémentaire associé au secteur d'activité & \\
\hline
\end{tabular}
\footnotesize
\label{tab:ape_description}
\end{table}



### Table 2 : Profit and loss - Ontology.csv

\begin{table}[H]
\centering
\scriptsize
\begin{tabular}{|p{4cm}|p{2cm}|p{9cm}|}
\hline
\textbf{Nom colonne} & \textbf{Type} & \textbf{Signification} \\
\hline
Columns\_(FR/EN) & varchar & Colonnes des états financiers en français et en anglais \\
\hline
Description (FR) & varchar & Explication de ce que chaque colonne représente \\
\hline
Liasse (Id) & int & Identifiant unique des colonnes dans la base INPI \\
\hline
Calcul & varchar & Méthode de calcul pour certaines valeurs dans les colonnes \\
\hline
\end{tabular}
\normalsize
\end{table}


### Table 3 : Data_Kaggle.csv

\scriptsize
\begin{longtable}{|p{0.7cm}|p{12cm}|p{1.5cm}|}
\hline
\textbf{N\textdegree} & \textbf{Variable} & \textbf{Code} \\
\hline \endfirsthead
\hline \textbf{N\textdegree} & \textbf{Variable Nome} & \textbf{Nome de Colon} \\ \hline \endhead
1 & year & B \\
2 & Autres imp\^ots, taxes et versements assimil\'es & C \\
3 & Ventes de marchandises & D \\
4 & Production vendue biens & E \\
5 & Production vendue services & F \\
6 & Chiffres d\'affaires nets & G \\
7 & Production stock\'ee & H \\
8 & Production immobilis\'ee & I \\
9 & Subventions d\'exploitation & J \\
10 & Reprises sur amortissements et provisions, transfert de charges & K \\
11 & Autres produits & L \\
12 & Total des produits d\'exploitation & M \\
13 & Achats de marchandises (y compris droits de douane) & N \\
14 & Variation de stock (marchandises) & O \\
15 & Achats de mati\`eres premi\`eres et autres approvisionnements & P \\
16 & Variation de stock (mati\`eres premi\`eres et approvisionnements) & Q \\
17 & Autres achats et charges externes & R \\
18 & Imp\^ots, taxes et versements assimil\'es & S \\
19 & Salaires et traitements & T \\
20 & Charges sociales & U \\
21 & Autres charges & V \\
22 & Total des charges d\'exploitation & W \\
23 & R\'esultat d'exploitation & X \\
24 & B\'en\'efice attribu\'e ou perte transf\'er\'ee & Y \\
25 & Perte support\'ee ou b\'en\'efice transf\'er\'e & Z \\
26 & Produits financiers de participations & AA \\
27 & Produits des autres valeurs mobili\`eres et cr\'eances de l\'actif immobilis\'e & AB \\
28 & Autres int\'er\^ets et produits assimil\'es & AC \\
29 & Reprises sur provisions et transferts de charges financier & AD \\
30 & Diff\'erences positives de change & AE \\
31 & Produits nets sur cessions de valeurs mobili\`eres de placement & AF \\
32 & Total des produits financiers & AG \\
33 & Dotations financi\`eres sur amortissements et provisions & AH \\
34 & Int\'er\^ets et charges assimil\'ees & AI \\
35 & Diff\'erences n\'egatives de change & AJ \\
36 & Charges nettes sur cessions de valeurs mobili\`eres de placement & AK \\
37 & Total des charges financi\`eres & AL \\
38 & R\'esultat financier & AM \\
39 & R\'esultat en cours avant imp\^ots & AN \\
40 & Produits exceptionnels sur op\'erations de gestion & AO \\
41 & Produits exceptionnels sur op\'erations en capital & AP \\
42 & Reprises sur provisions et transferts de charges exceptionnel & AQ \\
43 & Total des produits exceptionnels & AR \\
44 & Charges exceptionnelles sur op\'erations de gestion & AS \\
45 & Charges exceptionnelles sur op\'erations en capital & AT \\
46 & Dotations exceptionnelles aux amortissements et provisions & AU \\
47 & Total des charges exceptionnelles & AV \\
48 & R\'esultat exceptionnel & AW \\
49 & Participation des salari\'es aux r\'esultats de l\'entreprise & AX \\
50 & Imp\^ots sur les b\'en\'efices & AY \\
51 & Total des produits & AZ \\
52 & Total des charges & BA \\
53 & B\'en\'efices ou perte (Total des produits - Total des charges) & BB \\
54 & Imp\^ots diff\'er\'es (compte de r\'esultat) & BC \\
55 & R\'esultat net des soci\'et\'es mises en \'equivalence & BD \\
56 & R\'esultat net des entreprises int\'egr\'ees & BE \\
57 & R\'esultat Groupe (R\'esultat net consolid\'e) & BF \\
58 & Part des int\'er\^ets minoritaires (R\'esultat hors groupe) & BG \\
59 & R\'esultat net part du groupe (part de la soci\'et\'e m\`ere) & BH \\
60 & R\'emun\'eration d\'interm\'ediaires et honoraires (hors r\'etrocessions) & BI \\
61 & Location, charges locatives et de copropri\'et\'e & BJ \\
62 & Effectif moyen du personnel & BK \\
63 & Sous-traitance & BL \\
64 & Personnel ext\'erieur \`a l\'entreprise & BM \\
65 & R\'etrocessions d\'honoraires, commissions et courtages & BN \\
66 & Taxe professionnelle & BO \\
67 & Montant de la TVA. collect\'ee & BP \\
\hline
\end{longtable}
\normalsize
\scriptsize
\begin{longtable}{|p{0.7cm}|p{12cm}|p{1.5cm}|}
\hline
\textbf{N\textdegree} & \textbf{Variable} & \textbf{Code} \\
\hline \endfirsthead
\hline \textbf{N\textdegree} & \textbf{Variable Nome} & \textbf{Nome de Colon} \\ \hline \endhead
68 & Total TVA. d\'eductible sur biens et services & BQ \\
69 & Dividendes & BR \\
70 & siren & BS \\
\hline
\end{longtable}
\normalsize

\newpage
## Modèles MCD et MOD
<!-- serdar varol -->
<!-- esteban beretti -->
- Pour le MCD, inclure une image réalisée avec le logiciel Mocodo \href{https://www.mocodo.net/?mcd=eNqNksFu2zAMhu96Ch0dQAOW7Zab67ZK2zTL4ixtcjEUh14FOJKhyFm3N_J9b-AX62_HaOMEAwb4Ay1SIvlLjMvNQRmvrRnxWDsywe3DQPD43R296MwRCw9Wu7AgMRzy2Ka6rnxdieGUwyfJsKMZNUsBpmrX2kj5z50ddvZLZ7-Kid5QniNNZLfEMoXyTTWUC7OM3EWpLpggiq2j0BgixhyldLClQ8uC945wnPkQ0u1_D49auYJfk7E7fdwjeNNKYfde5WJhf8GBZtlM_SYXvSj380w_b7tq_Ena3lNX5KzT05u9DcE1kOAePIIp-AZm4DuYM3bzWljnyc2c3ZbaX9btAv3CSzJbR01Il_97pi-g12sMFuAHWIIn8AxWYC24_PNp9cxGDN9Z5pMsEiLlA5gAiJUQKyFWQuwYlzG-AhHApaxvBF8h-WrNIrsrvNroXHtqH79Z05z2Ze5VTxm_nA1xoVX866VO0_bEz-uqdfqEXovcavxhQgIpe7FMG2VSTS6Qy4H48Ktm6hK9K-q_fh_Ip7OEKRVNNkN5ML5DbGExcUlxbHkfjCcDcXSlbc_wPGLXVV2Zusp0SklBGI5gPB2wN-SeTJ4=}{https://www.moc\\odo.net} telle que celle visible sur la Figure$~$\ref{MCD} ci-dessous :
  
![MCD](image_sql/MCD.png){#MCD width=8cm height=10cm }  

- Pour le MOD, inclure les images réalisée avec le logiciel MySQL, telle que celles visible sur la Figure ci-dessous :

![MOD](image_sql/mssql_1.png){#M0D width=10cm height=5cm}





![MOD Table Total](image_sql/mcd_totat.png){#MOD_total width=15cm height=5cm}


![Societe Table](image_sql/societe.png){#Societe width=15cm height=5cm}


![Charge Chiffre](image_sql/charge_chiffre.png){#charge_chiffre width=15cm height=5cm}


![Chiffre affaire](image_sql/chiffre_affaire.png){#Chiffre_affaire width=15cm height=5cm}


![Compte de Résultat](image_sql/compte_resulta.png){#compte_resulta width=15cm height=5cm}


![Produit Chiffre](image_sql/produit_chiffre.png){#produit_chiffre width=15cm height=5cm}


![Subvention](image_sql/subvention.png){#subvention width=15cm height=3cm}






\newpage

\bigskip
## Import des données 

### Import des données 
<!-- hazem inbmtar -->
\bigskip

Dans un premier temps, les données ont été chargées dans R à l'aide de la fonction $read\_csv()$.
Ensuite, afin de faciliter l'importation de ces données dans phpMyAdmin, nous avons procédé à
un découpage (slicing) de la base initiale en sept tables distinctes, chacune regroupant les
variables pertinentes pour son thème spécifique.

\medskip

Par exemple, pour la table *"société"*, nous avons conservé uniquement les colonnes suivantes :
*"siren", "denomination", "postal_code", "town" et "ape".*

Ce processus a été appliqué à chaque table en sélectionnant les attributs nécessaires, puis
nous avons limité chaque sous-table à ses 300 premières lignes afin de simplifier les tests
d’importation.

\medskip

Enfin, les tables ont été exportées au format CSV à l’aide de la fonction $write\_csv$.

\medskip

Dans un premier temps, nous avions extrait les **300** premières lignes de la base de données
globale. Toutefois, afin d'obtenir un échantillon plus équilibré et représentatif dans le
temps, nous avons modifié notre approche : nous avons sélectionné les **100 premières** lignes
pour chaque année, de **2012** à **2016.**

\medskip

Pour cela, nous avons utilisé la bibliothèque sqldf dans R, qui permet d'exécuter des requêtes
SQL directement sur des data frames. Par exemple, pour extraire les données de l’année 2012,
nous avons utilisé la requête suivante :


``` r
annee_2012 <- sqldf("SELECT * FROM data_kaggle WHERE year = 2012")
```

\medskip

Cette commande retourne toutes les colonnes de la base data_kaggle pour les lignes dont
l’année est égale à 2012.

\medskip

Nous avons ensuite appliqué la même méthode (voir le code\ref{codeR_slicing}) pour chaque année (**2012 à 2016**), puis extrait les 100 premières lignes de chaque sous-ensemble. Enfin, nous avons combiné ces sous-ensembles
afin d’obtenir une table finale regroupant **500 lignes** (100 par année). Cette nouvelle table
est ainsi mieux structurée pour les futures analyses et pourra être importée dans phpMyAdmin
pour les étapes suivantes de notre projet.

\medskip

Lors de l’importation de données sur phpMyAdmin, on a rencontré un petit problème : la colonne
était trop longue pour être insérée dans la table. Du coup, on a modifié simplement le nom de
la colonne. Elle était : **« Produits des autres valeurs mobilières et créances de l’actif immobilisé » ** 
et on l’a changée pour : **« Produits des autres valeurs mobilières »**.

\medskip

   Cette commande retourne toutes les colonnes de la base data_kaggle pour les lignes dont l’année est **égale à 2012**.
Nous avons ensuite appliqué la même méthode pour chaque année (2012 à 2016), puis extrait **les 100 premières lignes** de chaque sous-ensemble. Enfin, nous avons combiné ces sous-ensembles afin d’obtenir une **table finale regroupant 500 lignes (100 par année)**. Cette nouvelle table est ainsi mieux structurée pour les futures analyses et pourra être **importée dans phpMyAdmin** pour les étapes suivantes de notre projet.


### Traitement des données

Pour assurer la qualité et l'intégrité de nos données, plusieurs étapes de traitement ont été réalisées.

Tout d'abord, afin de garantir l'unicité de chaque société dans la table `chiffre_affaire`, nous avons identifié les éventuels doublons grâce à la requête suivante :


``` sql
SELECT siren, COUNT(*) AS occurrences
FROM chiffre_affaire
GROUP BY siren
HAVING COUNT(*) > 1;
```

Lorsque plusieurs occurrences pour un même `siren` étaient détectées, le processus suivant a été appliqué :

- Ajout d'une colonne `id` pour identifier chaque ligne de façon unique :


``` sql
ALTER TABLE chiffre_affaire ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;
```

- Suppression des doublons en conservant uniquement la première occurrence de chaque `siren` :


``` sql
DELETE FROM chiffre_affaire
WHERE id NOT IN (
    SELECT * FROM (
        SELECT MIN(id)
        FROM chiffre_affaire
        GROUP BY siren
    ) AS temp
);
```

- Suppression de la colonne `id` devenue inutile après le nettoyage :


``` sql
ALTER TABLE chiffre_affaire DROP COLUMN id;
```

Ce nettoyage a permis de garantir que chaque `siren` est unique dans la table, condition indispensable pour la création de relations entre les tables.

Ensuite, nous avons mis en place une table de référence `societe` regroupant toutes les entreprises. Les autres tables (`produit_chiffre`, `charge_chiffre`, `subvention`, `compte_resultat`, `chiffre_affaire`) ont été reliées à cette table par des clés étrangères, selon les commandes suivantes :

\newpage


``` sql
ALTER TABLE produit_chiffre
ADD CONSTRAINT fk_produit_chiffre_siren 
FOREIGN KEY (siren) REFERENCES societe(siren);

ALTER TABLE charge_chiffre
ADD CONSTRAINT fk_charge_chiffre_siren 
FOREIGN KEY (siren) REFERENCES societe(siren);

ALTER TABLE subvention
ADD CONSTRAINT fk_subvention_siren 
FOREIGN KEY (siren) REFERENCES societe(siren);

ALTER TABLE compte_resultat
ADD CONSTRAINT fk_compte_resultat_siren 
FOREIGN KEY (siren) REFERENCES societe(siren);

ALTER TABLE chiffre_affaire
ADD CONSTRAINT fk_chiffre_affaire_siren 
FOREIGN KEY (siren) REFERENCES societe(siren);
```

\medskip


**Grâce à ce travail, nous avons pu structurer une base de données fiable, cohérente, et robuste pour l'ensemble de nos analyses.**



\newpage


\newpage





\newpage

## Requêtes réalisées

1) Pour comperer et trouver selon leur code postal 
<!-- serdar varol -->



``` sql

SELECT 
    LEFT(postal_code, 2) AS departement,  --Extraction du code département (2 premier )
    COUNT(*) AS nombre_entreprises        -- Counter department
FROM 
    societe -- table source
WHERE 
    postal_code IS NOT NULL -- si null n'utilse pas
GROUP BY 
    departement --regroper par department
ORDER BY 
    nombre_entreprises DESC; --trie les resulta 

```


![Code postal](image_sql/sql_1_Serdar.png){ width=5cm height=10cm}

\newpage

2) Regrouper nombre de entreprise par codepostal


``` sql
SELECT 
    s.siren,
    s.denomination,
    s.postal_code,
    cr."Chiffres d'affaires nets" AS chiffre_affaires_net
FROM 
    societe s
JOIN 
    compte_resultat cr ON s.siren = cr.siren
WHERE 
    LEFT(s.postal_code, 2) = "44";

```

![Code postal](image_sql/sql_2_serdar.png){ width=10cm height=7cm}

\newpage

3) Lister les entreprises les plus rentables (top 10)
<!-- lydia MOUTCHACHOU -->
 
\medskip

| Étape                          | Description                                                        |
|:-------------------------------|:-------------------------------------------------------------------|
| **1. Sélection des colonnes**  | • **s.siren** : Identifiant de l’entreprise<br>• **s.denomination** : Nom de l’entreprise<br>• **total_chiffre_affaires** : `SUM(CAST(ca.Chiffres d’affaires nets AS DECIMAL))` |
| **2. Jointure**                | Table `societe` jointe à `chiffre_affaire` sur le champ `siren`    |
| **3. Condition WHERE**         | Exclusion de `ca.Chiffres d’affaires nets = 'NA'`                  |
| **4. Groupement & Tri**        | `GROUP BY s.siren, s.denomination`<br>`ORDER BY total_chiffre_affaires DESC` |
| **5. Limitation**              | `LIMIT 10`                                                         |



``` sql

  SELECT 
    s.siren, 
    s.denomination, 
    SUM(CAST(ca.`Chiffres d’affaires nets` AS DECIMAL)) 
      AS total_chiffre_affaires
  FROM societe AS s
  JOIN chiffre_affaire AS ca 
    ON s.siren = ca.siren
  WHERE ca.`Chiffres d’affaires nets` <> 'NA'
  GROUP BY s.siren, s.denomination
  ORDER BY total_chiffre_affaires DESC
  LIMIT 10;
```

![Max 10 Chiffre d'affaire](image_sql/max_10_CA.png){ width=10cm height=8cm}


4) Comparer le chiffre d'affaires moyen par secteur d'activité (APE)
 <!-- lydia MOUTCHACHOU -->
\medskip

| Étape                          | Description                                                        |
|:-------------------------------|:-------------------------------------------------------------------|
| **1. Sélection des colonnes**  | • **a.ape** : Code du secteur d'activité<br>• **a.ape_name** : Nom du secteur d'activité<br>• **chiffre_affaires_moyen** : `AVG(CAST(ca.Chiffres d’affaires nets AS DECIMAL))` |
| **2. Jointures**               | • `societe` jointe à `chiffre_affaire` sur `siren`<br>• `societe` jointe à `apegen` sur `ape` |
| **3. Condition WHERE**         | Exclusion de `ca.Chiffres d’affaires nets = 'NA'`                  |
| **4. Groupement & Tri**        | `GROUP BY a.ape, a.ape_name`<br>`ORDER BY chiffre_affaires_moyen DESC` |

\medskip

``` sql

SELECT 
  a.ape, 
  a.ape_name, 
  AVG(CAST(ca.`Chiffres d’affaires nets` AS DECIMAL)) 
  AS chiffre_affaires_moyen 
FROM 
  societe s 
  JOIN chiffre_affaire ca ON s.siren = ca.siren 
  JOIN apegen a ON s.ape = a.ape 
WHERE 
  ca.`Chiffres d’affaires nets` != 'NA' 
GROUP BY 
  a.ape, 
  a.ape_name 
ORDER BY 
  chiffre_affaires_moyen DESC;

```


![Comparer le chiffre d'affaires moyen par secteur d'activité (APE)](image_sql/compere_APE.png){ width=10cm height=5cm}


5)  Moyenne des salaires par secteur d'activité (APE) et par année
<!-- lydia MOUTCHACHOU -->
\medskip

| Étape                          | Description                                                                                                    |
|:-------------------------------|:---------------------------------------------------------------------------------------------------------------|
| **1. Sélection des colonnes**  | • **a.ape** : Code du secteur d'activité<br>• **a.ape_name** : Nom du secteur d'activité<br>• **ce.year** : Année des données<br>• **moyenne_salaires** : `AVG(CAST(ce.Salaires et traitements AS DECIMAL))` |
| **2. Jointures**               | • `societe` jointe à `charge_chiffre` sur `siren`<br>• `societe` jointe à `apegen` sur `ape`                    |
| **3. Condition WHERE**         | Exclusion de `ce.Salaires et traitements = 'NA'`                                                               |
| **4. Groupement & Tri**        | `GROUP BY a.ape, a.ape_name, ce.year`<br>`ORDER BY ce.year, moyenne_salaires DESC`                              |



``` sql
SELECT 
  a.ape, 
  a.ape_name, 
  ce.year, 
  AVG(CAST(ce.`Salaires et traitements` AS DECIMAL)) AS moyenne_salaires 
FROM societe s JOIN
  charge_chiffre ce ON s.siren = ce.siren JOIN apegen a ON s.ape = a.ape WHERE ce.`Salaires et traitements` != 'NA' GROUP BY 
  a.ape,
  a.ape_name, 
  ce.year 
ORDER BY 
  ce.year,
  moyenne_salaires DESC

```

![Moyenne des salaires par secteur d'activité (APE) et par année)](image_sql/ape_moyen.png){ width=10cm height=5cm}

\newpage

6)Lister les entreprises qui ont des taxes élevées mais une faible rentabilité
<!-- lydia MOUTCHACHOU -->
\medskip

| Étape                          | Description                                                                                                                         |
|:-------------------------------|:------------------------------------------------------------------------------------------------------------------------------------|
| **1. Sélection des colonnes**  | • **s.siren** : Identifiant de l’entreprise<br>• **s.denomination** : Nom de l’entreprise<br>• **perte** : `cr.Bénéfices ou perte (Total des produits – Total des charges) AS perte` |
| **2. Jointure**                | `societe` jointe à `compte_resultat` sur le champ `siren`                                                                             |
| **3. Conditions WHERE**        | • Exclusion de `cr.Bénéfices ou perte … = 'NA'`<br>• `CAST(cr.Bénéfices ou perte … AS SIGNED) < 0` (résultat net négatif)              |
| **4. Tri**                     | `ORDER BY perte ASC`     


``` sql
SELECT 
  s.siren, 
  s.denomination, 
  cr.`Bénéfices ou perte (Total des produits ‐ Total des charges)` AS perte
FROM 
  societe s
JOIN 
  compte_resultat cr 
ON 
  s.siren = cr.siren
WHERE 
  cr.`Bénéfices ou perte (Total des produits ‐ Total des charges)` != 'NA'
  AND CAST(cr.`Bénéfices ou perte (Total des produits ‐ Total des charges)` AS SIGNED) < 0
ORDER BY 
  perte ASC;

```

![Lister les entreprises](image_sql/liste_taxe_faible){ width=10cm height=5cm}
\newpage

7) Les entreprises avec un chiffre d’affaires net > 100M€ : 
\medskip

| Étape                         | Description                                                                                                    |
|:------------------------------|:---------------------------------------------------------------------------------------------------------------|
| **1. Sélection des colonnes** | • **s.siren** : Identifiant de l'entreprise<br>• **s.denomination** : Nom de l'entreprise<br>• **chiffre_affaires** : `ca.Chiffres d’affaires nets` |
| **2. Jointure**               | `societe` jointe à `chiffre_affaire` sur le champ `siren`                                                        |
| **3. Conditions WHERE**       | • Exclusion de `ca.Chiffres d’affaires nets = 'NA'`<br>• `CAST(ca.Chiffres d’affaires nets AS DECIMAL) > 100000000` |
| **4. Tri**                    | `ORDER BY chiffre_affaires DESC`                                                                                |





``` sql

SELECT s.siren, s.denomination, ca.`Chiffres d’affaires nets` 
  AS chiffre_affaires 
FROM societe s 
  JOIN chiffre_affaire ca 
  ON s.siren = ca.siren 
WHERE
ca.`Chiffres d’affaires nets` != 'NA' 
  AND CAST(ca.`Chiffres d’affaires nets` 
    AS DECIMAL) > 100000000 
    ORDER BY chiffre_affaires DESC

```
![chiffre d’affaires net > 100M€](image_sql/yuzMilyon.png){ width=8cm height=5cm}


\newpage

8) Les entreprises qui paient le plus de TVA collectée
\medskip

| Étape                          | Description                                                                                                  |
|:-------------------------------|:-------------------------------------------------------------------------------------------------------------|
| **1. Sélection des colonnes**  | • **s.siren** : Identifiant de l’entreprise<br>• **s.denomination** : Nom de l’entreprise<br>• **tva_collectee** : `pc.Montant de la TVA collectée` |
| **2. Jointure**                | `societe` jointe à `produit_chiffre` sur `siren`                                                             |
| **3. Condition WHERE**         | Exclusion de `pc.Montant de la TVA collectée = 'NA'`                                                         |
| **4. Tri & Limitation**        | `ORDER BY CAST(pc.Montant de la TVA collectée AS DECIMAL) DESC`<br>`LIMIT 10`                                |





![TVA collectée](image_sql/tva_collecte.png){ width=8cm height=5cm}


\newpage

# Matériel et Méthodes

## Logiciels

Nous avons utilisé ces logiciels lors de la réalisation de notre projet :


  - Pretraitment : Libre Office
  - Stocker Base Donnée : Mysql /MAMP
  - Traitment statistique et ecrit: R
  - Correction/ replacement:  Regex
  - Version control : GitHUB
  - L'IA : OpenAI et MISTRAL
  - Vidéo et présentation : CANVA 
  


\bigskip

Voici lien de github notre projet :  \href{https://github.com/serdarvarl/Project_DataBase_FR.git}{TDDT github}
 




# Analyse et Résultats

## **Comparer les catégories d'entreprises en fonction des Chiffres d'affaires nets**

<!-- lydia Moutchachou -->

\bigskip
**Variables :** Chiffres d’affaires nets , catégories (Effectif moyen du personnel)

### Les catégories d’entreprises :
\bigskip
\scriptsize
\begin{quote}
\textit{L’article 51 de la loi n°2008-776 du 4 août 2008 de modernisation de l’économie (\textbf{LME}) détermine, pour les besoins de l’analyse statistique, un classement des entreprises en quatre catégories : les microentreprises, les petites et moyennes entreprises (\textbf{PME}), les entreprises de taille intermédiaire (\textbf{ETI}) et les grandes entreprises.\\ \\Le décret n° 2008-1354 du 18 décembre 2008 précise les critères permettant de déterminer l’appartenance à une catégorie d'entreprises.}
\end{quote}
\normalsize

\begin{itemize}[label=$\circ$]
  \item \textnormal{ \textbf{La microentreprise} est une entreprise dont l'effectif est inférieur à 10 personnes et dont le chiffre d'affaires ou le total du bilan annuel n'excède pas 2 millions d'euros}
\item \textnormal{ \textbf{la PME} est une entreprise dont l’effectif est inférieur à 250 personnes
et dont le chiffre d’affaires annuel n'excède pas 50 millions d'euros ou
dont le total de bilan n'excède pas 43 millions d'euros }
\item \textnormal{\textbf{L'ETI}, entreprise de taille intermédiaire, est une entreprise qui n'appartient pas à la catégorie des PME, dont l’effectif est inférieur à 5000 personnes et dont le chiffre d'affaires annuel n'excède pas 1 500 millions d'euros ou dont le total de bilan n'excède pas 2 000 millions d'euros}
\item \textnormal{\textbf{La grande entreprise} est une entreprise qui ne peut pas être classée
dans les catégories précédentes}
\end{itemize}


\newpage

### Analyse Univariée des Catégories d'Entreprises

\medskip

Introduction :
Dans cette section, nous réalisons une analyse univariée des catégories d'entreprises pour les années 2012 à 2016.
L'objectif est de comprendre la répartition des entreprises selon leur taille, classée en quatre catégories :
Microentreprises, PME (Petites et Moyennes Entreprises), ETI (Entreprises de Taille Intermédiaire), et Grandes Entreprises.

\medskip

Cette analyse permet de visualiser la distribution des entreprises et d'identifier les tendances au fil des années.
\medskip


Pour chaque année, nous comptons le nombre d'entreprises dans chaque catégorie et calculons les pourcentages correspondants.

\medskip
On répresente par :
\medskip

  - Diagramme Circulaire : pour illustrer la répartition en pourcentage des entreprises par catégorie.



\newpage

Appliquer la fonction à chaque année

\medskip 

1) Année 2012 :

```
## 
##             ETI Microentreprise             PME 
##               4             152              51 
## 
##             ETI Microentreprise             PME 
##        1.932367       73.429952       24.637681
```

![](TDDT_projet_L_2_files/figure-latex/analyse_univariee_2012-1.pdf)<!-- --> 

Répartition :
  - Microentreprises : 73.43%
  - PME : 24.64%
  - ETI : 1.93%

  Interprétation :
En 2012, la majorité des entreprises étaient des microentreprises, suivies par les PME. Les ETI représentaient une très petite proportion des entreprises.

\medskip

2) Année 2013 :


```
## 
##             ETI Microentreprise             PME 
##              18             736             351 
## 
##             ETI Microentreprise             PME 
##        1.628959       66.606335       31.764706
```

![](TDDT_projet_L_2_files/figure-latex/analyse_univariee_2013-1.pdf)<!-- --> 

\medskip
  Répartition :
  - Microentreprises : 66.61%
  - PME : 31.76%
  - ETI : 1.63%

  Interprétation :

\medskip
  
En 2013, bien que les microentreprises restent majoritaires, leur proportion a diminué par rapport à 2012, tandis que la part des PME a augmenté.

\medskip

3) Année 2014 :


```
## 
##               ETI Grande entreprise   Microentreprise               PME 
##                59                 9              1726               926 
## 
##               ETI Grande entreprise   Microentreprise               PME 
##         2.1691176         0.3308824        63.4558824        34.0441176
```

![](TDDT_projet_L_2_files/figure-latex/analyse_univariee_2014-1.pdf)<!-- --> 

Répartition :
  - Microentreprises : 63.46%
  - PME : 34.04%
  - ETI : 2.17%
  - Grandes Entreprises : 0.33%

\medskip

  Interprétation :
  En 2014, la proportion de microentreprises a continué de diminuer, tandis que celle des PME a augmenté. Les grandes entreprises apparaissent pour la première fois dans cette analyse.

\medskip

4) Année 2015 :

```
## 
##               ETI Grande entreprise   Microentreprise               PME 
##               173                 6              6071              3342 
## 
##               ETI Grande entreprise   Microentreprise               PME 
##        1.80358632        0.06255213       63.29232694       34.84153461
```

![](TDDT_projet_L_2_files/figure-latex/analyse_univariee_2015-1.pdf)<!-- --> 

\medskip
  Répartition :
  - Microentreprises : 63.29%
  - PME : 34.84%
  - ETI : 1.80%
  - Grandes Entreprises : 0.06%

  Interprétation :
  La tendance observée en 2014 se poursuit en 2015, avec une légère diminution des microentreprises et une augmentation des PME.

\medskip

6) Année 2016 :

```
## 
##               ETI Grande entreprise   Microentreprise               PME 
##               114                 4               412               832 
## 
##               ETI Grande entreprise   Microentreprise               PME 
##         8.3700441         0.2936858        30.2496329        61.0866373
```

![](TDDT_projet_L_2_files/figure-latex/analyse_univariee_2016-1.pdf)<!-- --> 


  Répartition :
  - Microentreprises : 30.25%
  - PME : 61.09%
  - ETI : 8.37%
  - Grandes Entreprises : 0.29%

\medskip

  Interprétation :
  En 2016, il y a une augmentation significative de la proportion des PME, qui deviennent la catégorie majoritaire. Les ETI montrent également une augmentation notable.

\medskip

  Conclusion :
  L'analyse univariée révèle des tendances intéressantes dans la répartition des entreprises par catégorie sur la période 2012-2016.
  Alors que les microentreprises dominaient initialement, leur proportion a diminué au fil des ans, tandis que celle des PME a augmenté.
  Les ETI et les grandes entreprises, bien que représentant une plus petite part du total, montrent des signes de croissance.
  Ces résultats peuvent être utilisés pour orienter les politiques de soutien aux entreprises en fonction de leur taille et pour anticiper les besoins futurs des différentes catégories d'entreprises.





\newpage
### Test Statistique :  ANOVA

\medskip

#### **2012**

\medskip




```
##              Df    Sum Sq   Mean Sq F value Pr(>F)    
## categorie     2 3.406e+16 1.703e+16   817.9 <2e-16 ***
## Residuals   204 4.248e+15 2.082e+13                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

- Détail du test : 

- **Df** : Cela indique les degrés de liberté pour chaque facteur (ici *categorie*) et les résidus.  
Nous avons 2 degrés de liberté pour les catégories et 204 pour les résidus.

- **Sum Sq** : La somme des carrés, qui mesure la variation expliquée par chaque facteur (ici, la variation expliquée par la catégorie d’entreprise) et par les résidus (erreur).

- **Mean Sq** : La moyenne des carrés, obtenue en divisant la somme des carrés par les degrés de liberté. Cela permet d’avoir une idée de la variance.

- **F value** : Le rapport entre la variance expliquée par les catégories et la variance résiduelle (erreur).  
Un F élevé (ici 817.9) indique qu'il existe une grande différence entre les groupes.

- **Pr(>F)** : La p-value associée au test F. Elle est ici inférieure à 2e-16, ce qui est très significatif.

- **Test de Signification**  
La p-value obtenue est extrêmement faible (< 2e-16), ce qui signifie que nous rejetons l'hypothèse nulle (H0) au seuil de signification de 5 % (0.05).  
En d'autres termes, il y a une différence statistiquement significative entre les moyennes des Chiffres d’affaires nets des différentes catégories d’entreprises.

- **Que signifie cette différence ?**   
Cela signifie que les entreprises de catégories différentes (par exemple, Microentreprise, PME, ETI, Grande entreprise) ont des Chiffres d’affaires nets très différents.  
Il est donc évident qu'une entreprise de type *Microentreprise* n'a pas la même performance en termes de chiffre d'affaires net qu'une PME ou une Grande entreprise.

- **Résumé**  
En 2012, les Chiffres d’affaires nets varient de manière significative en fonction de la catégorie d'entreprise.  
Cela signifie que les Microentreprises ne génèrent pas le même chiffre d'affaires net que les PME ou les Grandes entreprises.


\newpage



#### **2013**

\medskip




```
##               Df    Sum Sq   Mean Sq F value Pr(>F)    
## categorie      2 2.160e+17 1.080e+17   491.2 <2e-16 ***
## Residuals   1102 2.423e+17 2.198e+14                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

\medskip

- Détails du test  :

\medskip
    
- **Df** (degrés de liberté) : categorie : 2 (ce qui correspond à 3 catégories de classification : Microentreprise, PME, Grande entreprise)
 
- **Residuals** : 1102 (le nombre de données restantes après l application des catégories)


- **Sum Sq** (somme des carrés) : Pour la variable categorie, la somme des carrés est de 2.160e+17. Cela représente la variation expliquée par les différences entre les catégories.Pour les résidus, la somme des carrés est de 2.423e+17. Cela représente la variation non expliquée, c est-à-dire celle qui est attribuée aux erreurs ou à des facteurs non pris en compte dans le modèle.

- **Mean Sq** (moyenne des carrés) : Pour categorie, la moyenne des carrés est de 1.080e+17. Pour les résidus, la moyenne des carrés est de 2.198e+14.

- **F value** : La valeur de F est de 491.2, ce qui est très élevé. Cela indique une forte variation entre les catégories par rapport à la variation résiduelle.

- **Pr(>F)** : La valeur p associée à ce test est < 2e-16, ce qui est très inférieur à 0.05. Cela signifie que les différences entre les catégories sont statistiquement significatives.


- **Interprétation des résultats** : Le test ANOVA montre que la variable "Chiffres d'affaires nets" varie de manière significative en fonction de la catégorie dentreprise (Microentreprise, PME, Grande entreprise). La valeur p très faible (< 2e-16) nous permet de conclure que les moyennes des chiffres daffaires nets sont significativement différentes selon les catégories dentreprises.En dautres termes, il y a des différences importantes dans les chiffres daffaires nets entre les différentes catégories d entreprises (Microentreprises, PME et Grandes entreprises) pour lannée 2013.



- **Conclusion** : Le test ANOVA révèle que la taille de l entreprise (catégorie) est un facteur qui a un impact important sur le chiffre d affaires net des entreprises pour lannée 2013.

\newpage

 *Representation graphique boite a moustaches : *

![](TDDT_projet_L_2_files/figure-latex/unnamed-chunk-20-1.pdf)<!-- --> 


#### **2014**





```
##               Df    Sum Sq   Mean Sq F value Pr(>F)    
## categorie      3 5.252e+19 1.751e+19    1118 <2e-16 ***
## Residuals   2716 4.253e+19 1.566e+16                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```



 - Détails du test :

\medskip

- **Df (degrés de liberté)** : La variable 'categorie' a 3 degrés de liberté, ce qui correspond à 4 catégories : Microentreprise, PME, ETI, et Grande entreprise. Les résidus ont 2716 degrés de liberté, correspondant au nombre de données restantes après l'application des catégories.

- **Sum Sq (somme des carrés)** : Pour la variable 'categorie', la somme des carrés est de 5.252e+19, ce qui représente la variation expliquée par les différences entre les catégories. Pour les résidus, la somme des carrés est de 4.253e+19, représentant la variation non expliquée par le modèle.

- **Mean Sq (moyenne des carrés)** : La moyenne des carrés pour 'categorie' est de 1.751e+19, La moyenne des carrés pour les résidus est de 1.566e+16.

- **F value** : La valeur de F est très élevée, à 1118, ce qui montre qu'il existe une grande différence entre les groupes par rapport à la variation résiduelle. Une valeur de F élevée signifie que les différences entre les groupes sont beaucoup plus grandes que la variation interne à chaque groupe.

- **Pr(>F)** : La valeur p associée à ce test est inférieure à 2e-16, ce qui est bien en dessous du seuil de 0.05.  Cela montre que les différences entre les catégories sont très significatives, ce qui nous permet de rejeter l'hypothèse nulle selon laquelle il n'y a pas de différence entre les catégories.

- **Interprétation des résultats** : Le test ANOVA montre que la variable 'Chiffres_d_affaires_nets' varie de manière significative en fonction de la catégorie d'entreprise (Microentreprise, PME, ETI, Grande entreprise). La valeur p très faible (< 2e-16) indique que les moyennes des chiffres d'affaires nets sont statistiquement différentes selon les catégories d'entreprises. Cela signifie que l'appartenance à une catégorie d'entreprise (Microentreprise, PME, ETI, Grande entreprise) a un impact significatif sur les chiffres d'affaires nets pour l'année 2014.

- **Conclusion** : Le test ANOVA confirme que la taille de l'entreprise (catégorie) influence le chiffre d'affaires net des entreprises en 2014. En comparant les moyennes des différentes catégories (Microentreprises, PME, ETI, et Grandes entreprises), on peut dire qu'il y a des différences marquées dans les chiffres d'affaires entre ces groupes.

 - Representation graphique boite a moustaches : 
    

![](TDDT_projet_L_2_files/figure-latex/unnamed-chunk-23-1.pdf)<!-- --> 
\newpage

#### **2015**



        

```
##               Df    Sum Sq   Mean Sq F value Pr(>F)    
## categorie      3 2.864e+19 9.546e+18    2780 <2e-16 ***
## Residuals   9588 3.293e+19 3.434e+15                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
          

  
 - Détails du test :

\medskip

- **Df (Degrés de liberté)** : Le facteur "categorie" a 3 degrés de liberté, et les résidus (erreurs) ont 9588 degrés de liberté. Cela reflète le nombre de groupes comparés (les différentes catégories d'entreprises) et la quantité de données disponibles pour les erreurs.

- **Sum Sq (Somme des carrés)** : La somme des carrés représente la variation dans les données. La variation expliquée par la catégorie d'entreprise est de 2.864e+19, tandis que la variation résiduelle (l'erreur) est de 3.293e+19.

- **Mean Sq (Moyenne des carrés)** : La moyenne des carrés est calculée en divisant la somme des carrés par les degrés de liberté. Pour la catégorie, la moyenne des carrés est de 9.546e+18, et pour les résidus, elle est de 3.434e+15.

- **F value** : Le F-value est le rapport entre la variation expliquée par les catégories et celle des résidus. Ici, il est de 2780, ce qui est très élevé, indiquant une différence marquée entre les groupes.

- **Pr(>F)** : La p-value associée au test F. Elle est inférieure à 2e-16, ce qui est très significatif. Cela montre que la probabilité que les différences observées soient dues au hasard est extrêmement faible.

- **Test de Signification** : La p-value obtenue est extrêmement faible (< 2e-16), ce qui signifie que l'hypothèse nulle (H0), qui stipule qu'il n'y a pas de différence entre les groupes, est rejetée. Ainsi, au seuil de 5 % de signification, nous concluons qu'il existe une différence statistiquement significative entre les moyennes des chiffres d’affaires nets des différentes catégories d’entreprises.

- **Que signifie cette différence ?** : Les entreprises de catégories différentes (comme les Microentreprises, PME, ETI, et Grandes entreprises) ont des chiffres d'affaires nets très différents. Par exemple, une Microentreprise n'a clairement pas les mêmes performances financières qu'une PME ou une Grande entreprise.

- **Résumé** : En 2015, les chiffres d’affaires nets varient de manière significative selon la catégorie d'entreprise. Cela suggère que les petites entreprises (comme les Microentreprises) génèrent beaucoup moins de chiffre d'affaires net comparées aux entreprises plus grandes.

  
![](TDDT_projet_L_2_files/figure-latex/unnamed-chunk-26-1.pdf)<!-- --> 



#### **2016**



        

```
##               Df    Sum Sq   Mean Sq F value Pr(>F)    
## categorie      3 1.092e+19 3.639e+18   200.9 <2e-16 ***
## Residuals   1358 2.460e+19 1.812e+16                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
          

\medskip

- Détails du test :

\medskip

- **Df (Degrés de liberté)** : Le facteur "categorie" a 3 degrés de liberté, et les résidus (erreurs) ont 1358 degrés de liberté. Cela représente le nombre de groupes comparés (les différentes catégories d'entreprises) et la quantité de données restantes pour l'erreur.

- **Sum Sq (Somme des carrés)** : La somme des carrés représente la variation dans les données. La variation expliquée par la catégorie d'entreprise est de 1.092e+19, tandis que la variation résiduelle (l'erreur) est de 2.460e+19.

- **Mean Sq (Moyenne des carrés)** : La moyenne des carrés est calculée en divisant la somme des carrés par les degrés de liberté. Pour la catégorie, la moyenne des carrés est de 3.639e+18, et pour les résidus, elle est de 1.812e+16.

- **F value** : Le F-value est le rapport entre la variation expliquée par les catégories et celle des résidus. Ici, il est de 200.9, ce qui est relativement élevé, indiquant une différence entre les groupes.

- **Pr(>F)** : La p-value associée au test F. Elle est inférieure à 2e-16, ce qui est extrêmement significatif. Cela montre que la probabilité que les différences observées soient dues au hasard est très faible.

- **Test de Signification :** La p-value obtenue est extrêmement faible (< 2e-16), ce qui signifie que l'hypothèse nulle (H0), qui stipule qu'il n'y a pas de différence entre les groupes, est rejetée. Ainsi, au seuil de 5 % de signification, nous concluons qu'il existe une différence statistiquement significative entre les moyennes des chiffres d’affaires nets des différentes catégories d’entreprises.

- **Que signifie cette différence ? :** Les entreprises de catégories différentes (comme les Microentreprises, PME, ETI, et Grandes entreprises) ont des chiffres d'affaires nets très différents. Une Microentreprise n'a pas les mêmes performances financières qu'une PME ou une Grande entreprise.

- **Résumé** : En 2016, les chiffres d’affaires nets varient de manière significative en fonction de la catégorie d'entreprise. Cela suggère que les petites entreprises (comme les Microentreprises) génèrent beaucoup moins de chiffre d'affaires net comparées aux entreprises plus grandes.

\medskip

- Représentation graphique (boîte à moustaches):

![](TDDT_projet_L_2_files/figure-latex/unnamed-chunk-29-1.pdf)<!-- --> 

\newpage

#### Conclusion Analyse Bivariée
\medskip
Dans cette analyse, nous avons examiné les différences de chiffre d'affaires net entre les différentes catégories d'entreprises **(Microentreprise, PME, ETI, Grande entreprise)** sur la période *2012-2016*. Les tests ANOVA ont permis de confirmer que les différences observées sont statistiquement significatives, ce qui montre que la taille de l'entreprise a un impact notable sur ses performances économiques.
\medskip
Les résultats ont montré que les Microentreprises génèrent des chiffres d'affaires nettement inférieurs à ceux des PME et des Grandes entreprises. Les boîtes à moustaches ont illustré visuellement ces différences, renforçant ainsi les conclusions des tests statistiques.
\medskip
En conclusion, cette analyse confirme que la taille de l'entreprise est un facteur déterminant dans ses résultats économiques. Ces résultats peuvent être utilisés pour guider des décisions politiques et stratégiques, notamment pour le soutien aux entreprises en fonction de leur taille.


### Conclusion de l'Analyse Univariée et Test ANOVA :


L'ANOVA montre que les différences dans les chiffres d'affaires nets entre les catégories d'entreprises sont très significatives. Cela confirme que les microentreprises génèrent des revenus bien plus faibles par rapport aux PME et grandes entreprises. Ce résultat est en ligne avec la taille et la capacité de ces entreprises, qui varient considérablement en termes de ressources, d'échelle et de portée. En 2016, les PME ont dépassé les microentreprises en nombre, signalant un changement important dans la structure économique des petites entreprises en France.



\newpage


## **Analyse des subventions et du chiffre d'affaires**
<!-- esteban beretti -->
\medskip

L'objectif de cette section est de comprendre si les subventions reçues par les entreprises françaises ont un impact sur leur chiffre d'affaires.

Les montants des subventions et du chiffre d'affaires varient énormément entre les entreprises : certaines ne reçoivent presque rien, d'autres ont des montants très élevés. Pour rendre les données plus lisibles et éviter que quelques cas extrêmes ne faussent les résultats, on utilise une transformation logarithmique. Cela permet d'observer les tendances de manière plus équilibrée et de voir si, proportionnellement, plus de subventions entraîne plus de chiffre d'affaires.

#### 1. Nettoyage et préparation des données

\medskip

Nous avons utilisé conncetion MySQL pour examiner cette party, voici le code R:

\medskip


\footnotesize

``` r
con <- dbConnect(
  MySQL(),
  user = "root",
  password = "root", # même mot de passe créé plus haut
  dbname = "projet_L_2",
  host = "127.0.0.1",
  port = 8889
)

# Vérifie immédiatement la connexion :
#dbListTables(con)

df <- dbGetQuery(con, "
SELECT
    s.siren,
    s.denomination,
    s.town,
    s.ape,
    a.ape_name,
    cr.year,
    cr.`Chiffres d’affaires nets` AS chiffre_affaires,
    sb.`Subventions d’exploitation` AS subvention
FROM projet_L_2.societe s
JOIN projet_L_2.apegen a
  ON s.ape = a.ape
JOIN projet_L_2.compte_resultat cr
  ON s.siren = cr.siren
JOIN projet_L_2.subvention sb
  ON s.siren = sb.siren AND cr.year = sb.year
WHERE cr.`Chiffres d’affaires nets` IS NOT NULL
  AND sb.`Subventions d’exploitation` IS NOT NULL
")
```
\normalsize

\newpage


``` r
library(dplyr)
library(ggplot2)

# Nettoyage
df_clean <- df %>%
  mutate(
    chiffre_affaires = as.numeric(gsub("[^0-9]", "", chiffre_affaires)),
    subvention = as.numeric(gsub("[^0-9]", "", subvention))
  ) %>%
  filter(!is.na(chiffre_affaires) & !is.na(subvention))

# Création des colonnes logarithmiques
df_log <- df_clean %>%
  filter(chiffre_affaires > 0, subvention > 0) %>%
  mutate(
    log_CA = log10(chiffre_affaires),
    log_subvention = log10(subvention)
  )

# Régression log-log
modele_log <- lm(log_CA ~ log_subvention, data = df_log)
summary(modele_log)
```

```
## 
## Call:
## lm(formula = log_CA ~ log_subvention, data = df_log)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.35059 -0.46289  0.02854  0.46093  1.64308 
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     5.11391    0.31714  16.125  < 2e-16 ***
## log_subvention  0.44712    0.08262   5.412 4.59e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.6789 on 96 degrees of freedom
## Multiple R-squared:  0.2337,	Adjusted R-squared:  0.2258 
## F-statistic: 29.28 on 1 and 96 DF,  p-value: 4.589e-07
```
\normalsize

\newpage

### 2. Analyse univariée

 <!-- **Distribution des subventions reçues** -->

\medskip

![](TDDT_projet_L_2_files/figure-latex/unnamed-chunk-32-1.pdf)<!-- --> 

> La majorité des entreprises reçoivent de petites subventions. Quelques-unes, plus rares, touchent des montants bien plus élevés.

<!-- **Distribution du chiffre d'affaires** -->

\medskip

![](TDDT_projet_L_2_files/figure-latex/unnamed-chunk-33-1.pdf)<!-- --> 

> Le chiffre d'affaires est aussi très variable, certaines entreprises réalisant plusieurs dizaines de millions d'euros.

\medskip

### 3. Analyse bivariée brute

\medskip

![](TDDT_projet_L_2_files/figure-latex/unnamed-chunk-34-1.pdf)<!-- --> 

> À première vue, il n'y a pas de lien clair entre les subventions et le chiffre d'affaires. Le graphique montre beaucoup de dispersion, ce qui empêche une vraie lecture de tendance.

\medskip

#### 4. Régression log-log : Visualisation

\medskip

![](TDDT_projet_L_2_files/figure-latex/unnamed-chunk-35-1.pdf)<!-- --> 

> Une fois les données transformées en logarithme, une tendance apparaît : les entreprises qui reçoivent plus de subventions ont, en moyenne, un chiffre d'affaires plus élevé. La relation est significative et le modèle indique qu'une augmentation de 10% des subventions correspond à une hausse d'environ 4,5% du chiffre d'affaires.

\medskip

#### Conclusion

\medskip

En conclusion, même si à l'échelle brute le lien entre subventions et chiffre d'affaires n'est pas visible, la transformation log-log montre qu’il existe une **relation proportionnelle significative**. Cela signifie que les subventions peuvent avoir un impact positif mesurable sur le développement économique des entreprises, en particulier si l'on considère les effets relatifs plutôt que les montants absolus. sans refinancement : Total des charges financières = 0


\newpage











## **Analyser des entreprises en fonction de leur localisation géographique** 
<!-- Serdar VAROL -->
\bigskip

L’objectif de cette étude est d’analyser des entreprises en France à partir de données financières entre 2012 et 2016. Nous avons examiné **le chiffre d’affaires net**, **le résultat d’exploitation**. Des entreprises et a été examinée par **année** et par **region**. La base de données ne contenait que des codes postaux. Nous avons d’abord regroupé les départements puis les régions en fonction des deux chiffres du code postal.Nous avons examiné chaque année indépendamment. 

\medskip

Dans ce chapite pour analyse univarie, nous allons presenter l'annes 2015 car l’année avec le plus de données est 2015. Nous avons constaté que les différences et les incohérences dans la taille des données selon les années et les régions constituaient un obstacle.

\medskip

![Pivot Table](image_sql/image_independant/count_region-ca.png){#Pivot width=10cm height=5cm}

\medskip

### Préparation des données

\medskip

1) Un fichier CSV (créé par code R) contenant les données financières de l’entreprise de 2012 à 2016 a été utilisé

\small

\normalsize

2) Les Variables sont utilise:

|  Variable |source   |
|---|---|
|Year  |Datakagle.csv   |
|Siren  |Datakagle.csv   |
|résultat d'exploitation  |Datakagle.csv |
|chiffres d’affaires nets  |Datakagle.csv   |
|code_postal  |Datakagle.csv   |
|rentabilite  |créé   |
|categorie_rentabilite  |créé    |
|Department  |créé    |
|region  |créé    |



\medskip

3) Création d'une variable catégorielle : La valeur de rentabilité est divisée dans les classes suivantes :

$$
      \text{rentabilité} = \frac{\text{résultat d'exploitation}}{\text{chiffres d’affaires nets}}
$$

\medskip

Table: Classification des entreprises selon leur rentabilité

| Intervalle de rentabilité | Catégorie |
|---------------------------|-----------|
| Rentabilité $< 0$         | En perte  |
| $0 \leq$ Rentabilité $< 0{,}1$ | Faible rentabilité |
| $0{,}1 \leq$ Rentabilité $< 0{,}3$ | Rentabilité moyenne |
| Rentabilité $\geq 0{,}3$  | Haute rentabilité |

\medskip

![](TDDT_projet_L_2_files/figure-latex/rentabilite-1.pdf)<!-- --> 

\newpage 

### Analyse Univarie

\medskip

#### Chiffre d’affaires nets


\begin{longtable}[t]{lrrrrr}
\caption{\label{tab:chiffre_affaire_summary_2015}Résumé des statistiques du chiffre d'affaires nets (en millions d'euros) – 2015}\\
\toprule
region & avarage & median & min & max & ecart\_type\\
\midrule
\endfirsthead
\caption[]{Résumé des statistiques du chiffre d'affaires nets (en millions d'euros) – 2015 \textit{(continued)}}\\
\toprule
region & avarage & median & min & max & ecart\_type\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
Auvergne-Rhône-Alpes & 3.18 & 0.33 & -0.06 & 1083.39 & 25.26\\
Bourgogne-Franche-Comté & 4.21 & 0.56 & 0.00 & 436.49 & 20.71\\
Bretagne & 11.57 & 0.74 & 0.00 & 2938.86 & 101.94\\
Centre-Val de Loire & 4.06 & 0.44 & -0.12 & 531.87 & 23.78\\
Grand Est & 4.36 & 0.53 & -0.04 & 1584.02 & 36.31\\
\addlinespace
Hauts-de-France & 3.26 & 0.49 & -0.11 & 537.71 & 17.26\\
Normandie & 4.52 & 0.59 & -0.01 & 1155.42 & 34.62\\
Nouvelle-Aquitaine & 3.51 & 0.44 & -0.05 & 1788.57 & 35.47\\
Occitanie & 2.17 & 0.36 & -0.14 & 360.82 & 10.56\\
Pays de la Loire & 10.93 & 0.78 & -0.01 & 2729.00 & 90.24\\
\addlinespace
Provence-Alpes-Côte d'Azur & 1.46 & 0.35 & -6.59 & 366.13 & 7.17\\
Île-de-France & 3.91 & 0.35 & -0.31 & 6217.25 & 64.37\\*
\end{longtable}




![](TDDT_projet_L_2_files/figure-latex/chiffre_affaire_graph_2015-1.pdf)<!-- --> 
\medskip

\tiny
| **Écart-type vs médiane**                                                                                       | **Asymétrie et outliers**                                                                                                                                         | **Valeurs négatives**                                                                                                                                               |
|:---------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| En Bretagne et dans les Pays de la Loire, la moyenne dépasse nettement la médiane, indiquant l’impact de quelques très grands comptes. | Les maxima particulièrement élevés en Île-de-France, Bretagne et Pays de la Loire révèlent une distribution très à droite et la présence d’outliers (grandes entreprises, opérations exceptionnelles, etc.). | Les chiffres d’affaires négatifs observés en Provence-Alpes-Côte d’Azur témoignent de sociétés en perte, dont le secteur d’activité et la structure financière méritent un examen approfondi. |
\normalsize
\newpage 


#### Resultat d'Explation 


\begin{longtable}[t]{lrrrrr}
\caption{\label{tab:resultat_exp_summary_2015}Résumé des statistiques du Résultat d'exploitation (en millions d'euros) – 2015}\\
\toprule
region & avarage & median & min & max & ecart\_type\\
\midrule
\endfirsthead
\caption[]{Résumé des statistiques du Résultat d'exploitation (en millions d'euros) – 2015 \textit{(continued)}}\\
\toprule
region & avarage & median & min & max & ecart\_type\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
Auvergne-Rhône-Alpes & 3.18 & 0.33 & -0.06 & 1083.39 & 25.26\\
Bourgogne-Franche-Comté & 4.21 & 0.56 & 0.00 & 436.49 & 20.71\\
Bretagne & 11.57 & 0.74 & 0.00 & 2938.86 & 101.94\\
Centre-Val de Loire & 4.06 & 0.44 & -0.12 & 531.87 & 23.78\\
Grand Est & 4.36 & 0.53 & -0.04 & 1584.02 & 36.31\\
\addlinespace
Hauts-de-France & 3.26 & 0.49 & -0.11 & 537.71 & 17.26\\
Normandie & 4.52 & 0.59 & -0.01 & 1155.42 & 34.62\\
Nouvelle-Aquitaine & 3.51 & 0.44 & -0.05 & 1788.57 & 35.47\\
Occitanie & 2.17 & 0.36 & -0.14 & 360.82 & 10.56\\
Pays de la Loire & 10.93 & 0.78 & -0.01 & 2729.00 & 90.24\\
\addlinespace
Provence-Alpes-Côte d'Azur & 1.46 & 0.35 & -6.59 & 366.13 & 7.17\\
Île-de-France & 3.91 & 0.35 & -0.31 & 6217.25 & 64.37\\*
\end{longtable}



![](TDDT_projet_L_2_files/figure-latex/resulta_graph_2015-1.pdf)<!-- --> 

\tiny
| **Écart-type vs médiane**                                                                                                                                                    | **Asymétrie et outliers**                                                                                                                                                                      | **Résultats négatifs**                                                                                                                                                                                                                  |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| En Bretagne (moy. 11,6 vs méd. 0,74) et dans les Pays de la Loire ( 10,9 vs 0,78), la moyenne dépasse très largement la médiane, signe que quelques très grands comptes concentrent l’essentiel du résultat d’exploitation. | Plusieurs régions (Île-de-France, Nouvelle-Aquitaine, Pays de la Loire) présentent des valeurs maximales supérieures à 800 – voire dépassant 1 200 – révélant une forte dissymétrie et la présence d’outliers (grandes opérations ponctuelles, entreprises majeures, etc.). | Des minima négatifs, notamment en Provence-Alpes-Côte d’Azur (–6,6) mais aussi en Centre-Val de Loire, Hauts-de-France ou Auvergne-Rhône-Alpes, attestent de sociétés en perte dont le profil sectoriel et financier mériterait une analyse ciblée. |

\normalsize

\newpage

### Analyse Bivarie
 \medskip
 
#### Chiffre d’affaires nets et Résultat d'exploitation
 
![](TDDT_projet_L_2_files/figure-latex/nuage_point_anness-1.pdf)<!-- --> 

#### Coefficient de corrélation de Pearson
 
\medskip




| Année  | Corrélation (Pearson)  | Interprétation  |
|--------|---|---|
|2012|-0.45    |Corrélation négative modérée   |
|2013|0.35     |Relation positive modérée   |
|2014|0.80     |Forte corrélation positive    |
|2015|0.38     |Tendance positive similaire à 2013   |
|2016|0.29     |Corrélation positive mais faible   |

\medskip


La corrélation doit être comprise entre **-1 et 1**, donc les valeurs que nous avons trouvées sont correctes.
On peut dire qu'en 2012, il existe une relation **négative** entre les deux variables.
Pour les années 2013, 2015 et 2016, la corrélation est **faible mais positive** : cela signifie que lorsque le chiffre d'affaires augmente, le résultat d'exploitation a tendance à augmenter également.
En 2014, on observe une **forte** corrélation positive, ce qui indique une relation claire entre les deux variables : elles ont tendance à évoluer dans le même sens, c’est-à-dire à augmenter en même temps.


\newpage

#### Regreation droit


![](TDDT_projet_L_2_files/figure-latex/reg_droit-1.pdf)<!-- --> 

\medskip

**Formuler les hypothèses :**

\bigskip

- Hypothèse nulle (H\textsubscript{0}) : La répartition du chiffre d’affaires net et du résultat d'exploitation ne varie pas selon les régions.
\medskip
- Hypothèse alternative (H\textsubscript{1}) : Il existe une différence significative du chiffre d’affaires net et du résultat d'exploitation entre les régions.

\medskip

- Test ANOVA pour Chiffre d’affaires net

\medskip


```
##      F_value     p_value   Decision
## 2012   11.49 0.000000000 H0 rejetée
## 2013    6.25 0.000000000 H0 rejetée
## 2014    3.77 0.000020167 H0 rejetée
## 2015    7.46 0.000000000 H0 rejetée
## 2016    2.76 0.001434238 H0 rejetée
```

\bigskip

- Test ANOVA pour Résultat d'exploitation
\medskip


```
##      F_value p_value       Decision
## 2012    0.72  0.7195 H0 non rejetée
## 2013    0.61  0.8213 H0 non rejetée
## 2014    0.18  0.9987 H0 non rejetée
## 2015    1.95  0.0289     H0 rejetée
## 2016    0.44  0.9379 H0 non rejetée
```

#### Conclusion

Cette étude a examiné s’il existe une relation entre les variables définies « ca » et « Re » indépendamment pour chaque année, selon les régions.

Le test Anova nous a donné les résultats suivants:

 - **Chiffre d'affaires net (CA)**: Des différences significatives ont été constatées entre les régions pour chaque année. Cela montre que la localisation géographique a un effet significatif sur le chiffre d'affaires moyen des entreprises.

\medskip

 - **Résultat d'exploitation**: Les résultats sont plus contrastés. Si les différences entre les régions sont significatives certaines années (par exemple, 2015), elles ne le sont pas statistiquement pour d'autres années (par exemple, 2012, 2013 et 2014).

Ces résultats suggèrent que les différences régionales sont significatives pour le chiffre d'affaires net, mais plus limitées pour le résultat d'exploitation. Cela suggère que le résultat d'exploitation pourrait être lié non seulement à la région, mais aussi à la taille de l'entreprise, à son secteur d'activité et à d'autres caractéristiques structurelles.

En résumé, si les facteurs régionaux ont un effet significatif sur le chiffre d'affaires net, cet effet est plus faible sur le résultat d'exploitation. Il est conclu que des analyses multivariées sont nécessaires pour comprendre la performance des entreprises.



\newpage





## **Comparer  des Chiffres d’affaires net et Impôts, taxes et versements assimilés**
<!-- Hazem IBNMTAR -->
\medskip

### Analyse Univarie
Filtrer les valeurs strictement positives

\medskip

\scriptsize

```
##       Min.    1st Qu.     Median       Mean    3rd Qu.       Max.       NA's 
##  -32175143     123754     452565    5660321    1522934 7442405000      12756
```
\normalsize

\medskip

Minimum négatif (-32,2 M euro) : incohérent économiquement, un chiffre d'affaires ne peut pas être négatif.
Ces données devraient être examinées, voire exclues pour les analyses statistiques et graphiques.
Moyenne (5,66 M euro) bien supérieure à la médiane (452 565 euro) :
Cela indique une distribution fortement asymétrique à droite, causée par des valeurs extrêmes très élevées (entreprises géantes).
1er et 3e quartile (Q1 = 123 754 euro ; Q3 = 1 522 934 euro) :
50 % des entreprises ont un CA net compris entre ces deux valeurs,
ce qui reflète une forte concentration autour de la petite et moyenne entreprise.
Maximum (7,44 milliards euro) : très élevé, reflétant une extrême hétérogénéité dans la taille des entreprises.
Ce type de valeur influence fortement la moyenne (effet des outliers).
Nombre de valeurs manquantes : 12 756 → à prendre en compte dans les analyses (traitement ou imputation).

\medskip


![](TDDT_projet_L_2_files/figure-latex/unnamed-chunk-40-1.pdf)<!-- --> 

\medskip


On peut remarquer que la fréquence est particulièrement élevée pour le chiffre d'affaires correspondant à la valeur 7 sur l’échelle logarithmique, ce qui équivaut à 10^7, soit 10 000 000 euros. 

\medskip

Cela indique que de nombreuses entreprises déclarent un chiffre d’affaires autour de 10 millions d’euros, ce qui montre l’importance de cette valeur dans la distribution de cette variable quantitative continue. 

\medskip

Cette concentration justifie une attention particulière dans l’analyse économique du dataset.

\medskip

Créer un boxplot en échelle log10

\medskip

![](TDDT_projet_L_2_files/figure-latex/unnamed-chunk-41-1.pdf)<!-- --> 

\medskip


```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max.      NA's 
## -47760732      1041      4472     77161     17566 230050738      9412
```

![](TDDT_projet_L_2_files/figure-latex/unnamed-chunk-42-1.pdf)<!-- --> 



\medskip

#### Chiffres d'affaires nets

\medskip

Pour le chiffres d'affaires on a gardé uniquement les valeurs strictement positives .La moyenne est éleves c'est pour ça on peut conclure que il y a des grandes entreprises dans notre base de données
La médiane est plus faible que la moyenne montre que la distribution est asymétrique.
L'écart type est très grand reflétant une forte hétérogénité

\medskip
#### Impots:

\medskip

\scriptsize

```
##       Min.    1st Qu.     Median       Mean    3rd Qu.       Max.       NA's 
##  -32175143     123754     452565    5660321    1522934 7442405000      12756
```

\normalsize

Après avoir réalisé l'histogramme de la variable quantitative continue "Impôts, taxes et versements assimilés" (en euros), nous avons appliqué une échelle logarithmique afin d'améliorer la lisibilité du graphique et de faciliter l’interprétation des données.
On observe alors que la fréquence la plus élevée correspond à la valeur 4 sur l’échelle logarithmique, ce qui équivaut à 10^4, soit 40 000 euros.Cela signifie qu’un grand nombre d’entreprises déclarent environ 40 000 euros au titre des impôts, taxes et versements assimilés.


### Test de Correlation

\medskip

![](TDDT_projet_L_2_files/figure-latex/graphe_hazem-1.pdf)<!-- --> 

```
## [1] 0.8116802
```

\medskip

Après avoir fait le décopage de la base de données pour la manipuler plus facilement maintenat on va faire le test de corrélation avec le nuage de points entre les deux variables rentabilité et Impots , taxes et versements assimilés :

\medskip
#### Test de corrélation entre les chiffres d'affaires nets et l'impots,taxes

\medskip

On souhaiterai savoir le lien entre deux variables dans notre BD (test de corélation).On a trouvé que $r(xy)=0.8116802$

\medskip


**Hypothese:**  Chiffres d'affaires nets et Impots,taxes  sont non corrélées linéairement

\medskip


``` r
n <- 27016
alpha <- 0.05
quant <- qnorm(1 - alpha / 2)
quant
```

```
## [1] 1.959964
```

``` r
test <- quant / sqrt(n - 1)
test
```

```
## [1] 0.01192465
```

``` r
#R>test
```

\medskip

On peut affirmer qu'il existe une corrélation linéaire entre la variale chiffres d'affaires nets et la taxe.

D'après le test de corrélaion et le nuage de points on peut affirmer que le test et le nuage de points sont compatible donc il existe un lien entre les deux variables.(Corrélation positive forte )



















# Discussion

Au départ, la base de données était disponible sous forme d'un bloc unique. Afin d’en faciliter l'exploitation, nous avons décidé d’effectuer un slicing, ce qui nous a permis de diviser la base en sept tables distinctes.

\medskip

Lors de l’importation des données dans phpMyAdmin, nous avons rencontré certaines contraintes techniques :
En raison de la limite de capacité de phpMyAdmin, il n'était pas possible d'importer les 100 000 lignes en une seule fois. Nous avons donc sélectionné 100 lignes par année pour garantir une importation réussie tout en conservant une représentativité temporelle des données.
Un autre problème est survenu concernant une colonne dont le nom était trop long pour être inséré correctement dans la table. Initialement intitulée :« Produits des autres valeurs mobilières et créances de l’actif immobilisé », nous l’avons renommée de manière plus concise en : « Produits des autres valeurs mobilières ».

\medskip

Par ailleurs, nous disposions également d'une table annexe expliquant les abréviations utilisées pour nommer les variables dans notre Modèle Conceptuel de Données (MCD). Cette table de correspondance nous a été précieuse pour interpréter et documenter les variables au cours de l’analyse.

\medskip

### Nettoyage et traitement des données manquantes
\medskip
Notre base de données étant très réaliste, elle comportait un certain nombre de valeurs manquantes. Pour prendre en compte cette spécificité dans nos analyses bivariées, nous avons utilisé la méthode suivante dans R : use = "complete.obs"
Cette option permet de ne conserver que les observations complètes, sans tenir compte des données manquantes lors du calcul des statistiques.
Étant donné que chaque année, le nombre de sociétés restait identique, les résultats obtenus lors des premières analyses n’étaient pas toujours significatifs. Afin de mieux visualiser les variations et rendre les analyses plus lisibles, nous avons décidé d’utiliser une échelle logarithmique.
\medskip

### Gestion des différences de ponctuation
\medskip
Un problème technique supplémentaire est apparu lors de la rédaction du code : il existait des différences entre les symboles de ponctuation français et ceux utilisés par R (par exemple pour le point-virgule ;). Pour corriger automatiquement ces erreurs de syntaxe, nous avons employé des expressions régulières (regex), ce qui nous a permis d'uniformiser rapidement les fichiers.
Organisation du travail
\medskip
Dès le début du projet, le travail a été clairement structuré et réparti. Chaque membre de l'équipe avait des tâches définies, ce qui nous a permis de progresser efficacement et de respecter les délais fixés.



# Conclusion et perspectives {.label:ccl}

\medskip

Ce projet nous a permis de comprendre ce qui influence vraiment la réussite financière des entreprises françaises entre 2012 et 2016. Nous avons d’abord vu que la taille compte : les PME et les grandes entreprises gagnent beaucoup plus que les microentreprises.

\medskip

Nous avons aussi remarqué que payer moins d’impôts aiderait surtout les plus petites structures, car plus les taxes sont élevées, plus leur bénéfice diminue. Par ailleurs, les aides publiques (subventions) boostent concrètement le chiffre d’affaires lorsqu’elles augmentent.

\medskip

Enfin, il existe de vraies différences selon les régions : les entreprises d’Île-de-France, de Bretagne et des Pays de la Loire font régulièrement de meilleurs résultats.

\medskip

En clair, pour améliorer la rentabilité des entreprises, il faut :

  - soutenir les petites entreprises en réduisant leurs impôts,

  - continuer à verser des subventions lorsque c’est utile,

  - adapter les aides aux besoins de chaque région.

\medskip

Cette approche simple montre comment aider au mieux les entreprises françaises à grandir de façon équilibrée.


# Annexes {-}


Il faut utiliser les annexes de façon judicieuse. C'est ici que l'on place des résultats trop volumineux pour apparaître dans le corps du rapport. Ou bien des résultats (e.g., graphiques) moins intéressants que les autres. Cela permet de limiter le nombre de pages du coeur du rapport, et d'ajouter des détails dans cette partie pour le lecteur désireux d'en savoir plus.

## **Codes** {-}

\tiny
Code utilise pour slicing

\medskip

\label{codeR_slicing}

``` r
#Charger la bibliothèque
library(readr)

#Lire le fichier CSV
data_kaggle <- read_csv("csv/data_kaggle.csv")

#Fonction pour calculer la rentabilité (PAS de référence directe à data_kaggle dans les paramètres)
fonction_rentabilite <- function(resultat_financier, ca_net) {
  if (!is.na(resultat_financier) && !is.na(ca_net) && ca_net != 0) {
    return(resultat_financier / ca_net)
  } else {
    return(NA)
  }
}

#Appliquer la fonction ligne par ligne
data_kaggle$rentabilite <- apply(data_kaggle, 1, function(row) {
  resultat <- as.numeric(row["Résultat financier"])
  ca <- as.numeric(row["Chiffres d'affaires nets"])
  return(fonction_rentabilite(resultat, ca))
})

#Sauvegarder le résultat dans un nouveau fichier CSV
write.csv(data_kaggle, 
          "csv/data_kaggle_new.csv", 
          row.names = FALSE)

#Affichage pour vérification
View(data_kaggle)
data_kaggle$rentabilite()
annee_2012<-data_kaggle$year[]
annee_2012


install.packages("sqldf")
library(sqldf)

result <- sqldf("SELECT * FROM data_kaggle WHERE year = 2012")
result
head(result)
annee_2012<-sqldf("SELECT* from data_kaggle WHERE year=2012")
View(annee_2012)
annee_2013<-sqldf("SELECT* from data_kaggle WHERE year=2013")
annee_2014<-sqldf("SELECT* from data_kaggle WHERE year=2014")
annee_2015<-sqldf("SELECT* from data_kaggle WHERE year=2015")
annee_2016<-sqldf("SELECT* from data_kaggle WHERE year=2016")
cor(annee_2012$rentabilite,annee_2012$`Impôts, taxes et versements assimilés`,use = "complete.obs")
plot(annee_2012$rentabilite,annee_2012$`Impôts, taxes et versements assimilés`)
# Table 1 : Société
# Combinaison des 100 premières lignes de chaque sous-ensemble
sous_ensemble <- rbind(
  annee_2012[1:100, ],
  annee_2013[1:100, ],
  annee_2014[1:100, ],
  annee_2015[1:100, ],
  annee_2016[1:100, ]
)
View(sous_ensemble)

# Sélection des colonnes souhaitées
societe <- sous_ensemble[, c("siren", "denomination", "postal_code", "town", "ape")]
View(societe)
write_csv(societe, "csv/societe.csv")

# Table 2 : Subventions
sous_ensemble_2 <- rbind(
  annee_2012[1:100, ],
  annee_2013[1:100, ],
  annee_2014[1:100, ],
  annee_2015[1:100, ],
  annee_2016[1:100, ]
)
subventions<-sous_ensemble_2[, c("year","siren", "Subventions d’exploitation")]


write_csv(subventions, "csv/subvention.csv")

# Table 3 : ApeGen
sous_ensemble_3 <- rbind(
  annee_2012[1:100, ],
  annee_2013[1:100, ],
  annee_2014[1:100, ],
  annee_2015[1:100, ],
  annee_2016[1:100, ]
)


apegen<-sous_ensemble_3[, c("ape", "ape_name", "ape_len", "ape_division", "ape_groupe", "ape_classe", "ape_sous_classe")]
write_csv(apegen, "csv/apegen.csv")

# Table 4 : Chiffre d'Affaires
sous_ensemble_4<- rbind(
  annee_2012[1:100, ],
  annee_2013[1:100, ],
  annee_2014[1:100, ],
  annee_2015[1:100, ],
  annee_2016[1:100, ]
)
chiffre_affaire<-sous_ensemble_4[,c("siren", "Chiffres d'affaires nets", "Impôts, taxes et versements assimilés")]

write_csv(chiffre_affaire, "csv/chiffre_affaire.csv")

# Table 5 : Charges Chiffre
sous_ensemble_5<- rbind(
  annee_2012[1:100, ],
  annee_2013[1:100, ],
  annee_2014[1:100, ],
  annee_2015[1:100, ],
  annee_2016[1:100, ]
)
charge_chiffre <- sous_ensemble_5[, c("year",
  "siren", 
  "Reprises sur amortissements et provisions, transfert de charges", 
  "Reprises sur provisions et transferts de charges financier", 
  "Reprises sur provisions et transferts de charges exceptionnel", 
  "Achats de marchandises (y compris droits de douane)", 
  "Achats de matières premières et autres approvisionnements", 
  "Autres achats et charges externes", 
  "Salaires et traitements", 
  "Charges sociales"
)]
write_csv(charge_chiffre, "csv/charge_chiffre.csv")

# Table 6 : Produits Chiffre
sous_ensemble_6<- rbind(
  annee_2012[1:100, ],
  annee_2013[1:100, ],
  annee_2014[1:100, ],
  annee_2015[1:100, ],
  annee_2016[1:100, ]
)


produit_chiffre <- sous_ensemble_6[, c("year",
  "siren", 
  "Total des produits d’exploitation", 
  "Total des produits financiers", 
  "Total des produits exceptionnels", 
  "Autres produits"
)]
write_csv(produit_chiffre, "csv/produit_chiffre.csv")
# Table 7 : Compte de Résultat
sous_ensemble_7<- rbind(
  annee_2012[1:100, ],
  annee_2013[1:100, ],
  annee_2014[1:100, ],
  annee_2015[1:100, ],
  annee_2016[1:100, ]
)

compte_resultat <- sous_ensemble_7[, c("year",
  "siren", 
  "Chiffres d'affaires nets", 
  "Impôts, taxes et versements assimilés", 
  "Résultat d'exploitation", 
  "Résultat financier", 
  "Résultat en cours avant impôts", 
  "Résultat exceptionnel", 
  "Bénéfices ou perte (Total des produits ‐ Total des charges)"
)]
write_csv(compte_resultat, "csv/compte_resultat.csv")
stock <- sous_ensemble_7[ c("year")]
write_csv(stock, "csv/stock.csv")
```
\normalsize


