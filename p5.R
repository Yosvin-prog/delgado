# Cargar las librerías necesarias
library(dplyr)

# Leer los datos desde el archivo CSV
datos <- read.csv("Copia-de-09_2024_emergencia_lechugas-Hoja-1.csv")

# Ver los primeros registros para asegurarte de que se cargaron correctamente
head(datos)

# Transformar los datos a formato largo
library(tidyr)

datos_long <- datos %>%
  pivot_longer(cols = starts_with("em_d"), 
               names_to = "dia", 
               values_to = "emergencia") %>%
  filter(!is.na(emergencia))  # Eliminar filas con NA en la columna de emergencia

# Ver la estructura del nuevo conjunto de datos
head(datos_long)

# Realizar ANOVA
anova_result <- aov(emergencia ~ tratamientos, data = datos_long)

# Resumen del ANOVA
summary(anova_result)

# Prueba de Tukey
tukey_result <- TukeyHSD(anova_result)

# Mostrar resultados de Tukey
print(tukey_result)

# Graficar resultados de Tukey
plot(tukey_result)

