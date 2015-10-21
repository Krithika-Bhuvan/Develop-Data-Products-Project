library(UsingR) 
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
library(ggplot2)
library(rCharts)
library(dplyr)
predictors2 <- predictors[,1:128]
predictors2 <- predictors2[, -predictors2$age]
adData = data.frame(diagnosis,predictors2)


shinyUI(pageWithSidebar(
    
    headerPanel('Explore relation between two genes in an Alzheimers Dataset'),
    sidebarPanel(
        selectInput('xcol', 'X Variable (Gene A)', names(predictors2)), 
        selectInput('ycol', 'Y Variable (Gene B)', names(predictors2),
                    selected=names(predictors2)[[2]]),
        submitButton('Submit')
    ),
    mainPanel(
        h4('Description'), 
        p('We explore the Alzheimers data (from the AppliedPredictiveModeling package) to compare expression of various genes. In this shiny app, users can select two genes of interest and perform a Pearson correlation test between. You can also see a bar plot that shows median expression of the two genes in the case (those patients that are Impaired) and control groups'),
        p('I chose not to do a correlation matrix plot because:'), 
        p('* it can become too messy or intricate with too much information and'), 
        p('* there would be no input from the user needed, and not satisfy the project requirement'),
        h4('The two genes you entered are:'), 
        verbatimTextOutput('xValue'),
        h4('and '),
        verbatimTextOutput('yValue'),
        h4('Correlation plot between the two genes'),
        plotOutput('plot1'),
        h4('Pearson Correlation test result:'), 
        verbatimTextOutput("corr1"),
        h5('The p-value of the correlation test indicates the result is:'),
        verbatimTextOutput("corr2"),
        h4('Bar plot that shows median expression of the two genes in the case (Impaired patients) and Control groups'),
        showOutput("barGraph", "nvd3"),
        p('You can see that in some cases, the median expression of a gene is positive in one group, but negative in another group. In other cases, the gene is in same direction in both groups, but there is a stark difference in their median gene expression values. Biologists look for such genes since they could provide more information about the biology behind why some patients become Impaired.')
    )
))

