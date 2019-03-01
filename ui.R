library(shiny)

shinyUI(fluidPage(
  includeCSS("main.css"),
  
  titlePanel("Twitter Data"),
  hr(),
  sidebarLayout(position = "right",
    sidebarPanel("Sidebar..."),
    
    mainPanel(
      div(class="phone_outside",
        div(class="notch_container",
          div(class="notch",
            div(class="speaker"),
            div(class="camera")
          )
        ),
        div(class="phone_screen",
            div(class="chat",
                textOutput("count")
            ),
            
            div(class="textbox",
                  textInput("mainInput", "", "", width="83%", placeholder="Message"),
                  div(class="sendButton")
            ),
            div(class="keyboard")
        )
      )
    )
  )
))
