# Filtrer les valeurs strictement positives
ca_nets_pos <- data_kaggle$`Chiffres d’affaires nets`
summary(ca_nets_pos,na.rm = TRUE)
Min.    1st Qu.     Median       Mean    3rd Qu.       Max.       NA's 
 -32175143     123754     452565    5660321    1522934 7442405000      12756 
#Minimum négatif (-32,2 M€) : incohérent économiquement, un chiffre d'affaires ne peut pas être négatif.
#Ces données devraient être examinées, voire exclues pour les analyses statistiques et graphiques.
#Moyenne (5,66 M€) bien supérieure à la médiane (452 565 €) :
#Cela indique une distribution fortement asymétrique à droite, causée par des valeurs extrêmes très élevées (entreprises géantes).
#1er et 3e quartile (Q1 = 123 754 € ; Q3 = 1 522 934 €) :
#50 % des entreprises ont un CA net compris entre ces deux valeurs,
#ce qui reflète une forte concentration autour de la petite et moyenne entreprise.
#Maximum (7,44 milliards €) : très élevé, reflétant une extrême hétérogénéité dans la taille des entreprises.
#Ce type de valeur influence fortement la moyenne (effet des outliers).
#Nombre de valeurs manquantes : 12 756 → à prendre en compte dans les analyses (traitement ou imputation).

hist(
  log10(data_kaggle$`Chiffres d’affaires nets`[data_kaggle$`Chiffres d’affaires nets` > 0]),
  breaks = 100,
  main = "Distribution du chiffre d'affaires net ",
  xlab = "Chiffre d'affaires net en euros",
  col = "darkgreen",
  border = "white"
)
# On peut remarquer que la fréquence est particulièrement élevée pour le chiffre d'affaires 
# correspondant à la valeur 7 sur l’échelle logarithmique, ce qui équivaut à 10^7, soit 10 000 000 euros. 
# 
# Cela indique que de nombreuses entreprises déclarent un chiffre d’affaires autour de 10 millions d’euros, 
# ce qui montre l’importance de cette valeur dans la distribution de cette variable quantitative continue. 
# Cette concentration justifie une attention particulière dans l’analyse économique du dataset.

# Créer un boxplot en échelle log10
boxplot(
  log10(data_kaggle$`Chiffres d’affaires nets`[data_kaggle$`Chiffres d’affaires nets` > 0]),
  main = "Boxplot du chiffre d'affaires net ",
  ylab = "Chiffre d'affaires net en euros",
  col = "skyblue",
  border = "darkblue"
)


# Filtrer les valeurs strictement positives
taxes_pos <- data_kaggle$`Impôts, taxes et versements assimilés`
summary(taxes_pos)
# Résultat : 99212
# Histogramme log10 des impôts, taxes et versements assimilés
hist(
  log10(data_kaggle$`Impôts, taxes et versements assimilés`[data_kaggle$`Impôts, taxes et versements assimilés` > 0]),
  breaks = 100,
  main = "Distribution des impôts, taxes et versements assimilés ",
  xlab = "Impôts, taxes et versements assimilés en euros",
  col = "darkred",
  border = "white"
)
##CHIFFRES D'AFFAIRES NETS
#Pour le chiffres d'affaires on a gardé uniquement les valeurs strictement positives .
#La moyenne est éleves c'est pour ça on peut conclure que il y a des grandes entreprises dans notre base de données
#La médiane est plus faible que la moyenne montre que la distribution est asymétrique.
#L'écart type est très grand reflétant une forte hétérogénité
#Impots:
summary(ca_nets_pos,na.rm = TRUE)
# Après avoir réalisé l'histogramme de la variable quantitative continue 
# "Impôts, taxes et versements assimilés" (en euros), nous avons appliqué 
# une échelle logarithmique afin d'améliorer la lisibilité du graphique 
# et de faciliter l’interprétation des données.
# 
# On observe alors que la fréquence la plus élevée correspond à la valeur 4 
# sur l’échelle logarithmique, ce qui équivaut à 10^4, soit 40 000 euros. 
# Cela signifie qu’un grand nombre d’entreprises déclarent environ 40 000 euros 
# au titre des impôts, taxes et versements assimilés.
