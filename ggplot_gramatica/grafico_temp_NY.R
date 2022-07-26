airquality <- datasets::airquality

ggplot(#Fonte dos Dados
        data = airquality,
        # Disposição das variáveis de interesse
        mapping = aes(x = Day,
                      y = Temp)) +
        # Seleção de geometria (de Colunas)
        geom_col(# Seleção de variáveis
                mapping = aes(fill = Wind)) +
        #  Escalas
        #  Eixo X
        scale_x_continuous(breaks = 1:31) +
        #  Eixo Y
        scale_y_continuous(breaks = seq(0,500, by = 20))+
        #  Cores
        scale_fill_gradient(low = "white", high = "black")+
        # Sistema de coordenadas
        coord_cartesian() +
        # Facetas
        facet_wrap(~Month, ncol = 1)+
        # Rótulos
        labs(x = "Dias", 
             y ="Temperatura (F)",
             fill = "Velocidade do vento (mph)") +
        
        # Título do gráfico
        ggtitle("Variação diária da temperatura e vento em NY")+
        # Tema de fundo
        theme_bw() +
        #Alterar detalhes
        theme(axis.title = element_text(size = 20),
              axis.text = element_text(size = 12),
              strip.text = element_text(size = 20),
              legend.position = "top",
              legend.title = element_text(size= 20),
              plot.title = element_text(hjust = 0.5, size = 30))
