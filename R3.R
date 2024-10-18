# Función para calcular el IMC y clasificar el peso
imc <- function(peso, altura) {
if (peso <= 0 || altura <= 0) {
    stop("El peso y la altura deben ser números positivos.")
  }
  
  IMC <- peso / (altura^2)
  
  # Clasificación según el IMC
  if (IMC < 18.5) {
    clasificacion <- "Bajo peso"
  } else if (IMC >= 18.5 && IMC < 24.9) {
    clasificacion <- "Peso saludable"
  } else if (IMC >= 25 && IMC < 29.9) {
    clasificacion <- "Sobrepeso"
  } else {
    clasificacion <- "Obesidad"
  }
  
  return(list(IMC = imc, Clasificacion = clasificacion))
}

# Ejemplo de uso
peso <- 75  # Peso en kg
altura <- 1.75  # Altura en metros

resultado <- calcular_imc(peso, altura)
print(paste("IMC:", round(resultado$IMC, 2)))
print(paste("Clasificación:", resultado$Clasificacion))
