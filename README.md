# Developing data products 

Note This shiny app was developed as part of the Developing data products project.

## Summary
We explore the Alzheimers data (from the AppliedPredictiveModeling package) to compare expression of various genes. 
In this shiny app, users can select two genes of interest and perform a Pearson correlation test between. You can also see a bar plot that shows median expression of the two genes in the case (those patients that are Impaired) and control groups.

## Background
Alzheimer's disease is a progressive disease that destroys memory and other importnat mental functions. It is currently ranked as the sixth leading cause of death in the United states, and has recently grown to the third leading cause of death behind heart disease and cancer. More than 3 million people in the US are diagnosed with this disase evert year. It mostly affects people 60 years and older. No cure exists, and medications may temporarily improve symptoms. Researchers are looking for not only new ways to treat Alzheimer's, but also better understand the disease mechanism. This would help in improving early detection.

## About the dataset
The dataset used in this project is the Alzheimers data from the AppliedPredictiveModeling package in R. It consisted of 333 patients (rows) and 130 predictors as columns. 127 of these predictors are genes and the values in each cell is the expression of a gene (in the cerebrospinal fluid (CSF)) for a particular patient.

## Exploratory analysis
Shown in the image below is a heatmap of the correlation matrix (it is symmetric) of all the predictors (genes) in this dataset. This shows a quick overview of which genes are highly correlated features.

![image](https://github.com/Krithika-Bhuvan/Develop-Data-Products-Shiny/assets/1800604/dab5172e-833b-4082-af66-8b07d0a5d09c)

## About the shiny app
The shiny app allows exploration of the Alzheimers data to compare expression of any two genes using correlation plots and correlation test.
The app also provides a bar plot that shows median expression of two genes of interest in the Control and Impaired groups.

**Why is this important ?** 
A significant difference in the expression of a gene between the two groups could give a scientist more insights into biology and mechanisms behind development of Alzheimer's disease.

## Relevant links
* Link to shiny app: https://krithikab.shinyapps.io/Rproj_DevDataProd1
* Link to Rstudio presentation in RPubs: http://rpubs.com/krithika/ddppres

## References
* Wikipedia: https://en.wikipedia.org/wiki/Alzheimer%27s_disease
* Alzheimer's Association: http://www.alz.org/

