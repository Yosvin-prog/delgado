# Función para calcular el radio dado el área
calcular_radio <- function(area) {
  if (area <= 0) {
    stop("El área debe ser un número positivo.")
  }
  radio <- sqrt(area / pi)
  return(radio)
}

# Ejemplo de uso
area_circulo <- 50
radio <- calcular_radio(area_circulo)
print(paste("El radio del círculo es:", radio))
# Función para verificar si el valor es un texto o un número
verificar_tipo <- function(valor) {
  if (is.numeric(valor)) {
    return("El valor es un número.")
  } else if (is.character(valor)) {
    return("El valor es un texto.")
  } else {
    return("El valor es de otro tipo.")
  }
}

# Ejemplos de uso
print(verificar_tipo(42))           # Debería imprimir "El valor es un número."
print(verificar_tipo("Hola"))       # Debería imprimir "El valor es un texto."
print(verificar_tipo(TRUE))         # Debería imprimir "El valor es de otro tipo."

# Indice de masa corporal -------------------------------------------------
# Función para calcular el IMC y clasificar el peso
calcular_imc <- function(peso, altura) {
  if (peso <= 0 || altura <= 0) {
    stop("El peso y la altura deben ser números positivos.")
  }
  
  imc <- peso / (altura^2)
  
  # Clasificación según el IMC
  if (imc < 18.5) {
    clasificacion <- "Bajo peso"
  } else if (imc >= 18.5 && imc < 24.9) {
    clasificacion <- "Peso saludable"
  } else if (imc >= 25 && imc < 29.9) {
    clasificacion <- "Sobrepeso"
  } else {
    clasificacion <- "Obesidad"
  }
  
  return(list(IMC = imc, Clasificacion = clasificacion))
}

# Ejemplo de uso
peso <- 72  # Peso en kg
altura <- 1.63  # Altura en metros

resultado <- calcular_imc(peso, altura)
print(paste("IMC:", round(resultado$IMC, 2)))
print(paste("Clasificación:", resultado$Clasificacion))

