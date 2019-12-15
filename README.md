<!-- README.md is generated from README.Rmd. Please edit that file -->

# But

Ce dépot a pour but de servir de support à l’enseignement à la
modélisation au CESCO. Il a été notamment utilisé pour initier des
stagiaires de 3ème à la modélisation de la dynamique des populations. Il
contient des applications shiny permettant de simuler des modèles tout
en modifiant les valeurs de paramètres à la souris.

# Installation

Ce dépot peut être installé de différentes façon

1.  Cloner le dépot sur son ordinateur

Dans le terminal de Rstudio ou un terminal:

``` bash
git clone cesco-lab/model_apps . 
```

2.  Le télécharger

# Utilisation

Ces applications nécessitent d’avoir installé le package `shiny` dans R.
Vous pouvez lancer une application en lancant la commande pointant vers
le dossier dans lequel est défini le modèle.

``` r
library(shiny)
# Lancer l'application proie/prédateur de Lotka Volterra
runApp("~/my/path/to/the/repo/predprey")
```

Cette commande va déployer l’application localement dans Rstudio ou un
navigateur web si vous utilisez un autre IDE.

# Crédits

Ces applications ont été développé par
[gauravsk](http://github.com/gauravsk).

Les modèles d’origine (en anglais) sont disponibles ici:

  - The single population app is hosted online at
    <http://gauravsk.shinyapps.io/single_pop>
  - The lotka-voterra predator prey app is hosted online at
    <http://gauravsk.shinyapps.io/lvpp>
  - The lotka-volterra competition app is hosted online at
    <http://gauravsk.shinyapps.io/lotka>
