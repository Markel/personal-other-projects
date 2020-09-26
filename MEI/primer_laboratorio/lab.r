setwd("C:\\Users\\Markel\\Documents\\GitHub\\personal-boring-projects\\MEI\\primer_laboratorio\\")

read.table("encuesta.txt", header = TRUE) -> datos

datos$Ao -> prvnc

nombres <- c("1990", "1992", "1994", "1996", "1997")

numero <- c(4,1,5,5,17)

barplot(numero, names.arg = nombres, col = "red")
pie(numero, labels = nombres, col = 5:9)

print("Commands finished")