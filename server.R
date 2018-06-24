shinyServer(function(input, output, session){
    
    autoInvalidate <- reactiveTimer(60*60*1000)   # w milisekundach
    
    morfologia_normy <- reactive({
        
        autoInvalidate()
        
        morfologia_normy <- fread("./data/morfologia_normy.txt", encoding = "UTF-8")
        
    })
    
    morfologia_wyniki <- reactive({
        
        autoInvalidate()
        
        morfologia_wyniki <- fread("./data/morfologia_wyniki.txt", encoding = "UTF-8")
        
    })
    
    output$wyk_leukocyty <- renderPlotly({ rysuj_wybrany_wskaznik("Leukocyty", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_erytrocyty <- renderPlotly({ rysuj_wybrany_wskaznik("Erytrocyty", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_hemoglobina <- renderPlotly({ rysuj_wybrany_wskaznik("Hemoglobina", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_hematokryt <- renderPlotly({ rysuj_wybrany_wskaznik("Hematokryt", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_mcv <- renderPlotly({ rysuj_wybrany_wskaznik("MCV", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_mch <- renderPlotly({ rysuj_wybrany_wskaznik("MCH", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_mchc <- renderPlotly({ rysuj_wybrany_wskaznik("MCHC", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_plytki_krwi <- renderPlotly({ rysuj_wybrany_wskaznik("Płytki krwi", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_p_lcr <- renderPlotly({ rysuj_wybrany_wskaznik("P_LCR", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_rdw_cv <- renderPlotly({ rysuj_wybrany_wskaznik("RDW-CV", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_mpv <- renderPlotly({ rysuj_wybrany_wskaznik("MPV", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_keratynina <- renderPlotly({ rysuj_wybrany_wskaznik("Kreatynina", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_gfr <- renderPlotly({ rysuj_wybrany_wskaznik("GFR", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_alt <- renderPlotly({ rysuj_wybrany_wskaznik("ALT", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_zelazo <- renderPlotly({ rysuj_wybrany_wskaznik("Żelazo", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_cholesterol <- renderPlotly({ rysuj_wybrany_wskaznik("Cholesterol", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_hdl <- renderPlotly({ rysuj_wybrany_wskaznik("HDL", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_ldl <- renderPlotly({ rysuj_wybrany_wskaznik("LDL", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_triglicerydy <- renderPlotly({ rysuj_wybrany_wskaznik("Triglicerydy", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_glukoza <- renderPlotly({ rysuj_wybrany_wskaznik("Glukoza", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_tsh3 <- renderPlotly({ rysuj_wybrany_wskaznik("TSH3", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_b12 <- renderPlotly({ rysuj_wybrany_wskaznik("B12", morfologia_wyniki(), morfologia_normy()) })
    output$wyk_kwas_foliowy <- renderPlotly({ rysuj_wybrany_wskaznik("Kwas foliowy", morfologia_wyniki(), morfologia_normy()) })
    
})
