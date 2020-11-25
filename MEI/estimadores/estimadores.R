setwd("C:\\Users\\Markel\\Documents\\GitHub\\projects\\MEI\\estimadores\\")
par(mfrow=c(2,2))

generar <- function(N,mu) {
  sigma <- runif (1,5,25)
  poblacion <- rnorm(N,mu,sigma)
  return(poblacion)
}

# Para generar una nueva población, descomenta las siguientes líneas
# mu <- runif(1,0,100)
# poblacion <- generar(5000, mu)
# hist(poblacion) # Esta simplemente es para visualizar la población


# Calcular media y varianza de una media
for (tm in c(5,25,50,100)) {
  muestra <- sample(poblacion,tm)
  
  media <- round(mean(muestra),4)  
  varianza <- round(var(muestra),4)
  
  
  # Calcular la media de las muestras
  n_muestras <- 100
  medias <- c()
  varianzas <- c()
  
  for (i in 1:n_muestras) {
    medias[i] <- mean(sample(poblacion,tm))
    varianzas[i] <- var(sample(poblacion,tm))
  }
  sm <- sd(medias)
  
  hist(medias, freq = FALSE, main=paste("tm =", tm))
  text(mu,0,"μ", col="red")
  text(mu-sm,0,"[", col="red")
  text(mu+sm,0,"]", col="red")
}