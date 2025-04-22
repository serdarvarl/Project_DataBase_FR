---
title: "Rapport de groupe des UE \\newline  Bases de données + Sciences des Données 2"
author: ""
date: "22 April 2025"
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
  
  Notre projet vise à analyser les performances financières des entreprises françaises entre 2018 et 2022 à partir des données du Registre National du Commerce et des Sociétés (RNCS). Nous cherchons à comprendre quels sont les facteurs qui influencent la rentabilité des entreprises et comment ces dernières évoluent en fonction de leur secteur d’activité. Plus précisément, nous allons :
  - Comparer les performances des entreprises selon leur chiffre d'affaires et leur rentabilité.
  - Étudier l’impact de la fiscalité sur la profitabilité des entreprises.
  - Analyser l’évolution des ventes, des stocks et des taxes pour identifier des tendances économiques.
always_allow_html: True
---





# Introduction {.label:s-intro}

## Présentation du projet

Les données financières des entreprises jouent un rôle crucial dans la compréhension de leur santé économique. Ce projet se concentre sur l'analyse des performances financières des entreprises françaises entre 2018 et 2022, en utilisant les données fournies par le Registre National du Commerce et des Sociétés (RNCS).


\bigskip

\begin{itemize}[label=$\circ$]
    \item \textbf{Comparer les performances des entreprises selon leur chiffre d'affaires et leur rentabilité.}
    \item \textbf{Étudier l’impact de la fiscalité sur la profitabilité des entreprises.}
    \item \textbf{Analyser l’évolution des ventes, des stocks et des taxes pour identifier des tendances économiques.}
\end{itemize}


\medskip 

## Responsabilités et composition de l’équipe


\medskip

MOUTCHACHOU Lydia : Étudiant n°22212656

IBNMTAR Hazem : Étudiant n°22309227

BERETTI--PRENANT Esteban : Étudiant n°22208752

VAROL Serdar : Étudiant n°22009668




\bigskip
## Objectifs et questions de recherche

Notre projet vise à analyser les performances financières des entreprises françaises entre 2018 et 2022. Pour ce faire, nous allons examiner plusieurs facteurs qui pourraient influencer la rentabilité des entreprises. Les questions spécifiques que nous allons aborder sont les suivantes :

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
En répondant à ces questions, nous espérons identifier les principaux facteurs influençant la rentabilité des entreprises françaises et fournir des insights précieux pour les décideurs économiques et les gestionnaires d'entreprises.



# Base de données

## Provenance des données


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

Nous avons ensuite appliqué la même méthode pour chaque année (**2013 à 2016**), puis extrait les 100 premières lignes de chaque sous-ensemble. Enfin, nous avons combiné ces sous-ensembles
afin d’obtenir une table finale regroupant **500 lignes** (100 par année). Cette nouvelle table
est ainsi mieux structurée pour les futures analyses et pourra être importée dans phpMyAdmin
pour les étapes suivantes de notre projet.

\medskip

Lors de l’importation de données sur phpMyAdmin, on a rencontré un petit problème : la colonne
était trop longue pour être insérée dans la table. Du coup, on a modifié simplement le nom de
la colonne. Elle était :
« Produits des autres valeurs mobilières et créances de l’actif immobilisé » et on l’a changée pour : « Produits des autres valeurs mobilières ».








\medskip

   Cette commande retourne toutes les colonnes de la base data_kaggle pour les lignes dont l’année est **égale à 2012**.
Nous avons ensuite appliqué la même méthode pour chaque année (2013 à 2016), puis extrait **les 100 premières lignes** de chaque sous-ensemble. Enfin, nous avons combiné ces sous-ensembles afin d’obtenir une **table finale regroupant 500 lignes (100 par année)**. Cette nouvelle table est ainsi mieux structurée pour les futures analyses et pourra être **importée dans phpMyAdmin** pour les étapes suivantes de notre projet.

\newpage

<!-- apre voir
Scatter plot log-log avec ggplot2 



\medskip

Après avoir fait le décopage de la base de données pour la manipuler plus facilement maintenat on va faire le test de corrélation avec le nuage de points entre les deux variables rentabilité et Impots , taxes et versements assimilés :


### TEST de corrélation entre les chiffres d'affaires nets et l'impots,taxes

\medskip

On souhaiterai savoir le lien entre deux variables dans notre BD (test de corélation).On a trouvé que $r(xy)=0.8116802$

\medskip


**Hypothese:**  Chiffres d'affaires nets et Impots,taxes  sont non corrélées linéairement

\medskip


``` r
n=27016
alpha/2=1.9600
alpha<-0.05
quant<-qnorm(1-alpha/2)
quant
test<-quant/sqrt(27016-1)
test
R>test
```

\medskip

On peut affirmer qu'il existe une corrélation linéaire entre la variale chiffres d'affaires nets et la taxe.

D'après le test de corrélaion et le nuage de points on peut affirmer que le test et le nuage de points sont compatible donc il existe un nlien entre les deux variables.(Corrélation positive forte )  








-->
 




\newpage

## Requêtes réalisées


Pour chaque requête, l'exprimer en langage naturel puis en SQL. Puis donner le résultat obtenu (ou un extrait) et expliquer ce résultat.

L'objectif est de varier le type de requêtes et de répondre à votre problématique initiale.


1) Pour comperer et trouver selon leur code postal 




``` sql

SELECT 
    LEFT(postal_code, 2) AS departement,
    COUNT(*) AS nombre_entreprises
FROM 
    societe
WHERE 
    postal_code IS NOT NULL
GROUP BY 
    departement
ORDER BY 
    nombre_entreprises DESC;

```


![Code postal](image_sql/sql_1_Serdar.png){ width=5cm height=10cm}

\newpage


``` sql
SELECT 
    s.siren,
    s.denomination,
    s.postal_code,
    cr.`Chiffres d’affaires nets` AS chiffre_affaires_net
FROM 
    societe s
JOIN 
    compte_resultat cr ON s.siren = cr.siren
WHERE 
    LEFT(s.postal_code, 2) = '44';

```

![Code postal](image_sql/sql_2_serdar.png){ width=10cm height=10cm}










# Matériel et Méthodes

## Logiciels

Nous avons utilisé ces logiciels lors de la réalisation de notre projet :


  - Pretraitment : Libre Office
  - Stocker Base Donnée : Mysql /MAMP
  - Traitment statistique et ecrit: R
  - Correction/ replacement:  Regex
  - Version control : GitHUB
  - L'IA : OpenAI et MISTRAL
  


\bigskip

Voici lien de github notre projet :  \href{https://github.com/serdarvarl/Project_DataBase_FR.git}{TDDT github}
 




## Modélisation statistique



<http://biostatisticien.eu/springeR/livreR.pdf>


# Analyse et Résultats

## **Comparer les catégories d'entreprises en fonction des Chiffres d’affaires nets**
\bigskip
**Variables :** Chiffres d’affaires nets + catégories (Effectif moyen du personnel)

### Étapes pour créer une visualisation :
contuinee ;;;;;;;

#### Les catégories d’entreprises :
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



## **Analyse des subventions et du chiffre d'affaires**
<!-- esteban -->
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

#### 2. Analyse univariée

 <!-- **Distribution des subventions reçues** -->

\medskip

![](scdon2-UPV-report-template_sansPython_files/figure-latex/unnamed-chunk-7-1.pdf)<!-- --> 

> La majorité des entreprises reçoivent de petites subventions. Quelques-unes, plus rares, touchent des montants bien plus élevés.

<!-- **Distribution du chiffre d'affaires** -->

\medskip

![](scdon2-UPV-report-template_sansPython_files/figure-latex/unnamed-chunk-8-1.pdf)<!-- --> 

> Le chiffre d'affaires est aussi très variable, certaines entreprises réalisant plusieurs dizaines de millions d'euros.

\medskip

#### 3. Analyse bivariée brute

\medskip

![](scdon2-UPV-report-template_sansPython_files/figure-latex/unnamed-chunk-9-1.pdf)<!-- --> 

> À première vue, il n'y a pas de lien clair entre les subventions et le chiffre d'affaires. Le graphique montre beaucoup de dispersion, ce qui empêche une vraie lecture de tendance.

\medskip

#### 4. Régression log-log : Visualisation

\medskip

![](scdon2-UPV-report-template_sansPython_files/figure-latex/unnamed-chunk-10-1.pdf)<!-- --> 

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

![](scdon2-UPV-report-template_sansPython_files/figure-latex/rentabilite-1.pdf)<!-- --> 

\newpage 

### Analyse Univarie

\medskip

#### Chifre d'afffaire


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




![](scdon2-UPV-report-template_sansPython_files/figure-latex/chiffre_affaire_graph_2015-1.pdf)<!-- --> 


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



![](scdon2-UPV-report-template_sansPython_files/figure-latex/resulta_graph_2015-1.pdf)<!-- --> 

\newpage

### Analyse Bivarie
 \medskip
 
#### Chiffre d’affaires nets et Résultat d'exploitation
 
![](scdon2-UPV-report-template_sansPython_files/figure-latex/nuage_point_anness-1.pdf)<!-- --> 

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


![](scdon2-UPV-report-template_sansPython_files/figure-latex/reg_droit-1.pdf)<!-- --> 

\medskip

**Formuler les hypothèses :**

\bigskip

- Hypothèse nulle (H\textsubscript{0}) : La répartition du chiffre d’affaires net et du résultat d'exploitation ne varie pas selon les régions.
\medskip
- Hypothèse alternative (H\textsubscript{1}) : Il existe une différence significative du chiffre d’affaires net et du résultat d'exploitation entre les régions.




```
##      Annee F_value     p_value   Decision
## 2012  2012   11.49 0.000000000 H0 rejetée
## 2013  2013    6.25 0.000000000 H0 rejetée
## 2014  2014    3.77 0.000020167 H0 rejetée
## 2015  2015    7.46 0.000000000 H0 rejetée
## 2016  2016    2.76 0.001434238 H0 rejetée
```

\bigskip



```
##      Annee F_value p_value       Decision
## 2012  2012    0.72  0.7195 H0 non rejetée
## 2013  2013    0.61  0.8213 H0 non rejetée
## 2014  2014    0.18  0.9987 H0 non rejetée
## 2015  2015    1.95  0.0289     H0 rejetée
## 2016  2016    0.44  0.9379 H0 non rejetée
```

#### Conclusion



\newpage

## **La variation de la rentabilité selon le secteur d'activité des entreprises**
\bigskip
**Variables** :  le code APE (le secteur d'activité des entreprises) + Chiffres d’affaires nets

### Étapes pour créer une visualisation :

#### Catégorisation des entreprises par secteur d'activité :

#### Visualisation :

**Boxplot** : Visualiser la distribution des chiffres d'affaires nets pour chaque secteur d'activité.\\
**Diagramme en barres** : Montrer la moyenne des chiffres d'affaires nets par secteur d'activité.

#### Test Statistique (ANOVA) :
**Chauque un/e doit proposer son text :) **

Dans cette partie, vous pourrez utiliser les outils et méthodes vus au semestre précédent pour analyser les liens entre les variables.

Pour cela, vous pourrez utiliser les tests du $\chi^2$, test du coefficient de corrélation linéaire, test d'Anova, la droite de régression linéaire.

Vous pourrez également proposer des modèles pour faire du clustering (k-means, CAH), de la classification (K plus proches voisins par exemple) comme vu en Science des données 1.  




\newpage




# Discussion

Placer les résultats que vous avez obtenus dans le chapitre précédent en perspective par rapport au problème étudié.

# Conclusion et perspectives {.label:ccl}

Quelles sont les conclusions principales? Quelles sont vos recommandations pour le commanditaire? Quelles analyses subséquentes pourraient être faites dans le futur?

\bigskip

On attend de vous deux types de perspectives : des perspectives à court terme pour améliorer rapidement votre approche et des perspectives à plus long terme qu'elles soient liées à la science des données ou au domaine métier pour lequel vous avez travaillé.

\bigskip

Lister également les difficultés rencontrées dans la partie BD (e.g., taille de la base, manque de données, ...) et dans la partie statistique.

# Bibliographie {-}

<div id="refs"></div>

\bibliographystyle{elsarticle-harv}
\bibliography{references}

# Annexes {-}


Il faut utiliser les annexes de façon judicieuse. C'est ici que l'on place des résultats trop volumineux pour apparaître dans le corps du rapport. Ou bien des résultats (e.g., graphiques) moins intéressants que les autres. Cela permet de limiter le nombre de pages du coeur du rapport, et d'ajouter des détails dans cette partie pour le lecteur désireux d'en savoir plus.

## **Codes** {-}

\tiny

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
  ca <- as.numeric(row["Chiffres d’affaires nets"])
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
chiffre_affaire<-sous_ensemble_4[,c("siren", "Chiffres d’affaires nets", "Impôts, taxes et versements assimilés")]

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
  "Chiffres d’affaires nets", 
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



## **Tables** {-}

Si vous avez des tableaux supplémentaires, vous pouvez les ajouter ici.

Utiliser https://www.tablesgenerator.com/markdown_tables pour créer des tables Markdown simples, ou bien utiliser \LaTeX.

| Les tables   |        sont       |  cool |
|--------------|:-----------------:|------:|
| col 1 est    |  alignée à gauche | $1600 |
| col 2 est    |     centrée       |   $12 |
| col 3 est    | alignée à droite  |    $1 |

Table: une légende au-dessus du tableau. \label{tab7.1}

Aligner les nombres de la troisième colonne sur la droite permet d'afficher les unités au-dessus des unités, les dizaines au-dessus des dizaines, etc. Il faut toujours privilégier cette présentation.

