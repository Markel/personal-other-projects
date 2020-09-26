# Prime numbers detector
# Prime: 2413927
# Not prime: 2413926
maybeprime <- 2413926

for (i in (3:maybeprime - 1)) {
   if ((maybeprime) %% i == 0) {
      cat("No es primo, es divisible entre:", i, "\n")
   }
}