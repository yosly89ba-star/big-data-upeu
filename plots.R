ggplot(datos, aes(tiempo, vehiculos, color = punto)) +
  geom_line() +
  labs(
    title = "Incremento del tráfico urbano",
    x = "Tiempo",
    y = "Vehículos"
  ) +
  theme_minimal()
