# Obtener sample
obtener_sample <- function(datos, tamano) {
	muestra <- sample(datos, tamano)
	media <- mean(muestra)
	varianza <- var(muestra)
	return (c(media, varianza, muestra))
}

# Distribución correcta en base al tamaño de la muestra
distribucion_correcta <- function(tamano_muestra) {
	if (tamano_muestra > 30) {
		return("NORMAL")
	} else {
		return("T-STUDENT")
	}
}

calcular_otro_lado <- function(media,contrastar) {
  if (media > contrastar) {
    return(media + abs(media - contrastar))
  } else {
    return(media - abs(media - contrastar))
  }
}

# Dibujar distribución
dibujar_distribucion <- function(distribucion, mean, dt, contrastar, contrastar_opuesto, tamano_muestra) {
	if (distribucion == "NORMAL") {
	  x <- seq(mean-3*dt, mean+3*dt, by=dt/50)
	  y <- dnorm(x,mean,dt)
	  plot(x,y, type="l", col="green")
	} else { # T-Student
	  # Selección de rango https://bit.ly/3hx2R0I
	  bordes <- qt(c(.003, .997), df=tamano_muestra-1) # Dibujar el 99.7% de la distribución
	  x <- seq(bordes[1], bordes[2], 0.1)
	  y <- dt(x, df = tamano_muestra-1)
	  x <- seq(mean+bordes[1], mean+bordes[2], 0.1) # Ajustamos el eje x a la media (bordes[1] es negativo con lo que sumamos)
	  # A este plot hay que ponerle límites o si no se va a 30 valores de distancia de la media (en n=2)
	  plot(x,y, type="l", col="green",
	       xlim=c(max(mean+bordes[1], mean-20), min(mean+bordes[2], mean+20))) # El límite solo afecta si se pasa
	}
	lines(c(min(x),max(x)),c(min(y),min(y)), col="blue")
	text(media_muestra, min(y),"mk", col="red")
	text(contrastar, min(y),"hi", col="red")
	text(contrastar_opuesto, min(y), "hi*", col="red")
}

# Escribe el título del gráfico (posiblemente se podría implementar en dibujar_distribucion)
escribir_titulo <- function(tamano_muestra, p_valor) {
	titulo <- paste("n=", tamano_muestra, " con p-valor=", round(p_valor, 5))
	title(titulo)
}

# Las barras verticales moradas que marcan el espacio del p-valor
rellenar_area <- function(valor, hacia_arriba, distribucion, media, dt, tamano_muestra) {
  if (distribucion == "NORMAL") {
    # Comprobamos que la hipótesis esté dentro de gráfico
    if (media-3*dt<=valor & valor<=media+3*dt) {
      if (hacia_arriba) {
        # Utilizamos dt/5 como paso para que el espacio entre líneas sea uniforme en todos los gráficos
        ab <- seq(valor, media+3*dt, dt/5)
        r <- dnorm(ab, media, dt)
        lines(ab, r, type = "h", col ="purple")
      } else {
        ab <- seq(media-3*dt, valor, dt/5)
        r <- dnorm(ab, media, dt)
        lines(ab, r, type = "h", col ="purple")
      }
    }
  } else { # T_STUDENT
    bordes <- qt(c(.003, .997), df=tamano_muestra-1) + media
    # Comprobar que está dentro del gráfico
    if (bordes[1]<=valor & valor<=bordes[2]) {
      if (hacia_arriba) {
        ab <- seq(valor, bordes[2], (bordes[2]-media)/25)
        r <- dt(ab-media, df = tamano_muestra-1)
        lines(ab, r, type = "h", col="purple")
      } else {
        ab <- seq(bordes[1], valor, (bordes[2]-media)/25)
        r <- dt(ab-media, df = tamano_muestra-1)
        lines(ab, r, type = "h", col="purple")
      }
    }
  }
}

# Calcular el p-valor
calcular_p_valor <- function(distribucion, mean, dt, tamano_muestra, contrastar) {
  # La función siempre recibe una mean < contrastar
  # Tipificamos (posiblemente no sea necesario)
  a_tabla <- (mean-contrastar)/dt
  if (distribucion == "T-STUDENT") {
    p_valor <- pt(a_tabla, tamano_muestra-1)
  } else { # Normal
    p_valor <- pnorm(a_tabla, lower.tail = TRUE)
  }
  return(p_valor)
}

# Esta función determina si el p-valor es suficiente y se debe seguir o pararse
decidir_hipotesis <- function(p_valor, mean, hipotesis) {
  if (p_valor > 0.01) {
		cat(paste("Aceptamos la hipotesis", round(hipotesis,5), "(media:", round(mean, 5) ,") debido a que ", round(p_valor, 5) , "es mayor que 0.01.\n"))
		return(c(FALSE, contrastar))
	}
	if (p_valor > 0.001) { # Ya sabemos que tiene que ser < 0.01
		cat(paste("Mantenemos la hipotesis aumentando la muestra debido a que p-valor es", round(p_valor, 5), ".\n"))
		return(c(TRUE, contrastar))
	}
	cat("Rechazamos la hipotesis (", round(hipotesis,5),") y la cambiamos mientras aumentamos la muestra debido a que p-valor es", round(p_valor, 5), ".\n")
	return(c(TRUE, mean))
}