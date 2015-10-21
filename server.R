library(UsingR) 
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
library(ggplot2)
#devtools::install_github('ramnathv/rCharts')
library(rCharts)
library(dplyr)
predictors2 <- predictors[,1:128]
predictors2 <- predictors2[, -predictors2$age]
adData = data.frame(diagnosis,predictors2) 

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

shinyServer(
    
    function(input, output, session) {
        
        # get gene expdata by using ids. It is in a reactive function because its value keeps changing
        x <- reactive({
            as.numeric(predictors2[, input$xcol])
        })
        y <- reactive({
            as.numeric(predictors2[, input$ycol])
        })
        
        #plot
        output$plot1 <- renderPlot({
            
            qplot(x = x(), y = y(), xlab=input$xcol, ylab = input$ycol) + geom_smooth(method = "lm") + geom_point(aes(colour=diagnosis))
            #ggplot(data = predictors, aes(x=x(), y=y(), colour=diagnosis)) + geom_smooth(method = "lm") + geom_point()
            
            
        })
        #corr
        output$corr1 <- renderPrint(
            cor.test(x(), y())
        ) 
        
        ## p value test -- enter significant or not 
        output$corr2 <- reactive({
            testResult <- cor.test(x(), y())
            if (as.numeric(testResult$p.value) <= 0.05) {
                return("Significant")
            } else {
                return("Not significant" )
            }
        })
        
        output$xValue <- renderText({input$xcol})
        output$yValue <- renderText({input$ycol})
        
        ## gene expressed based bar plots for the two outcome groups -- do this in Rcharts --interactive viz
        
        output$barGraph <- renderChart2({   
            
            group1 <- dplyr::filter(adData, diagnosis=="Control")
            group2 <- dplyr::filter(adData, diagnosis=="Impaired")
            
            group1GeneAMedian <- median(as.numeric(group1[, input$xcol]))
            group1GeneBMedian <- median(as.numeric(group1[, input$ycol]))
            group2GeneAMedian <- median(as.numeric(group2[, input$xcol]))
            group2GeneBMedian <- median(as.numeric(group2[, input$ycol]))
            
            #creating a new clean matrix with median values
            medianGroup1 <- matrix(c("Control",  "Impaired", input$xcol, input$xcol , group1GeneAMedian,group1GeneBMedian),nrow = 2, ncol = 3)
            
            medianGroup2 <- matrix(c("Control",  "Impaired",input$ycol, input$ycol ,group2GeneAMedian,group2GeneBMedian),nrow = 2, ncol = 3)
            
            
            medianData <- as.data.frame(rbind(medianGroup1,medianGroup2),stringsAsFactors = FALSE)
            medianData$V1 <- as.factor(medianData$V1)
            medianData$V2 <- as.factor(medianData$V2)
            medianData$V3 <- as.numeric(medianData$V3)
            print(medianData)
            
            p1 <- nPlot(x = "V1", y="V3", color="V2", group = "V2", data = medianData, type="multiBarChart")
            p1$addParams(height = 300, dom = 'chart1')
           
            p1$yAxis( axisLabel = "Median gene expression",width = 40 )
            return(p1)
            
       # })
        })
        
    })

