setwd("C:\\Users\\Markel\\Documents\\GitHub\\personal-other-projects\\MEI\\intervalos\\")

# source("estimadores.R")
# source("distribucion.R")
source("dependencias.R")

# Tengo dudas de que el intervalo (la zona verde) sean los correctos para un 95% de los datos

N <- 100
alpha <- 0.05

# Generar población
poblacion <- generar(500, mu <- runif(1,0,50)) 

# Valores
aux <- muestreo(poblacion, N) 
media <- aux[1]
cuazivarianza <- aux[2]

# Estimar intervalo
aux <- calcula_i_c(N,media,cuazivarianza,alpha)

if (aux[1]<aux[2]) { # Se debe cumplir a<b
  a <- aux[1]
  b <- aux[2]
} else {
  b <- aux[1]
  a <- aux[2]
}

# Dibujar
sd <- sqrt(cuazivarianza)

dibujar(N, media, sd, a, b)