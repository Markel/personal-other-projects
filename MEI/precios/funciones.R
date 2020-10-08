es_campana <- function (vector) {
  mean(vector) -> media
  sd(vector) -> variacion_tipica
  porcentajes <- c(0.68, 0.95, 0.997)
  n <- length(vector)
  for (i in 1:3) {
    x <- vector[vector>media-i*variacion_tipica & vector<media+i*variacion_tipica]
    nx <- length(x)
    if(nx/n < porcentajes[i]) {
      print("No es acampanada")
      print(paste(nx/n, "valores en intervalo", i))
      points(x,rep(0,nx), col=i+1)
      return(TRUE)
    }
    else {
      print("Es acampanada porque sigue la regla del 68-95-99.7")
      return(FALSE)
    }
  }
}