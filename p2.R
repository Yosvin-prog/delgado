
# Cargar las librerías necesarias
library(ggplot2)
library(dplyr)
library(agricolae)

# Leer los datos desde el archivo CSV
datos <- read.csv("datos_emergencia_largo.csv")

# Ver los primeros registros para asegurarte de que se cargaron correctamente
head(datos)
# Realizar ANOVA
anova_result <- aov(emergencia ~ tratamientos, data = datos)
summary(anova_result)

# Prueba de Tunkey --------------------------------------------------------
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)

# Graficar resultados de Tukey
plot(tukey_result)

# Grafico Linial  ---------------------------------------------------------
# Calcular la media y desviación estándar por tratamiento
summary_data <- datos %>%
  group_by(tratamientos) %>%
  summarise(media = mean(emergencia, na.rm = TRUE),
            sd = sd(emergencia, na.rm = TRUE))

# Crear gráfico lineal
ggplot(summary_data, aes(x = tratamientos, y = media)) +
  geom_line() +
  geom_point() +
  geom_errorbar(aes(ymin = media - sd, ymax = media + sd), width = 0.2) +
  labs(title = "Emergencia Promedio por Tratamiento",
       x = "Tratamientos",
       y = "Emergencia Promedio") +
  theme_minimal()

# Gráficos de Percentiles  ------------------------------------------------
ggplot(datos, aes(x = tratamientos, y = emergencia)) +
  geom_boxplot() +
  labs(title = "Gráfico de Percentiles por Tratamiento",
       x = "Tratamientos",
       y = "Emergencia") +
  theme_minimal()

# Gráfico del ANOVA -------------------------------------------------------

# Cargar las librerías necesarias
library(agricolae)
library(ggplot2)

# Leer los datos desde el archivo CSV
datos <- read.csv("datos_emergencia_largo.csv")

# Realizar ANOVA
anova_result <- aov(emergencia ~ tratamientos, data = datos)

# Crear gráfico de interacciones
interaction.plot(datos$dia, datos$tratamientos, datos$emergencia,
                 xlab = "Día", ylab = "Emergencia",
                 main = "Gráfico de Interacciones - ANOVA",
                 col = 1:4, pch = 1:4, leg.bty = "o")

# Grafico de Túnel  -------------------------------------------------------

# Cargar las librerías necesarias
library(ggplot2)
library(dplyr)

# Leer los datos desde el archivo CSV
datos <- read.csv("datos_emergencia_largo.csv")

# Ver los primeros registros para asegurarte de que se cargaron correctamente
head(datos)
# Convertir la columna 'emergencia' a numérica, si es necesario
datos$emergencia <- as.numeric(as.character(datos$emergencia))

# Filtrar datos para eliminar filas con NA
datos <- na.omit(datos)
# Calcular la media de emergencia por tratamiento y día
summary_data <- datos %>%
  group_by(tratamientos, dia) %>%
  summarise(media_emergencia = mean(emergencia, na.rm = TRUE))

# Crear el gráfico en túneles
ggplot(summary_data, aes(x = dia, y = media_emergencia, color = tratamientos, group = tratamientos)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(title = "Gráfico en Túneles - Emergencia por Tratamiento",
       x = "Día",
       y = "Emergencia Promedio") +
  theme_minimal() +
  theme(legend.title = element_blank())
# Cargar las librerías necesarias
library(ggplot2)
library(dplyr)

# Leer los datos desde el archivo CSV
datos <- read.csv("datos_emergencia_largo.csv")

# Ver los primeros registros para asegurarte de que se cargaron correctamente
head(datos)

# Convertir la columna 'emergencia' a numérica, si es necesario
datos$emergencia <- as.numeric(as.character(datos$emergencia))

# Filtrar datos para eliminar filas con NA
datos <- na.omit(datos)
# Calcular la media de emergencia por tratamiento y día
summary_data <- datos %>%
  group_by(tratamientos, dia) %>%
  summarise(media_emergencia = mean(emergencia, na.rm = TRUE))

# Crear el gráfico en túneles con linewidth
ggplot(summary_data, aes(x = dia, y = media_emergencia, color = tratamientos, group = tratamientos)) +
  geom_line(size = 1.5) +  # Ajusta el tamaño de la línea aquí
  geom_point(size = 3) +   # Tamaño de los puntos
  labs(title = "Gráfico en Túneles - Emergencia por Tratamiento",
       x = "Día",
       y = "Emergencia Promedio") +
  theme_minimal() +
  theme(legend.title = element_blank())

# gráfico de barras de las medias y estándar error ------------------------
# Cargar las librerías necesarias
library(ggplot2)
library(dplyr)

# Leer los datos desde el archivo CSV
datos <- read.csv("datos_emergencia_largo.csv")

# Ver los primeros registros para asegurarte de que se cargaron correctamente
head(datos)


# Convertir la columna 'emergencia' a numérica, si es necesario
datos$emergencia <- as.numeric(as.character(datos$emergencia))

# Filtrar datos para eliminar filas con NA
datos <- na.omit(datos)






# Calcular la media y el error estándar por tratamiento
summary_data <- datos %>%
  group_by(tratamientos) %>%
  summarise(media = mean(emergencia, na.rm = TRUE),
            se = sd(emergencia, na.rm = TRUE) / sqrt(n()))  # Error estándar



# Crear gráfico de barras con medias y error estándar
ggplot(summary_data, aes(x = tratamientos, y = media)) +
  geom_bar(stat = "identity", fill = "skyblue", width = 0.7) + 
  geom_errorbar(aes(ymin = media - se, ymax = media + se), width = 0.2) +
  labs(title = "Emergencia Promedio por Tratamiento",
       x = "Tratamientos",
       y = "Emergencia Promedio") +
  theme_minimal()

# Con colores -------------------------------------------------------------

# Cargar las librerías necesarias
library(ggplot2)
library(dplyr)

# Leer los datos desde el archivo CSV
datos <- read.csv("datos_emergencia_largo.csv")

# Ver los primeros registros para asegurarte de que se cargaron correctamente
head(datos)


# Convertir la columna 'emergencia' a numérica, si es necesario
datos$emergencia <- as.numeric(as.character(datos$emergencia))

# Filtrar datos para eliminar filas con NA
datos <- na.omit(datos)


# Calcular la media y el error estándar por tratamiento
summary_data <- datos %>%
  group_by(tratamientos) %>%
  summarise(media = mean(emergencia, na.rm = TRUE),
            se = sd(emergencia, na.rm = TRUE) / sqrt(n()))  # Error estándar


# Crear gráfico de barras con medias y error estándar
ggplot(summary_data, aes(x = tratamientos, y = media, fill = tratamientos)) +
  geom_bar(stat = "identity", width = 0.7) + 
  geom_errorbar(aes(ymin = media - se, ymax = media + se), width = 0.2) +
  labs(title = "Emergencia Promedio por Tratamiento",
       x = "Tratamientos",
       y = "Emergencia Promedio") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1") + # Cambiar la paleta de colores si es necesario
  theme(legend.title = element_blank())

# Histograma  -------------------------------------------------------------
# Cargar las librerías necesarias
library(ggplot2)
library(dplyr)

# Leer los datos desde el archivo CSV
datos <- read.csv("datos_emergencia_largo.csv")

# Ver los primeros registros para asegurarte de que se cargaron correctamente
head(datos)


# Convertir la columna 'emergencia' a numérica, si es necesario
datos$emergencia <- as.numeric(as.character(datos$emergencia))

# Filtrar datos para eliminar filas con NA
datos <- na.omit(datos)

# Calcular la media de emergencia por tratamiento y día
summary_data <- datos %>%
  group_by(tratamientos, dia) %>%
  summarise(media_emergencia = mean(emergencia, na.rm = TRUE))
# Crear gráfico de líneas para mostrar la evolución de la emergencia
ggplot(summary_data, aes(x = dia, y = media_emergencia, color = tratamientos, group = tratamientos)) +
  geom_line(size = 1.2) +  # Ajusta el grosor de las líneas aquí
  geom_point(size = 3) +   # Tamaño de los puntos
  labs(title = "Evolución de la Emergencia por Tratamiento",
       x = "Día",
       y = "Emergencia Promedio") +
  theme_minimal() +
  theme(legend.title = element_blank())

# Tabla ANOVA  ------------------------------------------------------------

# Cargar las librerías necesarias
library(dplyr)

# Leer los datos desde el archivo CSV
datos <- read.csv("datos_emergencia_largo.csv")

# Ver los primeros registros para asegurarte de que se cargaron correctamente
head(datos)
# Graficas Finales  -------------------------------------------------------
install.packages("gridExtra")
# Cargar las librerías necesarias
library(dplyr)
library(tidyr)
library(ggplot2)
library(gridExtra)  # Para organizar múltiples gráficos

# Leer los datos desde el archivo CSV
datos <- read.csv("datos_emergencia_largo.csv")

# Ver los primeros registros para asegurarte de que se cargaron correctamente
head(datos)

# Transformar los datos a formato largo
datos_long <- datos %>%
  pivot_longer(cols = starts_with("em_d"), 
               names_to = "dia", 
               values_to = "emergencia") %>%
  filter(!is.na(emergencia))  # Eliminar filas con NA en la columna de emergencia

# Ver la estructura del nuevo conjunto de datos
head(datos_long)

# Calcular la media y el error estándar por tratamiento
summary_data <- datos_long %>%
  group_by(tratamientos) %>%
  summarise(media = mean(emergencia, na.rm = TRUE),
            se = sd(emergencia, na.rm = TRUE) / sqrt(n()))  # Error estándar

# Calcular la media de emergencia por tratamiento y día para el gráfico de líneas
summary_data_lineas <- datos_long %>%
  group_by(tratamientos, dia) %>%
  summarise(media_emergencia = mean(emergencia, na.rm = TRUE))


# Gráfico de barras con medias y error estándar
bar_plot <- ggplot(summary_data, aes(x = tratamientos, y = media, fill = tratamientos)) +
  geom_bar(stat = "identity", width = 0.7) + 
  geom_errorbar(aes(ymin = media - se, ymax = media + se), width = 0.2) +
  labs(title = "Emergencia Promedio por Tratamiento",
       x = "Tratamientos",
       y = "Emergencia Promedio") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1") +
  theme(legend.position="none")

# Histograma de emergencias
histogram_plot <- ggplot(datos_long, aes(x = emergencia)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Histograma de Emergencia",
       x = "Emergencia",
       y = "Frecuencia") +
  theme_minimal()

# Gráfico de líneas para mostrar la evolución de la emergencia
line_plot <- ggplot(summary_data_lineas, aes(x = dia, y = media_emergencia, color = tratamientos, group = tratamientos)) +
  geom_line(size = 1.2) +  
  geom_point(size = 3) +   
  labs(title = "Evolución de la Emergencia por Tratamiento",
       x = "Día",
       y = "Emergencia Promedio") +
  theme_minimal() +
  theme(legend.title=element_blank())

# Boxplot para comparar tratamientos
boxplot_plot <- ggplot(datos_long, aes(x = tratamientos, y = emergencia)) +
  geom_boxplot(fill="lightblue") +
  labs(title="Boxplot de Emergencias por Tratamiento",
       x="Tratamientos",
       y="Emergencia") +
  theme_minimal()


# Organizar todos los gráficos en una sola visualización
grid.arrange(bar_plot, histogram_plot, line_plot, boxplot_plot,
             ncol=2)

# Porcentaje  -------------------------------------------------------------

# Cargar las librerías necesarias
library(dplyr)
library(tidyr)
library(ggplot2)

# Leer los datos desde el archivo CSV
datos <- read.csv("datos_emergencia_largo.csv")

# Ver los primeros registros para asegurarte de que se cargaron correctamente
head(datos)
# Definir el número total de semillas sembradas por repetición
total_semillas <- 20

# Transformar los datos a formato largo y calcular el porcentaje de germinación
datos_long <- datos %>%
  pivot_longer(cols = starts_with("em_d"), 
               names_to = "dia", 
               values_to = "emergencia") %>%
  mutate(porcentaje_germinacion = (emergencia / total_semillas) * 100) %>%
  filter(!is.na(emergencia))  # Eliminar filas con NA en la columna de emergencia

# Ver la estructura del nuevo conjunto de datos
head(datos_long)
# Calcular la media del porcentaje de germinación por tratamiento
summary_data <- datos_long %>%
  group_by(tratamientos) %>%
  summarise(media_porcentaje = mean(porcentaje_germinacion, na.rm = TRUE),
            se = sd(porcentaje_germinacion, na.rm = TRUE) / sqrt(n()))  # Error estándar

# Crear gráfico de barras con medias y error estándar del porcentaje de germinación
bar_plot <- ggplot(summary_data, aes(x = tratamientos, y = media_porcentaje, fill = tratamientos)) +
  geom_bar(stat = "identity", width = 0.7) + 
  geom_errorbar(aes(ymin = media_porcentaje - se, ymax = media_porcentaje + se), width = 0.2) +
  labs(title = "Porcentaje Promedio de Germinación por Tratamiento",
       x = "Tratamientos",
       y = "Porcentaje de Germinación (%)") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1") +
  theme(legend.position="none")

# Mostrar el gráfico
print(bar_plot)

