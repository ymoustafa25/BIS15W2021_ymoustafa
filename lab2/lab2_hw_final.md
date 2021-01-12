---
title: "Lab 2 Homework"
author: "Yumna Moustafa"
date: "2021-01-11"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

1. What is a vector in R?

### A vector is a sequence of data, all of the same type (numeric, logical, etc.) ###

2. What is a data matrix in R?  

### A data matrix is data that is organized into rows and colomns, similar to a spreadsheet ###

3. Below are data collected by three scientists (Jill, Steve, Susan in order) measuring temperatures of eight hot springs. Run this code chunk to create the vectors.  

```r
spring_1 <- c(36.25, 35.40, 35.30)
spring_2 <- c(35.15, 35.35, 33.35)
spring_3 <- c(30.70, 29.65, 29.20)
spring_4 <- c(39.70, 40.05, 38.65)
spring_5 <- c(31.85, 31.40, 29.30)
spring_6 <- c(30.20, 30.65, 29.75)
spring_7 <- c(32.90, 32.50, 32.80)
spring_8 <- c(36.80, 36.45, 33.15)
```

4. Build a data matrix that has the springs as rows and the columns as scientists.  


```r
Springsvscientists <- c(spring_1, spring_2, spring_3, spring_4, spring_5, spring_6, spring_7, spring_8)
springmatrix <- matrix(Springsvscientists, nrow= 8, byrow=T)
springmatrix
```

```
##       [,1]  [,2]  [,3]
## [1,] 36.25 35.40 35.30
## [2,] 35.15 35.35 33.35
## [3,] 30.70 29.65 29.20
## [4,] 39.70 40.05 38.65
## [5,] 31.85 31.40 29.30
## [6,] 30.20 30.65 29.75
## [7,] 32.90 32.50 32.80
## [8,] 36.80 36.45 33.15
```


5. The names of the springs are 1.Bluebell Spring, 2.Opal Spring, 3.Riverside Spring, 4.Too Hot Spring, 5.Mystery Spring, 6.Emerald Spring, 7.Black Spring, 8.Pearl Spring. Name the rows and columns in the data matrix. Start by making two new vectors with the names, then use `colnames()` and `rownames()` to name the columns and rows.


```r
springnames <- c("Bluebell_Spring", "Opal_Spring", "Riverside_Spring", "Too_Hot_Spring", "Mystery_Spring", "Emerald_Spring", "Black_Spring", "Pearl_Spring")
scinames <- c("Jill", "Steve", "Susan")
rownames(springmatrix) <- springnames
colnames(springmatrix) <- scinames
springmatrix
```

```
##                   Jill Steve Susan
## Bluebell_Spring  36.25 35.40 35.30
## Opal_Spring      35.15 35.35 33.35
## Riverside_Spring 30.70 29.65 29.20
## Too_Hot_Spring   39.70 40.05 38.65
## Mystery_Spring   31.85 31.40 29.30
## Emerald_Spring   30.20 30.65 29.75
## Black_Spring     32.90 32.50 32.80
## Pearl_Spring     36.80 36.45 33.15
```


6. Calculate the mean temperature of all eight springs.
# Mean of all Spring Temperatures #

```r
All_Means <- rowMeans(springmatrix)
All_Means
```

```
##  Bluebell_Spring      Opal_Spring Riverside_Spring   Too_Hot_Spring 
##         35.65000         34.61667         29.85000         39.46667 
##   Mystery_Spring   Emerald_Spring     Black_Spring     Pearl_Spring 
##         30.85000         30.20000         32.73333         35.46667
```

# BlueBell Spring Mean Temperature #

```r
Bluebell_Spring_vals <- springmatrix[1,]
Mean_Bluebell_Temp <- mean(Bluebell_Spring_vals)
Mean_Bluebell_Temp
```

```
## [1] 35.65
```
# Opal Spring Mean Temperature #

```r
Opal_Spring_vals <- springmatrix[2,]
Mean_Opal_Temp <- mean(Opal_Spring_vals)
Mean_Opal_Temp
```

```
## [1] 34.61667
```
# Riverside Spring Mean Temperature #


```r
Riverside_Spring_vals <- springmatrix[3,]
Mean_Riverside_Temp <- mean(Riverside_Spring_vals)
Mean_Riverside_Temp
```

```
## [1] 29.85
```
# Too Hot Spring Mean Temperature #

```r
TooHot_Spring_vals <- springmatrix[4,]
Mean_TooHot_Temp <- mean(TooHot_Spring_vals)
Mean_TooHot_Temp
```

```
## [1] 39.46667
```
# Mystery Spring Mean Temperature #

```r
Mysteryspring_Spring_vals <- springmatrix[5,]
Mean_Mysteryspring_Temp <- mean(Mysteryspring_Spring_vals)
Mean_Mysteryspring_Temp
```

```
## [1] 30.85
```
# Emerald Spring Mean Temperature #

```r
Emerald_Spring_vals <- springmatrix[6,]
Mean_Emerald_Temp <- mean(Emerald_Spring_vals)
Mean_Emerald_Temp
```

```
## [1] 30.2
```
# Black Spring Mean Temperature #

```r
Black_Spring_vals <- springmatrix[7,]
Mean_BlackSpring_Temp <- mean(Black_Spring_vals)
Mean_BlackSpring_Temp
```

```
## [1] 32.73333
```
# Pearl Spring Mean Temperature #

```r
Pearl_Spring_vals <- springmatrix[8,]
Mean_Pearl_Temp <- mean(Pearl_Spring_vals)
Mean_Pearl_Temp
```

```
## [1] 35.46667
```
7. Add this as a new column in the data matrix.  

```r
MeanSpringTemps <- c(Mean_Bluebell_Temp, Mean_Opal_Temp, Mean_Riverside_Temp, Mean_TooHot_Temp, Mean_Mysteryspring_Temp, Mean_Emerald_Temp, Mean_BlackSpring_Temp, Mean_Pearl_Temp )

springmatrix_wmeantemps <- cbind(springmatrix, MeanSpringTemps)
springmatrix_wmeantemps
```

```
##                   Jill Steve Susan MeanSpringTemps
## Bluebell_Spring  36.25 35.40 35.30        35.65000
## Opal_Spring      35.15 35.35 33.35        34.61667
## Riverside_Spring 30.70 29.65 29.20        29.85000
## Too_Hot_Spring   39.70 40.05 38.65        39.46667
## Mystery_Spring   31.85 31.40 29.30        30.85000
## Emerald_Spring   30.20 30.65 29.75        30.20000
## Black_Spring     32.90 32.50 32.80        32.73333
## Pearl_Spring     36.80 36.45 33.15        35.46667
```


8. Show Susan's value for Opal Spring only.

```r
SusanOpal <- springmatrix_wmeantemps[2,3]
SusanOpal
```

```
## [1] 33.35
```


9. Calculate the mean for Jill's column only.  


```r
Jillcolumns <- springmatrix_wmeantemps[,1]
JillMeans <- mean(Jillcolumns)
JillMeans
```

```
## [1] 34.19375
```


10. Use the data matrix to perform one calculation or operation of your interest.
# Find the mean of all temperature recordings #

```r
AllVals <- c(Bluebell_Spring_vals, Opal_Spring_vals, Riverside_Spring_vals, TooHot_Spring_vals, Mysteryspring_Spring_vals, Emerald_Spring_vals, Black_Spring_vals, Pearl_Spring_vals)
MeanofMeans <- mean(AllVals)
MeanofMeans
```

```
## [1] 33.60417
```


## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.  
