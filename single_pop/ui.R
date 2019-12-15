##############################
# Single population dynamics #
##############################
library(shinythemes) # make things look pretty

# ui.R file for Shiny app
# gaurav kandlikar, gkan@umd.edu
library(dygraphs)

# start defining the page
shinyUI(fluidPage(
  theme = shinytheme("flatly"),

  titlePanel("Modéliser la dynamique d'une population"),
  
  sidebarLayout(
    sidebarPanel(
      tabPanel(title="Single population dynamics",
               helpText(h3("Définir les paramètres de la croissance de la population")),
               
               br(),
               helpText(h4("Type de croissance")),
               radioButtons("Density", label="",
                            choices = c("Indépendante de la densité" = 1,
                                           "Dépendante de la densité" = 2)),
               
               br(),
               helpText(h4("Définir les paramètres du modèle")),
               numericInput("r",label="Taux de croissance par individu (r)",value=.1,min=0,max=2, step = .2),
               numericInput("N",label="Taille de la population initiale (N)",value=10,min=1,max=25, step = 5),

               # If users select "Prey carrying capacity" above, then generate the input option
               htmlOutput("UI1"),
               htmlOutput("UI2"),
               br(),
	       numericInput("iter",label="Nombre de pas de temps de simulation
		 du modèle",value=100,min=2,max=9999, step = 500)
               
            )
    ),
    mainPanel(
      tabsetPanel(
        tabPanel(title = "plots",
                 h4("Dynamique temporelle de la taille de la population"),
                 plotOutput("plot1")
        ),
        
        tabPanel(title = "Tables",
                 h4("This table shows population size at each time step"),
                 tableOutput("table1")
        ),
        
        tabPanel(title = "Interactive plot",
                 h4("Plots!"),
                 dygraphOutput("Dy1")
        )
      )
    )
  )))
