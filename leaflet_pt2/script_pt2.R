
# Instalar geobr
devtools::install_github("ipeaGIT/geobr", subdir = "r-package")

# Poligonos com concentrações urbanas
urban <- geobr::read_urban_concentrations()

colnames(urban)

urban <- urban %>%
        mutate(cat_pop = cut(pop_total_2010,
                             breaks = c(0,50000,200000,500000,Inf),
                             labels = c("< 50K",
                                        "50K A 200K",
                                        "200K A 500K",
                                        "> 500K")))

# Leaflet
# Renderizar um Basemap

# Map1

labels_popup <- paste0("População total do aglomerado ",
                       urban$name_urban_concentration, ": ",
                       urban$pop_total_2010,
                       )


library(leaflet)

leaflet() %>%
        addProviderTiles(providers$OpenStreetMap) %>%
        # Adicionar poligonos
        addPolygons(data = urban, 
                    color = "red",
                    popup = labels_popup,
                    weight = 1,
                    group = urban$cat_pop
                    ) %>%
        # Adicionar controle de camada
        addLayersControl(overlayGroups  = urban$cat_pop,
                         position = "topleft")
        