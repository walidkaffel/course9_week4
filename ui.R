#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
        titlePanel("mtcars dataset variable dependancies"),
        sidebarLayout(
                sidebarPanel(
                        h4("Variable in the y axis:"),
                        selectInput("variable", "",
                                    c("Cylinders" = "cyl",
                                      "Displacement" = "disp",
                                      "Gross horsepower" = "hp",
                                      "Rear axle ratio" = "drat",
                                      "Weight (1000 lbs)" = "wt",
                                      "1/4 mile time" = "qsec",
                                      "Engine (0 = V-shaped, 1 = straight)" = "vs",
                                      "Transmission (0 = automatic, 1 = manual)" = "am",
                                      "Number of forward gears" = "gear",
                                      "Number of carburetors" = "carb")),
                        h4("Variable to be included in the model:"),
                        checkboxInput("scyl", "Cylinders", value = TRUE),
                        checkboxInput("sdisp", "Displacement", value = TRUE),
                        checkboxInput("shp", "Gross horsepower", value = TRUE),
                        checkboxInput("sdrat", "Rear axle ratio", value = TRUE),
                        checkboxInput("swt", "Weight (1000 lbs)", value = TRUE),
                        checkboxInput("sqsec", "1/4 mile time", value = TRUE),
                        checkboxInput("svs", "Engine (0 = V-shaped, 1 = straight)", value = TRUE),
                        checkboxInput("sam", "Transmission (0 = automatic, 1 = manual)", value = TRUE),
                        checkboxInput("sgear", "Number of forward gears", value = TRUE),
                        checkboxInput("scarb", "Number of carburetors", value = TRUE)

                ),
                mainPanel(
                        h4("This application offers the possibility to test how the 
                                inclusion or the exclusion of predictors in a regression model
                                can impact regression coefficients."),
                        h5("First, you have to select the main variable to be shown in the
                                x axis and so to evaluate its coefficient."),
                        h5("Then, you can select predictors and see how each one may
                                impact the main variable coefficient."),
                        plotOutput("plot1"),
                        h3("Coefficient"),
                        textOutput("slopeOut"),
                        h3("Intercept"),
                        textOutput("intOut")
                )
        )
))
