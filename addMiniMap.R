library(leaflet)

leaflet() %>% 
        addTiles() %>%
        setView(-46.6388, -23.5472, zoom = 12) %>% 
        addMiniMap(
                position = "bottomleft",
                toggleDisplay = FALSE,
                width = 50,
                height = 50,
                zoomLevelFixed = 8,
                autoToggleDisplay = TRUE,
                minimized = F
        )
