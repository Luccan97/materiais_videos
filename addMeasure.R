

# Importando as bibliotecas leaflet e geobr
library(leaflet)
library(geobr)

# Lendo os dados de estabelecimentos de saúde e filtrando por código de município
health_units <- geobr::read_health_facilities() %>%
        dplyr::filter(code_muni == 352030)

# Criando um mapa leaflet
m <- leaflet() %>%
        
        # Adicionando as camadas Esri World Imagery como base do mapa
        addProviderTiles(providers$Esri.WorldImagery) %>%
        
        # Adicionando marcadores para os estabelecimentos de saúde
        addMarkers(data = health_units, 
                   label = ~code_cnes) %>%
        
        # Adicionando ferramenta de medição
        addMeasure(primaryLengthUnit = "meters", 
                   primaryAreaUnit = "sqmeters", 
                   activeColor = "blue", 
                   completedColor = "red",
                   labelOptions = labelOptions(
                           style = list("font-size" = "20px", "padding" = "10px")))

# Exibindo o mapa
m
