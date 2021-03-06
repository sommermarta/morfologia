rysuj_wybrany_wskaznik <- function(wybrany_wskaznik, 
                                   morfologia_wyniki, 
                                   morfologia_normy,
                                   morfologia_wydarzenia){
    
    stopifnot(all(colnames(morfologia_normy) %in% c("wskaznik", "jednostka", "norma_dol", "norma_gora")))
    stopifnot("wskaznik" %in% colnames(morfologia_wyniki))
    stopifnot(wybrany_wskaznik %in% morfologia_normy$wskaznik)
    stopifnot(wybrany_wskaznik %in% morfologia_wyniki$wskaznik)
    
    wybrany_wskaznik_morfologia_normy <- morfologia_normy %>% 
        filter(wskaznik == wybrany_wskaznik) %>% 
        "["(1, 2:4)
    
    wybrany_wskaznik_morfologia_wyniki <- morfologia_wyniki %>% 
        filter(wskaznik == wybrany_wskaznik) %>% 
        pivot_longer(-wskaznik) %>% 
        select(-wskaznik)
    colnames(wybrany_wskaznik_morfologia_wyniki) <- c("data", "wartosc")
    wybrany_wskaznik_morfologia_wyniki$data <-  as.Date(wybrany_wskaznik_morfologia_wyniki$data)
    wybrany_wskaznik_morfologia_wyniki$hover <- paste0(wybrany_wskaznik_morfologia_wyniki$data, "\n", round(wybrany_wskaznik_morfologia_wyniki$wartosc, 2), " [", wybrany_wskaznik_morfologia_normy$jednostka, "]")
    
    wyk <- plot_ly(wybrany_wskaznik_morfologia_wyniki,
                   x = ~data,
                   y = ~wartosc,
                   type = "scatter",
                   mode = "lines+markers",
                   name = "Wyniki",
                   line = list(color = "blue"),
                   text = ~hover,
                   hoverinfo = "text")  -> wyk
    
    if(nrow(morfologia_wydarzenia) > 0){
        
        for(i in 1:nrow(morfologia_wydarzenia)){
            
            if(morfologia_wydarzenia$od[i] == morfologia_wydarzenia$do[i] || is.na(morfologia_wydarzenia$do[i])){
                
                wyk <- wyk %>% 
                    add_segments(x = as.Date(morfologia_wydarzenia$od[i]),
                                 xend = as.Date(morfologia_wydarzenia$od[i]),
                                 y = 0,
                                 yend = 1.1 * max(wybrany_wskaznik_morfologia_wyniki$wartosc, wybrany_wskaznik_morfologia_normy$norma_gora, na.rm = TRUE),
                                 line = list(dash = "dash", color = "#C0C0C0"),
                                 showlegend = FALSE) %>% 
                    add_annotations(x = as.Date(morfologia_wydarzenia$od[i]),
                                    y = 0,
                                    text = morfologia_wydarzenia$co[i],
                                    textangle = 270,
                                    xanchor = "left",
                                    color = "#C0C0C0")
                
            } else {
                
                wyk <- wyk %>% 
                    add_segments(x = as.Date(morfologia_wydarzenia$od[i]),
                                 xend = as.Date(morfologia_wydarzenia$od[i]),
                                 y = 0,
                                 yend = 1.1 * max(wybrany_wskaznik_morfologia_wyniki$wartosc, wybrany_wskaznik_morfologia_normy$norma_gora, na.rm = TRUE),
                                 line = list(dash = "dash", color = "#C0C0C0"),
                                 showlegend = FALSE) %>% 
                    add_annotations(x = as.Date(morfologia_wydarzenia$od[i]),
                                    y = 0,
                                    text = paste0(morfologia_wydarzenia$co[i], " START"),
                                    textangle = 270,
                                    xanchor = "left",
                                    color = "#C0C0C0")
                
                if(!is.na(morfologia_wydarzenia$do[i])){
                    
                    wyk <- wyk %>% 
                        add_segments(x = as.Date(morfologia_wydarzenia$do[i]),
                                     xend = as.Date(morfologia_wydarzenia$do[i]),
                                     y = 0,
                                     yend = 1.1 * max(wybrany_wskaznik_morfologia_wyniki$wartosc, wybrany_wskaznik_morfologia_normy$norma_gora, na.rm = TRUE),
                                     line = list(dash = "dash", color = "#C0C0C0"),
                                     showlegend = FALSE) %>% 
                        add_annotations(x = as.Date(morfologia_wydarzenia$do[i]),
                                        y = 0,
                                        text = paste0(morfologia_wydarzenia$co[i], " END"),
                                        textangle = 270,
                                        color = "#C0C0C0",
                                        xanchor = "left")
                    
                }
                
            }
            
        }
        
    }
    
    if(!is.na(wybrany_wskaznik_morfologia_normy$norma_dol)){
        
        wyk %>% 
            add_trace(y = wybrany_wskaznik_morfologia_normy$norma_dol, 
                      mode = "lines",
                      name = "Norma dolna",
                      line = list(color = "red", dash = "dash"),
                      hoverinfo = "none") -> wyk
        
    }
    
    if(!is.na(wybrany_wskaznik_morfologia_normy$norma_gora)){
        
        wyk %>% 
            add_trace(y = wybrany_wskaznik_morfologia_normy$norma_gora, 
                      mode = "lines",
                      name = "Norma górna",
                      line = list(color = "red", dash = "dash"),
                      hoverinfo = "none") -> wyk
        
    }
    
    wyk %>% 
        layout(yaxis = list(title = paste0(wybrany_wskaznik, "[",  wybrany_wskaznik_morfologia_normy$jednostka, "]"),
                            rangemode = "tozero"),
               xaxis = list(title = ""),
                            #ticktext = as.character(wybrany_wskaznik_morfologia_wyniki$data),
                            #tickvals = as.Date(wybrany_wskaznik_morfologia_wyniki$data)),
               title = stri_trans_toupper(wybrany_wskaznik),
               legend = list(orientation = "h", xanchor = "center", x = 0.5, y = -0.3),
               margin = list(r = 50,
                             l = 50)) %>% 
        config(displayModeBar = FALSE) %>%
        config(showLink = FALSE) -> wyk
    
    wyk
    
}

# rysuj_wybrany_wskaznik("Leukocyty", morfologia_wyniki, morfologia_normy)
# rysuj_wybrany_wskaznik("Hemoglobina", morfologia_wyniki, morfologia_normy)
# rysuj_wybrany_wskaznik("Żelazo", morfologia_wyniki, morfologia_normy)
# rysuj_wybrany_wskaznik("GFR", morfologia_wyniki, morfologia_normy)

