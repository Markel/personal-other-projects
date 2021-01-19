setwd("A:\\Documents\\proyecto_final\\R\\")
source("dependencias.R") # Funciones auxiliares
par(mfrow=c(1,1))

#################################LEER LOS DATOS#################################

datos <- read.table("datos.txt")
# Al solo tener una columna, lo hacemos mas sencillo de manejar asi
datos <- datos$V1

############################DECLARACIÓN DE VARIABLES############################
k <- 3
CONTINUE = TRUE
contrastar <- obtener_sample(datos,2^(k-1))[1]

###############################PROGRAMA PRINCIPAL###############################
while (CONTINUE) {
	### INICIAR ###
	tamano_muestra <- 2^k
	if (tamano_muestra > length(datos)) {
		print("La muestra mayor que el número de datos.")
		break
	}
	distribucion <- distribucion_correcta(tamano_muestra)
	
	### MUESTRAS ###
	muestra <- obtener_sample(datos, tamano_muestra)
	media_muestra <- muestra[1]
	varianza_muestra <- muestra[2]
	# Quitamos la media y la varianza del vector
	muestra <- muestra[3:length(muestra)]
	
	dt <- sd(muestra)/sqrt(tamano_muestra)
	contrastar_opuesto <- calcular_otro_lado(media_muestra,contrastar)
	
	### P-VALOR ###
	# Los ejemplos que tenemos siempre usan hipótesis mayores que mu0
	if (contrastar > contrastar_opuesto) {
	  p_valor <- calcular_p_valor(distribucion, media_muestra, dt,
	                              tamano_muestra, contrastar)
	} else {
	  p_valor <- calcular_p_valor(distribucion, media_muestra, dt,
	                              tamano_muestra, contrastar_opuesto)
	}

	### DIBUJAR ###
	dibujar_distribucion(distribucion, media_muestra, dt, contrastar, contrastar_opuesto, tamano_muestra)
	if (contrastar > contrastar_opuesto) {
	  rellenar_area(contrastar, TRUE, distribucion, media_muestra, dt, tamano_muestra) # Llamada 1
	  rellenar_area(contrastar_opuesto, FALSE, distribucion, media_muestra, dt, tamano_muestra) # Llamada 2
	} else {
	  rellenar_area(contrastar, FALSE, distribucion, media_muestra, dt, tamano_muestra) # Llamada 1
	  rellenar_area(contrastar_opuesto, TRUE, distribucion, media_muestra, dt, tamano_muestra) # Llamada 2
	}
	escribir_titulo(tamano_muestra,p_valor)

	### DECISIONES ###
	aux <- decidir_hipotesis(p_valor, media_muestra, contrastar)
	CONTINUE <- aux[1]
	contrastar <- aux[2]
	k <- k + 1
}