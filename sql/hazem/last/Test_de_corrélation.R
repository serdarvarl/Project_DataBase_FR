install.packages("ggplot2")
library(ggplot2)
# Scatter plot log-log avec ggplot

#on va faire le test de corrélation avec le nuage de points entre les deux variables rentabilité 
#et Impots , taxes et versements assimilés :
ggplot(data_kaggle, aes(x = `Chiffres d’affaires nets`, y = `Impôts, taxes et versements assimilés`)) +
  geom_point(color = "blue", alpha = 0.7) +
  scale_x_log10() +
  scale_y_log10() +
  labs(
    title = "Nuage de points entre les chiffres d'affaires nets et les impôts, taxes et versements assimilés (échelle log)",
    x = "Chiffres d'affaires nets (log)",
    y = "Impôts, taxes et versements assimilés (log)"
  ) +
  theme_minimal()
# Filtrer les lignes avec des valeurs > 0 pour éviter log(0)
valid_data <- data_kaggle[
  data_kaggle$`Chiffres d’affaires nets` > 0 &
    data_kaggle$`Impôts, taxes et versements assimilés` > 0,
]

# Corrélation sur log
cor(
  log(valid_data$`Chiffres d’affaires nets`),
  log(valid_data$`Impôts, taxes et versements assimilés`),
  use = "complete.obs"
)

#TEST de corrélation entre les chiffres d'affaires nets et l'impots,taxes 
#On souhaiterai savoir le lien entre deux variables dans notre BD (test de corélation)
#On a trouvé que r(xy)=0.8116802
#Hypothese:  Chiffres d'affaires nets et Impots,taxes  sont non corrélées linéairement
#n=27016
#lalpha/2=1.9600
alpha<-0.05
quant<-qnorm(1-alpha/2)
quant
test<-quant/sqrt(27016-1)
test
#R>test
#On peut affirmer qu'il existe une corrélation linéaire entre la variale chiffres d'affaires nets et la taxe.
#D'après le test de corrélaion et le nuage de points on peut affirmer que le test et le nuage de points sont 
#compatible donc il existe un nlien entre les deux variables.(Corrélation positive forte )
#L’analyse conjointe du nuage de points logarithmique et du test de corrélation de Pearson permet de 
#conclure qu’il existe une corrélation linéaire forte et significative entre les chiffres d’affaires nets et les
#impôts, taxes et versements assimilés. En d’autres termes, plus le chiffre d’affaires est élevé, plus les 
#montants d’impôts et taxes versés le sont également, ce qui est cohérent avec une logique fiscale 
#progressive.