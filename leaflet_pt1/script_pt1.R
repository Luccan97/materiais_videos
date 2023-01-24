

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
install.packages('fontawesome')library(fontawesome)
# Instalar pacote


library(leaflet)

library(leaflet.extras)

# Pacote sf

library(sf)

library(tidyverse)

# Pacote para baixar dados espaciais do Brasil
# devtools::install_github("ipeaGIT/geobr", subdir = "r-package")

library(geobr)

# Poligonos com concentrações urbanas
urban <- geobr::read_urban_concentrations()

# Pontos
health_units <- geobr::read_health_facilities() %>%
  dplyr::filter(code_muni == 352030)

# Arquivo de exemplo que usarei = Shapefile com os poligonos das UF do Brasil

# Leaflet
# Renderizar um Basemap

# Map1


leaflet() %>%
  
  addProviderTiles(providers$OpenStreetMap) %>%
  # Adicionar pontos estabs de Saúde
  addMarkers(data = health_units,
             icon = iconAwesome("fa-hospital") ) %>%
  addMeasure(primaryLengthUnit = "meters", 
             primaryAreaUnit = "sqmeters", 
             activeColor = "blue", 
             completedColor = "red")

