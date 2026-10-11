library(tidyverse)

# 1. Estructura general
dim(datos)          # filas y columnas
glimpse(datos)      # tipo de cada variable
head(datos)
tail(datos)

# 2. Resumen estadístico
summary(datos)

# 3. Datos faltantes y duplicados
colSums(is.na(datos))
sum(duplicated(datos))

# 4. Variables categóricas
table(datos$punto)
table(datos$congestion)
prop.table(table(datos$congestion))

# 5. Variables numéricas: media, desviación, mínimo y máximo
datos %>%
  summarise(
    veh_media = mean(vehiculos), veh_sd = sd(vehiculos),
    veh_min = min(vehiculos), veh_max = max(vehiculos),
    vel_media = mean(velocidad_kmh), vel_sd = sd(velocidad_kmh)
  )

# 6. Promedio de vehículos por hora del día
datos %>%
  group_by(hora_entera = floor(hora)) %>%
  summarise(vehiculos_prom = mean(vehiculos))

# 7. Correlación entre vehículos y velocidad
cor(datos$vehiculos, datos$velocidad_kmh)

# 8. Gráficos
ggplot(datos, aes(vehiculos)) +
  geom_histogram(bins = 30)

ggplot(datos, aes(punto, vehiculos)) +
  geom_boxplot()

ggplot(datos, aes(tiempo, vehiculos, color = punto)) +
  geom_line()

ggplot(datos, aes(vehiculos, velocidad_kmh)) +
  geom_point(alpha = 0.3) +
  geom_smooth()
