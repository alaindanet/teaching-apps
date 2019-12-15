################################
# Lotka Volterra Predator-Prey #
################################
# ui.R file for Shiny app
# gaurav kandlikar, gkan@umd.edu

# start defining the page
shinyUI(fluidPage(
  
  titlePanel("Modéliser des dynamiques proies-prédateurs de type Lotka-Volterra"),
  
  sidebarLayout(
    sidebarPanel(
        tabPanel(title="Lotka Volterra Predator-Prey",
                 helpText(h3("Définir les valeurs de paramètre du modèle")),
                 
                 helpText(h4("Définir les tailles de population initiales")),
                 numericInput( "N",label=p(span("Proie (N)", style = "color:black")),value=25,min=1,max=50, step = 5),
                 numericInput("P",label=p(span("Prédateur (P)", style = "color:red")),value=10,min=1,max=25, step = 5),
                 br(),
                 helpText(h4("Définir la capacité biotique de la proie")),
                 radioButtons("Prey_K", label="",
                              choices = list("Pas de capacité biotique pour la proie" = 1,
                                             "Capacité biotique de la proie" = 2),
                              selected = 1),
                 # If users select "Prey carrying capacity" above, then generate the input option
                 htmlOutput("UIpreyk"),


                 br(),
                 helpText(h4("Définir les paramètres démographiques")),
                 sliderInput("r", 
                             label = "Taux de croissance intrinsèque de la proie (r)",
                             min = 0.01, max = 1.99, value = 1.0, step = .1),
                 sliderInput("a", 
                             label = "Efficacité de la prédation (a)",
                             min = .0001, max = .5, value=.1, step = .1),
                 sliderInput("d", 
                             label = "Taux de mortalité du prédateur (d)",
                             min = 0.01, max = 1, value=0.6, step = .1),
                 sliderInput("b", 
                             label = "Efficacité de conversion (b)",
                             min = 0.01, max = 1, value=.5, step = .1),
                 
		 numericInput("time",label="Nombre de pas de temps de simulation
		   du modèle",value = 100, min=1, step = 100),
                 actionButton("goButton", "Go!"),
                 downloadButton("downloadPlot", "Download Plot!")
        )
      ),
    mainPanel(
      tabsetPanel(
        tabPanel(title = "Equations",
	  h4("Présentation du modèle"),
	  p("Le modèle Proie-Prédateur de Lotka-Volterra décrit les
	    dynamiques d'une population de proie et de prédateur. Ce
	    modèle basique fait l'hypothèse que la population de proie
	    croit exponentiellement (cad sans capacité biotique) en
	    l'absence de prédateur; en d'autres mots, la population de
	    prédateur est le seul controle sur la population de proie. Le
	    taux de croissance de la population de prédateur est
	    dépendant de la disponibilité des proie, de l'efficacité de
	    conversion d'une proie en prédateur (c'est à dire combien de
	    proies sont nécessaires pour ajouter un prédateur), et un
	  taux de mortalité intrinsèque."),

	  h4("Équations du modèle"),
	  p(withMathJax("$$ \\frac{dN}{dt} = rN - aNP $$")),
	  p(withMathJax("$$ \\frac{dP}{dt} = baNP - dP $$")),
	  p(withMathJax("Où \\(r\\) est le taux de croissance par individu de la
	      proie, \\(a\\) est l'efficacité de convertion des proies, \\(b\\)
	      est l'efficacité de la prédation, et \\(d\\) est le taux de
	      mortalité des prédateurs.")), br(),
	  p("Les isoclines d'équilibres sont calculés avec ces équations:"),
	  p(withMathJax("$$ \\frac{dN}{dt} = 0 \\text{  quand  } P = \\frac{r}{a} $$")),
	  p(withMathJax("$$ \\frac{dP}{dt} = 0 \\text{  quand  } N = \\frac{d}{ab}$$")),
	  br(),
	  br(),
	  h4("Les modifications du modèle:"),
	  p("Une capacité biotique peuvent être introduite dans les proies:"),
	  p(withMathJax("$$ \\frac{dN}{dt} = rN - aNP - \\left(1-\\frac{N}{K} \\right) $$")),
	  p("Ça change l'isocline d'équilibre pour les proies:"),
	  p(withMathJax("$$ \\frac{dN}{dt}=0 \\text{  quand  } P = \\frac{r}{a}-\\frac{rP}{aK} $$"))
        ),
        
        tabPanel(title = "Plots",
                 h4("Graphiques"),
                 fluidRow(
                   column(width = 6,
                          plotOutput("plot1", height = 400)),
                   column(width = 6,
                          plotOutput("plot2", height = 400, brush = brushOpts(
                            id = "plot2_brush",
                            resetOnNew = TRUE
                          )))),
                 fluidRow(plotOutput("plot3"))
                 
        ),
        
        
        tabPanel(title = "Tables",
                 h4("Ce tableau montre les tailles de population à chaque pas de temps"),
                 tableOutput("table1"))
    )
  )
)))
