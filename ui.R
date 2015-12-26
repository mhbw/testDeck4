library(shiny)
library(shinythemes)

fluidPage(theme=shinytheme("cosmo"))

shinyUI(fluidPage(
     theme=shinytheme("cosmo"),
     pageWithSidebar(
     titlePanel("Poker Income"),
     sidebarPanel(
          fileInput('file1', 'Import Your Records', 
                    accept=c('.csv', 'text/csv', '.txt')),
               tags$hr(),
               checkboxInput('header', 'Header', TRUE),
               radioButtons('sep', 'Separator',
                            c(Comma=',',
                              Semicolon=';',
                              Tab='\t'),
                            ','),
               radioButtons('quote', 'Quote',
                            c(None='',
                              'Double Quote'='"',
                              'Single Quote'="'"),
                            '"'),
          textInput(inputId='text1', label = 'Input Text1'),
          textInput(inputId='text2', label = 'Input Text2'),
          actionButton('goButton', 'Show Winnings'),
          h4('Choose by year or lifetime'),
          h5('Locations are variable'),
          numericInput('glucose', 'Glucose mg/dl', 90 , min = 50, max = 200, step = 5),
          submitButton('submit'),
          numericInput('loc', 'numeric input, labeled annual', 0, min = 0, max = 10, step=1),
          selectInput('yearSelect', 'Select Year or Cumulative',
                             c('Cumulative'  = 'Cumulative',
                               '2014' = '2014',
                               '2013' = '2013',
                               '2012' = '2012',
                               "2011" = "2011"
                             )
                             ),
          dateInput('date', 'Date:'),
          sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05,)
           ), 
      mainPanel(
          h3('Value Over Big Blind Per Hour'),
          p('Output text1'),
          textOutput('text1'),
          p('Output text2'),
          textOutput('text2'),
          p('Output text3'),
          textOutput('text3'),
          ##h5('location select'),
          ##verbatimTextOutput("oid1"),
          h5('year select'),
          verbatimTextOutput("oid2"),
          h5('date select'),
          verbatimTextOutput("oid3"),
          h3('Results of prediction'),
          h4('you entered'),
          verbatimTextOutput("inputValue"),
          h4('which resulted in a prediction of:'),
          verbatimTextOutput('prediction'),
          plotOutput('newHist')
          )
)))