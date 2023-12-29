library(shiny)
library(tidyverse)
library(dplyr)
library(janitor)

md_demo <- read_csv("Maryland_Counties_Socioeconomic_Characteristics__2016-2020_from_ACS__20231228.csv")
life_exp <- read_csv("SHIP_Life_Expectancy_2010-2020_20231228.csv")
md_demo_life <- full_join(life_exp, md_demo)
md_demo_life <- clean_names(md_demo_life)
md_demo_life <- md_demo_life %>% 
  mutate(above_below_state_exp = ifelse(life_expectancy < 78.6, 0, 1)) %>% 
  mutate(percent_less_than_9th_grade = less_than_9th_grade / total_population) %>% 
  mutate(percent_white = white_alone / total_population) %>% 
  mutate(percent_male = male / total_population) 

life_log <- md_demo_life %>% 
  select(median_household_income, percent_less_than_9th_grade, percent_white, percent_male)

display_names <- c(
  "Median Household Income" = "median_household_income",
  "Percent Population with Less than 9th Grade Education" = "percent_less_than_9th_grade",
  "Percent White Population" = "percent_white",
  "Percent Male Population" = "percent_male"
)

ui <- fluidPage(
  titlePanel("Interactive Scatterplot"),
  sidebarLayout(
    sidebarPanel(
      selectInput("x_var", "X-axis Variable", choices = names(display_names)),
      width = 3
    ),
    mainPanel(
      plotOutput("scatterplot")
    )
  )
)


server <- function(input, output, session) {
  observe({
    updateSelectInput(session, "x_var", label = "X-axis Variable", choices = names(display_names), selected = input$x_var)
  })
  
  output$scatterplot <- renderPlot({
    ggplot(md_demo_life, aes_string(x = display_names[input$x_var], y = "above_below_state_exp")) +
      geom_point() +
      stat_smooth(method="glm", color="red", se=FALSE, 
                  method.args = list(family=binomial)) +
      labs(x = input$x_var,
           y = "Probability of Above State Average Life Expectancy", 
           title = "Logistic Regression") +
      theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold"), 
            axis.title = element_text(hjust = 0.5, size = 13))
  })
}

shinyApp(ui, server)
