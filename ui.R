library("shinydashboard")
library("shiny")

source("./scripts/ui_header.R", encoding = "UTF-8")
source("./scripts/ui_sidebar.R", encoding = "UTF-8")
source("./scripts/ui_body.R", encoding = "UTF-8")

dashboardPage(
    
    skin = "red",
    
    header,
    sidebar,
    body
    
)
