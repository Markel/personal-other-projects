setwd("C:\\Users\\Markel\\Documents\\GitHub\\projects\\MEI\\precios\\")
source("funciones.R")

read.table("precios_2017.txt", header = TRUE) -> datos

d_4 <- datos$V20

d_euros <- datos$euros
d_m <- datos$m2

hist(d_euros)
es_campana(d_euros)
hist(d_m)
es_campana(d_m)