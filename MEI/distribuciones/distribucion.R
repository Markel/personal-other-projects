setwd("C:\\Users\\ehu\\Downloads\\")
#source("funciones.R")

read.table("a.txt") -> a
read.table("b.txt") -> b
read.table("c.txt") -> c

######################### A ##############################
a_4 <- a$V4

mu <- round(mean(a_4))
s  <- round(sd(a_4))

# Primer histograma
hist(a_4, freq = FALSE)
text(mu,-0.003, "mu", col = "red")
x <- seq(mu - 3*s, mu + 3*s, 0.05)
y <- dnorm(x, mu, s)
z <- pnorm(x, mu, s)
lines(x,y, col = "red")
lines(x,z, col = "blue")



# Cálculo de rangos (a > b)
a <- 13
b <- 11

text(a, 0.1, round(pnorm(b,mu,s) - pnorm (a,mu,s), digits = 4))

ab <- seq (b, a, 0.1)
r <- dnorm(ab, mu, s)
lines(ab, r, type = "h", col ="green")


# El segundo diagrama de dispersión

plot(x,z)
lines(x,y)
