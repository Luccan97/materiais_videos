# Instalar versão mais atualizada direto do Repositório no Github
install_github("bczernecki/climate")

library(climate) 

# Localizar estações meterológicas mais próximas dos pontos de interesse
nearest_stations_ogimet(
        # País
        country = "Brazil",
        date = Sys.Date(),
        add_map = TRUE, 
        # Longitude, Latitude do ponto de interesse
        point = c(-48.48, -27.6),
        # Número de Estações que deseja localizar
        no_of_stations = 10
)

library(sf) # operações geo

library(geobr) # download da base dos municípios do IBGE 

library(dplyr)

# Encontrar Longitude (x) e Latitude (y) dos municípios brasileiros.

# Objeto Simple feature (sf) contendo polígonos dos muncípios
mun <- geobr::read_municipality(simplified = F) 

class(mun)

sf::sf_use_s2(FALSE) # Disonsiderar esfericidade do shape, os centróides não são "exatos"

mun.centroides <- sf::st_centroid(mun)  %>%
        # Extrair longitude e latitude da geometria
        mutate(lon = sf::st_coordinates(.)[,1],
               lat = sf::st_coordinates(.)[,2]) %>%
        
        select(name_muni, lon, lat) %>%
        # Remover geometria, manter como data.frame
        sf::st_drop_geometry()



# Função utilizando lon x lat dos municípios 

consulta.mun <- function(mun, n){
        
        df <- mun.centroides %>%
                filter(name_muni == {mun})
        
        lon <- as.numeric(df[,"lon"])
        lat <- as.numeric(df[,"lat"])
        
        # Run function
        nearest_stations_ogimet(
                # País
                country = "Brazil",
                date = Sys.Date(),
                add_map = F, 
                # Longitude, Latitude do ponto de interesse
                point = c(lon, lat),
                # Número de Estações que deseja localizar
                no_of_stations = n
        )  
        
        
}

df <- consulta.mun(mun = "Rio De Janeiro", n = 10)

# Dados
example <- meteo_ogimet(interval = 'hourly',
                        station = df[1,1])
