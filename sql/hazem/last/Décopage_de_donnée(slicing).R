# Dans un premier temps, les données ont été chargées dans R à l'aide de la fonction read_csv().
# Ensuite, afin de faciliter l'importation de ces données dans phpMyAdmin, nous avons procédé à
# un découpage (slicing) de la base initiale en sept tables distinctes, chacune regroupant les
# variables pertinentes pour son thème spécifique.
#
# Par exemple, pour la table "société", nous avons conservé uniquement les colonnes suivantes :
# "siren", "denomination", "postal_code", "town" et "ape".
#
# Ce processus a été appliqué à chaque table en sélectionnant les attributs nécessaires, puis
# nous avons limité chaque sous-table à ses 300 premières lignes afin de simplifier les tests
# d’importation.
#
# Enfin, les tables ont été exportées au format CSV à l’aide de la fonction write_csv.
#
# Dans un premier temps, nous avions extrait les 300 premières lignes de la base de données
# globale. Toutefois, afin d'obtenir un échantillon plus équilibré et représentatif dans le
# temps, nous avons modifié notre approche : nous avons sélectionné les 100 premières lignes
# pour chaque année, de 2012 à 2016.
#
# Pour cela, nous avons utilisé la bibliothèque sqldf dans R, qui permet d'exécuter des requêtes
# SQL directement sur des data frames. Par exemple, pour extraire les données de l’année 2012,
# nous avons utilisé la requête suivante :
#
# annee_2012 <- sqldf("SELECT * FROM data_kaggle WHERE year = 2012")
#
# Cette commande retourne toutes les colonnes de la base data_kaggle pour les lignes dont
# l’année est égale à 2012.
#
# Nous avons ensuite appliqué la même méthode pour chaque année (2013 à 2016), puis extrait les
# 100 premières lignes de chaque sous-ensemble. Enfin, nous avons combiné ces sous-ensembles
# afin d’obtenir une table finale regroupant 500 lignes (100 par année). Cette nouvelle table
# est ainsi mieux structurée pour les futures analyses et pourra être importée dans phpMyAdmin
# pour les étapes suivantes de notre projet.
#
# Lors de l’importation de données sur phpMyAdmin, on a rencontré un petit problème : la colonne
# était trop longue pour être insérée dans la table. Du coup, on a modifié simplement le nom de
# la colonne. Elle était :
# « Produits des autres valeurs mobilières et créances de l’actif immobilisé »
# et on l’a changée pour :
# « Produits des autres valeurs mobilières ».


#Charger la bibliothèque
library(readr)

#Lire le fichier CSV
data_kaggle <- read_csv("C:/Users/ibnmt/OneDrive/Documents/Projet_L2/data_kaggle.csv")

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
          "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/entreprises_avec_rentabilite.csv", 
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
write_csv(societe, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/societe.csv")

# Table 2 : Subventions
sous_ensemble_2 <- rbind(
  annee_2012[1:100, ],
  annee_2013[1:100, ],
  annee_2014[1:100, ],
  annee_2015[1:100, ],
  annee_2016[1:100, ]
)
subventions<-sous_ensemble_2[, c("year","siren", "Subventions d’exploitation")]


write_csv(subventions, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/subvention.csv")

# Table 3 : ApeGen
sous_ensemble_3 <- rbind(
  annee_2012[1:100, ],
  annee_2013[1:100, ],
  annee_2014[1:100, ],
  annee_2015[1:100, ],
  annee_2016[1:100, ]
)


apegen<-sous_ensemble_3[, c("ape", "ape_name", "ape_len", "ape_division", "ape_groupe", "ape_classe", "ape_sous_classe")]
write_csv(apegen, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/apegen.csv")

# Table 4 : Chiffre d'Affaires
sous_ensemble_4<- rbind(
  annee_2012[1:100, ],
  annee_2013[1:100, ],
  annee_2014[1:100, ],
  annee_2015[1:100, ],
  annee_2016[1:100, ]
)
chiffre_affaire<-sous_ensemble_4[,c("siren", "Chiffres d’affaires nets", "Impôts, taxes et versements assimilés")]

write_csv(chiffre_affaire, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/chiffre_affaire.csv")

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
write_csv(charge_chiffre, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/charge_chiffre.csv")

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
write_csv(produit_chiffre, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/produit_chiffre.csv")
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
write_csv(compte_resultat, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/compte_resultat.csv")
stock <- sous_ensemble_7[ c("year")]
write_csv(stock, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/stock.csv")
#Après avoir fait le décopage de la base de données pour la manipuler plus facilement maintenat
  