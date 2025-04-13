library(readr)
library(dplyr)

# Définir le chemin du fichier source
file_path <- "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/data_kaggle.csv"

# Charger le fichier CSV
full_data <- read_csv(file_path)

# Vérification des noms de colonnes disponibles
print(colnames(full_data))

# Table 1 : Société
societe <- full_data[1:300, c("siren", "denomination", "postal_code", "town", "ape")]
write_csv(societe, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/table1_societe.csv")

# Table 2 : Subventions
subvention <- full_data[1:300, c("siren", "Subventions d’exploitation")]
write_csv(subvention, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/table2_subvention.csv")

# Table 3 : ApeGen
apegen <- full_data[1:300, c("ape", "ape_name", "ape_len", "ape_division", "ape_groupe", "ape_classe", "ape_sous_classe")]
write_csv(apegen, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/table3_apegen.csv")

# Table 4 : Chiffre d'Affaires
chiffre_affaire <- full_data[1:300, c("siren", "Chiffres d’affaires nets", "Impôts, taxes et versements assimilés")]
write_csv(chiffre_affaire, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/table4_chiffre_affaire.csv")

# Table 5 : Charges Chiffre
charge_chiffre <- full_data[1:300, c(
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
write_csv(charge_chiffre, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/table5_charge_chiffre.csv")

# Table 6 : Produits Chiffre
produit_chiffre <- full_data[1:300, c(
  "siren", 
  "Total des produits d’exploitation", 
  "Total des produits financiers", 
  "Total des produits exceptionnels", 
  "Autres produits"
)]
write_csv(produit_chiffre, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/table6_produit_chiffre.csv")

# Table 7 : Compte de Résultat
compte_resulta <- full_data[1:300, c(
  "siren", 
  "Chiffres d’affaires nets", 
  "Impôts, taxes et versements assimilés", 
  "Résultat d'exploitation", 
  "Résultat financier", 
  "Résultat en cours avant impôts", 
  "Résultat exceptionnel", 
  "Bénéfices ou perte (Total des produits ‐ Total des charges)"
)]
write_csv(compte_resulta, "C:/Users/ibnmt/OneDrive/Documents/Projet_L2/table7_compte_resulta.csv")

# Vérifier le répertoire de travail actuel
getwd()