

# Leaflet - biblioteca OpenSource escrita em Javascript

# pacote leaflet no R permite uma intergração!

# Criar mapas interativos diretamente do RStudio
# Renderizar em aplicativos, páginas web (Shiny)

# Elementos disponíveis
# - Base maps
# - Camadas vetoriais (polígonos, linhas e pontos)
# - Popups, legenda, interatividade
# - Incoporar camadas externas (pacotes sf ou sp)

# Leaflet extras

# Funcionalidades extras 

# Instalar pacote
install.packages('leaflet')
install.packages('leafletextras')

library(leaflet)

library(leaflet.extras)

# Pacote sf

library(sf)

library(tidyverse)

# Pacote para baixar dados espaciais do Brasil
devtools::install_github("ipeaGIT/geobr", subdir = "r-package")

library(geobr)

# Poligonos com concentrações urbanas
urban <- geobr::read_urban_concentrations()

# Pontos
health_units <- geobr::read_health_facilities() %>%
  dplyr::filter(abbrev_state == "SC")

# Arquivo de exemplo que usarei = Shapefile com os poligonos das UF do Brasil

# Leaflet
# Renderizar um Basemap

# Map1
library(leaflet)

leaflet() %>%
  
  addProviderTiles(providers$OpenStreetMap) %>%
  # Adicionar poligonos
  addPolygons(data = urban, 
              color = "red",
              weight = 1) %>%
  # Adicionar pontos
  addCircles(data = health_units, 
             radius = 30, 
             stroke = F) 

