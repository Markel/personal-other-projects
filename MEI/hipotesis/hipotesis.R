setwd("C:\\Users\\Markel\\Documents\\GitHub\\projects\\MEI\\hipotesis\\")

N = 10
N2 = 20

a <- read.table("a.txt")
poblacion <- a$V4

# mu0 valor de 1 muestra tamaño 2
# Test: tomamos muestras de tamaño N = 5,25,50
# H0: mu = mu0
# H1: mu != mu0
# Si media > mu0 && media > mu0 => colas
# Distribución de H0: N(mu0, (desviacion de muestra/sqrt(N)))
# if (p_valor < alpha) then descartamos

# Muestra 1
muestra <- sample(poblacion,N)
mu0 <- mean(muestra)

# Muestra 2
muestra2 <- sample(poblacion,N2)
mm <- mean(muestra2)

# Suponer que mu es mu0 (H0)
# Suponer que mu != mu0 (H1)

dt <- sd(muestra)/sqrt(N) # Más o menos la varianza

# Generar la curva normal
x <- seq(mu0-3*dt, mu0+3*dt,0.01)
y <- dnorm(x,mu0,dt)
plot(x,y, type="l", col="green")
lines(c(min(x),max(x)),c(0,0), col="blue")

# Poner los puntos
text(mu0, 0.025, "mu0", col="red")
text(mm, 0.025, "mm", col="red")

if (mu0 > mm) {
  # Dibujar el lado izquierdo
  ab <- seq (min(x), mm, 0.15) # La raíz cuadrada es para que quede bien en diferentes muestras, podría ser un número fijo
  r <- dnorm(ab, mu0, dt)
  lines(ab, r, type = "h", col ="purple")
  
  mme <- mu0 + abs(mu0 - mm)
  p_valor <- 2 * pnorm(mm, mu0, dt)
  
  # Dibujar el lado derecho
  ab <- seq (mme, max(x), 0.1) # La raíz cuadrada es para que quede bien en diferentes muestras, podría ser un número fijo
  r <- dnorm(ab, mu0, dt)
  lines(ab, r, type = "h", col ="purple")
  
} else {
  # Dibujar el lado derecho
  ab <- seq (mm, max(x), 0.1) # La raíz cuadrada es para que quede bien en diferentes muestras, podría ser un número fijo
  r <- dnorm(ab, mu0, dt)
  lines(ab, r, type = "h", col ="purple")
  
  mme <- mu0 - abs(mu0 - mm)
  p_valor <- 2 * pnorm(mme, mu0, dt)
  
  # Dibujar el lado izquierdo
  ab <- seq (min(x), mme, 0.1) # La raíz cuadrada es para que quede bien en diferentes muestras, podría ser un número fijo
  r <- dnorm(ab, mu0, dt)
  lines(ab, r, type = "h", col ="purple")
}

text(mme, 0.025, "mm*", col="red")

# DESCARTAR HIPÓTESIS
for (alpha in c(0.05,0.01,0.001)) {
  if (p_valor < 1-alpha) {
    cat("La hipótesis es descartada cuando alpha es", alpha, "\n")
  } else {
    cat("La hipótesis no es descartada cuando alpha es", alpha, "\n")
  }
}
