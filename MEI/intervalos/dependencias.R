generar <- function(N,mu) {
  sigma <- runif (1,5,25)
  poblacion <- rnorm(N,mu,sigma)
  return(poblacion)
}

muestreo <- function(poblacion,tm) {
  muestra <- sample(poblacion,tm)
  
  media <- mean(muestra)
  varianza <- var(muestra)
  
  return(c(media,varianza))
}

calcula_i_c <- function(N,media,varianza,alpha) {
  z01 <- qnorm((1-alpha/2), media, sqrt(varianza), lower.tail=FALSE)
  delta <- z01*sqrt(varianza)/sqrt(N)
  a <- media + delta
  b <- media - delta
  return(c(a,b))
}

dibujar <- function(N, mu, sm, a, b) {
  hist(poblacion, freq=FALSE)
  
  # Delimitar el espacio
  text(a,0,"[", col="red")
  text(b,0,"]", col="red")
  
  # Dibujar la normal
  x <- seq(mu - 3*sm, mu + 3*sm, 0.05)
  y <- dnorm(x, mu, sm)
  lines(x,y, col = "red")
  
  # Dibujar el intervalo [a, b]
  ab <- seq (a, b, sm^(1/7)) # La raíz cuadrada es para que quede bien en diferentes muestras, podría ser un número fijo
  r <- dnorm(ab, mu, sm)
  lines(ab, r, type = "h", col ="green")
  
  # Expresar el valor del intervalo
  text(a, 0.01, 1-alpha)
}