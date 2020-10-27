body <- dashboardBody(
    
    # CSS:
    
    tags$style(type = "text/css", "@font-face { font-family: 'czcionka'; src: url('Lato-Regular.ttf'); } h1, h2, h3, h4, h5, h6, p, span, label, body, label, input, button, select, table {font-family: 'czcionka';}"),
    
    tags$style(type="text/css",
               ".shiny-output-error { visibility: hidden; }",
               ".shiny-output-error:before { visibility: hidden; }"
    ),
    
    tags$script('
                // Bind function to the toggle sidebar button
                $(".sidebar-toggle").on("click",function(){
                $(window).trigger("resize"); // Trigger resize event
                })'
    ),
    
    # UI:
    
    tabItems(
        
        tabItem(
            
            tabName = "morfologia",
            
            fluidRow(column(6,
                            box(status = "danger",
                                width = 12,
                                plotlyOutput("wyk_zelazo"))),
                     column(6,
                            box(status = "danger",
                                width = 12,
                                plotlyOutput("wyk_leukocyty")))),
            
            fluidRow(column(6,
                            box(status = "danger",
                                width = 12,
                                plotlyOutput("wyk_erytrocyty"))),
                     column(6,
                            box(status = "danger",
                                width = 12,
                                plotlyOutput("wyk_hemoglobina")))),
            
            fluidRow(column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_hematokryt"))),
                     column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_mcv")))),
            
            fluidRow(column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_mch"))),
                     column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_mchc")))),
            
            fluidRow(column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_plytki_krwi"))),
                     column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_p_lcr")))),
            
            fluidRow(column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_mpv"))),
                     column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_keratynina")))),
            
            fluidRow(column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_gfr"))),
                     column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_alt")))),
            
            fluidRow(column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_cholesterol"))),
                     column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_triglicerydy")))),
            
            fluidRow(column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_hdl"))),
                     column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_ldl")))),
            
            fluidRow(column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_glukoza"))),
                     column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_tsh3")))),
            
            fluidRow(column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_b12"))),
                     column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_kwas_foliowy")))),
            
            fluidRow(column(6,
                            box(status = "primary",
                                width = 12,
                                plotlyOutput("wyk_rdw_cv"))))
                
        )
    )
)
