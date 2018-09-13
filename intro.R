# Instalar paquetes
install.packages("readr")

library(readr)

# Leer datos
cohesion_rezago <- read_csv("data/cohesion_rezago_social.csv")
head(cohesion_rezago)

# Graficación
library(ggplot2)

ggplot(data = cohesion_rezago) + 
  geom_point(mapping = aes(x = Viviendas_sin_lavadora, y = Viviendas_sin_refrigerador)) 

ggplot(data = cohesion_rezago) + 
  geom_point(mapping = aes(x = Viviendas_sin_lavadora, 
      y = Viviendas_sin_refrigerador, color = Grado_de_polarizacion)) 

ggplot(cohesion_rezago, aes(x = Viviendas_sin_lavadora, 
      y = Viviendas_sin_refrigerador)) + 
    geom_line() 

ggplot(mortalidad, aes(x = anio, y = tasa)) +
    geom_point()

ggplot(mortalidad, aes(x = anio, y = tasa, color = sexo)) +
    geom_point()

ggplot(mortalidad, aes(x = factor(anio), y = tasa, color = sexo)) +
    geom_boxplot() 

ggplot(mortalidad, aes(x = factor(anio), y = tasa, color = sexo)) +
    geom_boxplot() +
    facet_wrap(~ tipo)

ggplot(mortalidad, aes(x = factor(anio), y = tasa, color = sexo, group = edo)) +
    geom_path(alpha = 0.5) +
    facet_grid(reorder(tipo, tasa) ~ sexo, scales = "free_y")

# Manipulación
filter(cohesion_rezago, Grado_rezago_social == "Muy alto")

mutate(cohesion_rezago, Pob_miles = Poblacion / 1000) 

summarise(cohesion_rezago, media_pob = mean(Poblacion, na.rm = TRUE))

summarise(cohesion_rezago, media_pob = mean(Poblacion, na.rm = TRUE), 
    mediana_pob = mean(Poblacion, na.rm = TRUE), 
    min_pob = min(Poblacion, na.rm = TRUE), 
    max_pob = max(Poblacion, na.rm = TRUE))

