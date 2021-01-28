---
title: "Midterm 1"
author: "Yumna Moustafa"
date: "2021-01-27"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your code should be organized, clean, and run free from errors. Be sure to **add your name** to the author header above. You may use any resources to answer these questions (including each other), but you may not post questions to Open Stacks or external help sites. There are 12 total questions.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

This exam is due by **12:00p on Thursday, January 28**.  

## Load the tidyverse
If you plan to use any other libraries to complete this assignment then you should load them here.

```r
library(tidyverse)
library(janitor)
library(skimr)
```

## Questions
**1. (2 points) Briefly explain how R, RStudio, and GitHub work together to make work flows in data science transparent and repeatable. What is the advantage of using RMarkdown in this context?**  

#### R is the actual coding language that is being used to perform all actions, and R Studios hosts R and provides a more user-friendly interface that makes it easier to use R, as well as makes creating and viewing plots possible. Github allows users to upload, save, and share their codes on their site, which makes it easier to see past revisions on works, as well as collaborating. RMarkdowns are useful in presenting the code and all plots in a neat way that makes it easier for others to navigate, and makes it possible to view the code and its outputs on github itself, without downloading it. ####

**2. (2 points) What are the three types of `data structures` that we have discussed? Why are we using data frames for BIS 15L?**

#### Data matrices, data frames, and vectors. Data frames are easy to navigate and allow for more operations (from tidyverse especially) to be performed on them, that cannot otherwise be done with a vector or matrix.  ####

In the midterm 1 folder there is a second folder called `data`. Inside the `data` folder, there is a .csv file called `ElephantsMF`. These data are from Phyllis Lee, Stirling University, and are related to Lee, P., et al. (2013), "Enduring consequences of early experiences: 40-year effects on survival and success among African elephants (Loxodonta africana)," Biology Letters, 9: 20130011. [kaggle](https://www.kaggle.com/mostafaelseidy/elephantsmf).  

**3. (2 points) Please load these data as a new object called `elephants`. Use the function(s) of your choice to get an idea of the structure of the data. Be sure to show the class of each variable.**


```r
elephants <- readr::read_csv("data/ElephantsMF.csv")
```

```
## Parsed with column specification:
## cols(
##   Age = col_double(),
##   Height = col_double(),
##   Sex = col_character()
## )
```

```r
skim(elephants)
```


Table: Data summary

|                         |          |
|:------------------------|:---------|
|Name                     |elephants |
|Number of rows           |288       |
|Number of columns        |3         |
|_______________________  |          |
|Column type frequency:   |          |
|character                |1         |
|numeric                  |2         |
|________________________ |          |
|Group variables          |None      |


**Variable type: character**

|skim_variable | n_missing| complete_rate| min| max| empty| n_unique| whitespace|
|:-------------|---------:|-------------:|---:|---:|-----:|--------:|----------:|
|Sex           |         0|             1|   1|   1|     0|        2|          0|


**Variable type: numeric**

|skim_variable | n_missing| complete_rate|   mean|   sd|    p0|    p25|    p50|    p75|   p100|hist                                     |
|:-------------|---------:|-------------:|------:|----:|-----:|------:|------:|------:|------:|:----------------------------------------|
|Age           |         0|             1|  10.97|  8.4|  0.01|   4.58|   9.46|  16.50|  32.17|▆▇▂▂▂ |
|Height        |         0|             1| 187.68| 50.6| 75.46| 160.75| 200.00| 221.09| 304.06|▃▃▇▇▁ |

```r
glimpse(elephants)
```

```
## Rows: 288
## Columns: 3
## $ Age    <dbl> 1.40, 17.50, 12.75, 11.17, 12.67, 12.67, 12.25, 12.17, 28.17...
## $ Height <dbl> 120.00, 227.00, 235.00, 210.00, 220.00, 189.00, 225.00, 204....
## $ Sex    <chr> "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", ...
```

```r
summary(elephants)
```

```
##       Age            Height           Sex           
##  Min.   : 0.01   Min.   : 75.46   Length:288        
##  1st Qu.: 4.58   1st Qu.:160.75   Class :character  
##  Median : 9.46   Median :200.00   Mode  :character  
##  Mean   :10.97   Mean   :187.68                     
##  3rd Qu.:16.50   3rd Qu.:221.09                     
##  Max.   :32.17   Max.   :304.06
```


**4. (2 points) Change the names of the variables to lower case and change the class of the variable `sex` to a factor.**


```r
elephants <- janitor::clean_names(elephants)
elephants$sex <- as.factor(elephants$sex)
```


**5. (2 points) How many male and female elephants are represented in the data?**


```r
elephants %>% 
  summarize(femalecount = sum(sex == "F"), malecount = sum(sex == "M"))
```

```
## # A tibble: 1 x 2
##   femalecount malecount
##         <int>     <int>
## 1         150       138
```


**6. (2 points) What is the average age all elephants in the data?**


```r
mean(elephants$age)
```

```
## [1] 10.97132
```


**7. (2 points) How does the average age and height of elephants compare by sex?**


```r
elephants %>% 
  group_by(sex) %>% 
  summarize(meanage = mean(age), meanheight = mean(height))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 2 x 3
##   sex   meanage meanheight
##   <fct>   <dbl>      <dbl>
## 1 F       12.8        190.
## 2 M        8.95       185.
```


**8. (2 points) How does the average height of elephants compare by sex for individuals over 25 years old. Include the min and max height as well as the number of individuals in the sample as part of your analysis.**


```r
elephants %>% 
  filter(age>25) %>% 
  group_by(sex) %>% 
  summarize(averageheight = mean(height), numbersamples = n(), minheight = min(height), maxheight = max(height))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 2 x 5
##   sex   averageheight numbersamples minheight maxheight
##   <fct>         <dbl>         <int>     <dbl>     <dbl>
## 1 F              233.            25      206.      278.
## 2 M              273.             8      237.      304.
```


For the next series of questions, we will use data from a study on vertebrate community composition and impacts from defaunation in [Gabon, Africa](https://en.wikipedia.org/wiki/Gabon). One thing to notice is that the data include 24 separate transects. Each transect represents a path through different forest management areas.  

Reference: Koerner SE, Poulsen JR, Blanchard EJ, Okouyi J, Clark CJ. Vertebrate community composition and diversity declines along a defaunation gradient radiating from rural villages in Gabon. _Journal of Applied Ecology_. 2016. This paper, along with a description of the variables is included inside the midterm 1 folder.  

**9. (2 points) Load `IvindoData_DryadVersion.csv` and use the function(s) of your choice to get an idea of the overall structure. Change the variables `HuntCat` and `LandUse` to factors.**


```r
ivindodata <- readr::read_csv("data/IvindoData_DryadVersion.csv")
```

```
## Parsed with column specification:
## cols(
##   .default = col_double(),
##   HuntCat = col_character(),
##   LandUse = col_character()
## )
```

```
## See spec(...) for full column specifications.
```

```r
glimpse(ivindodata)
```

```
## Rows: 24
## Columns: 26
## $ TransectID              <dbl> 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 13, 14, 15, 1...
## $ Distance                <dbl> 7.14, 17.31, 18.32, 20.85, 15.95, 17.47, 24...
## $ HuntCat                 <chr> "Moderate", "None", "None", "None", "None",...
## $ NumHouseholds           <dbl> 54, 54, 29, 29, 29, 29, 29, 54, 25, 73, 46,...
## $ LandUse                 <chr> "Park", "Park", "Park", "Logging", "Park", ...
## $ Veg_Rich                <dbl> 16.67, 15.75, 16.88, 12.44, 17.13, 16.50, 1...
## $ Veg_Stems               <dbl> 31.20, 37.44, 32.33, 29.39, 36.00, 29.22, 3...
## $ Veg_liana               <dbl> 5.78, 13.25, 4.75, 9.78, 13.25, 12.88, 8.38...
## $ Veg_DBH                 <dbl> 49.57, 34.59, 42.82, 36.62, 41.52, 44.07, 5...
## $ Veg_Canopy              <dbl> 3.78, 3.75, 3.43, 3.75, 3.88, 2.50, 4.00, 4...
## $ Veg_Understory          <dbl> 2.89, 3.88, 3.00, 2.75, 3.25, 3.00, 2.38, 2...
## $ RA_Apes                 <dbl> 1.87, 0.00, 4.49, 12.93, 0.00, 2.48, 3.78, ...
## $ RA_Birds                <dbl> 52.66, 52.17, 37.44, 59.29, 52.62, 38.64, 4...
## $ RA_Elephant             <dbl> 0.00, 0.86, 1.33, 0.56, 1.00, 0.00, 1.11, 0...
## $ RA_Monkeys              <dbl> 38.59, 28.53, 41.82, 19.85, 41.34, 43.29, 4...
## $ RA_Rodent               <dbl> 4.22, 6.04, 1.06, 3.66, 2.52, 1.83, 3.10, 1...
## $ RA_Ungulate             <dbl> 2.66, 12.41, 13.86, 3.71, 2.53, 13.75, 3.10...
## $ Rich_AllSpecies         <dbl> 22, 20, 22, 19, 20, 22, 23, 19, 19, 19, 21,...
## $ Evenness_AllSpecies     <dbl> 0.793, 0.773, 0.740, 0.681, 0.811, 0.786, 0...
## $ Diversity_AllSpecies    <dbl> 2.452, 2.314, 2.288, 2.006, 2.431, 2.429, 2...
## $ Rich_BirdSpecies        <dbl> 11, 10, 11, 8, 8, 10, 11, 11, 11, 9, 11, 11...
## $ Evenness_BirdSpecies    <dbl> 0.732, 0.704, 0.688, 0.559, 0.799, 0.771, 0...
## $ Diversity_BirdSpecies   <dbl> 1.756, 1.620, 1.649, 1.162, 1.660, 1.775, 1...
## $ Rich_MammalSpecies      <dbl> 11, 10, 11, 11, 12, 12, 12, 8, 8, 10, 10, 1...
## $ Evenness_MammalSpecies  <dbl> 0.736, 0.705, 0.650, 0.619, 0.736, 0.694, 0...
## $ Diversity_MammalSpecies <dbl> 1.764, 1.624, 1.558, 1.484, 1.829, 1.725, 1...
```

```r
summary(ivindodata)
```

```
##    TransectID       Distance        HuntCat          NumHouseholds  
##  Min.   : 1.00   Min.   : 2.700   Length:24          Min.   :13.00  
##  1st Qu.: 5.75   1st Qu.: 5.668   Class :character   1st Qu.:24.75  
##  Median :14.50   Median : 9.720   Mode  :character   Median :29.00  
##  Mean   :13.50   Mean   :11.879                      Mean   :37.88  
##  3rd Qu.:20.25   3rd Qu.:17.683                      3rd Qu.:54.00  
##  Max.   :27.00   Max.   :26.760                      Max.   :73.00  
##    LandUse             Veg_Rich       Veg_Stems       Veg_liana     
##  Length:24          Min.   :10.88   Min.   :23.44   Min.   : 4.750  
##  Class :character   1st Qu.:13.10   1st Qu.:28.69   1st Qu.: 9.033  
##  Mode  :character   Median :14.94   Median :32.45   Median :11.940  
##                     Mean   :14.83   Mean   :32.80   Mean   :11.040  
##                     3rd Qu.:16.54   3rd Qu.:37.08   3rd Qu.:13.250  
##                     Max.   :18.75   Max.   :47.56   Max.   :16.380  
##     Veg_DBH        Veg_Canopy    Veg_Understory     RA_Apes      
##  Min.   :28.45   Min.   :2.500   Min.   :2.380   Min.   : 0.000  
##  1st Qu.:40.65   1st Qu.:3.250   1st Qu.:2.875   1st Qu.: 0.000  
##  Median :43.90   Median :3.430   Median :3.000   Median : 0.485  
##  Mean   :46.09   Mean   :3.469   Mean   :3.020   Mean   : 2.045  
##  3rd Qu.:50.58   3rd Qu.:3.750   3rd Qu.:3.167   3rd Qu.: 3.815  
##  Max.   :76.48   Max.   :4.000   Max.   :3.880   Max.   :12.930  
##     RA_Birds      RA_Elephant       RA_Monkeys      RA_Rodent    
##  Min.   :31.56   Min.   :0.0000   Min.   : 5.84   Min.   :1.060  
##  1st Qu.:52.51   1st Qu.:0.0000   1st Qu.:22.70   1st Qu.:2.047  
##  Median :57.90   Median :0.3600   Median :31.74   Median :3.230  
##  Mean   :58.64   Mean   :0.5450   Mean   :31.30   Mean   :3.278  
##  3rd Qu.:68.17   3rd Qu.:0.8925   3rd Qu.:39.88   3rd Qu.:4.093  
##  Max.   :85.03   Max.   :2.3000   Max.   :54.12   Max.   :6.310  
##   RA_Ungulate     Rich_AllSpecies Evenness_AllSpecies Diversity_AllSpecies
##  Min.   : 0.000   Min.   :15.00   Min.   :0.6680      Min.   :1.966       
##  1st Qu.: 1.232   1st Qu.:19.00   1st Qu.:0.7542      1st Qu.:2.248       
##  Median : 2.545   Median :20.00   Median :0.7760      Median :2.316       
##  Mean   : 4.166   Mean   :20.21   Mean   :0.7699      Mean   :2.310       
##  3rd Qu.: 5.157   3rd Qu.:22.00   3rd Qu.:0.8083      3rd Qu.:2.429       
##  Max.   :13.860   Max.   :24.00   Max.   :0.8330      Max.   :2.566       
##  Rich_BirdSpecies Evenness_BirdSpecies Diversity_BirdSpecies Rich_MammalSpecies
##  Min.   : 8.00    Min.   :0.5590       Min.   :1.162         Min.   : 6.000    
##  1st Qu.:10.00    1st Qu.:0.6825       1st Qu.:1.603         1st Qu.: 9.000    
##  Median :11.00    Median :0.7220       Median :1.680         Median :10.000    
##  Mean   :10.33    Mean   :0.7137       Mean   :1.661         Mean   : 9.875    
##  3rd Qu.:11.00    3rd Qu.:0.7722       3rd Qu.:1.784         3rd Qu.:11.000    
##  Max.   :13.00    Max.   :0.8240       Max.   :2.008         Max.   :12.000    
##  Evenness_MammalSpecies Diversity_MammalSpecies
##  Min.   :0.6190         Min.   :1.378          
##  1st Qu.:0.7073         1st Qu.:1.567          
##  Median :0.7390         Median :1.699          
##  Mean   :0.7477         Mean   :1.698          
##  3rd Qu.:0.7847         3rd Qu.:1.815          
##  Max.   :0.8610         Max.   :2.065
```

```r
skim(ivindodata)
```


Table: Data summary

|                         |           |
|:------------------------|:----------|
|Name                     |ivindodata |
|Number of rows           |24         |
|Number of columns        |26         |
|_______________________  |           |
|Column type frequency:   |           |
|character                |2          |
|numeric                  |24         |
|________________________ |           |
|Group variables          |None       |


**Variable type: character**

|skim_variable | n_missing| complete_rate| min| max| empty| n_unique| whitespace|
|:-------------|---------:|-------------:|---:|---:|-----:|--------:|----------:|
|HuntCat       |         0|             1|   4|   8|     0|        3|          0|
|LandUse       |         0|             1|   4|   7|     0|        3|          0|


**Variable type: numeric**

|skim_variable           | n_missing| complete_rate|  mean|    sd|    p0|   p25|   p50|   p75|  p100|hist                                     |
|:-----------------------|---------:|-------------:|-----:|-----:|-----:|-----:|-----:|-----:|-----:|:----------------------------------------|
|TransectID              |         0|             1| 13.50|  8.51|  1.00|  5.75| 14.50| 20.25| 27.00|▇▃▅▆▆ |
|Distance                |         0|             1| 11.88|  7.28|  2.70|  5.67|  9.72| 17.68| 26.76|▇▂▂▅▂ |
|NumHouseholds           |         0|             1| 37.88| 17.80| 13.00| 24.75| 29.00| 54.00| 73.00|▇▇▂▇▂ |
|Veg_Rich                |         0|             1| 14.83|  2.07| 10.88| 13.10| 14.94| 16.54| 18.75|▃▂▃▇▁ |
|Veg_Stems               |         0|             1| 32.80|  5.96| 23.44| 28.69| 32.44| 37.08| 47.56|▆▇▆▃▁ |
|Veg_liana               |         0|             1| 11.04|  3.29|  4.75|  9.03| 11.94| 13.25| 16.38|▃▂▃▇▃ |
|Veg_DBH                 |         0|             1| 46.09| 10.67| 28.45| 40.65| 43.90| 50.57| 76.48|▂▇▃▁▁ |
|Veg_Canopy              |         0|             1|  3.47|  0.35|  2.50|  3.25|  3.43|  3.75|  4.00|▁▁▇▅▇ |
|Veg_Understory          |         0|             1|  3.02|  0.34|  2.38|  2.88|  3.00|  3.17|  3.88|▂▆▇▂▁ |
|RA_Apes                 |         0|             1|  2.04|  3.03|  0.00|  0.00|  0.48|  3.82| 12.93|▇▂▁▁▁ |
|RA_Birds                |         0|             1| 58.64| 14.71| 31.56| 52.51| 57.89| 68.18| 85.03|▅▅▇▇▃ |
|RA_Elephant             |         0|             1|  0.54|  0.67|  0.00|  0.00|  0.36|  0.89|  2.30|▇▂▂▁▁ |
|RA_Monkeys              |         0|             1| 31.30| 12.38|  5.84| 22.70| 31.74| 39.88| 54.12|▂▅▃▇▂ |
|RA_Rodent               |         0|             1|  3.28|  1.47|  1.06|  2.05|  3.23|  4.09|  6.31|▇▅▇▃▃ |
|RA_Ungulate             |         0|             1|  4.17|  4.31|  0.00|  1.23|  2.54|  5.16| 13.86|▇▂▁▁▂ |
|Rich_AllSpecies         |         0|             1| 20.21|  2.06| 15.00| 19.00| 20.00| 22.00| 24.00|▁▁▇▅▁ |
|Evenness_AllSpecies     |         0|             1|  0.77|  0.05|  0.67|  0.75|  0.78|  0.81|  0.83|▃▁▅▇▇ |
|Diversity_AllSpecies    |         0|             1|  2.31|  0.15|  1.97|  2.25|  2.32|  2.43|  2.57|▂▃▇▆▅ |
|Rich_BirdSpecies        |         0|             1| 10.33|  1.24|  8.00| 10.00| 11.00| 11.00| 13.00|▃▅▇▁▁ |
|Evenness_BirdSpecies    |         0|             1|  0.71|  0.08|  0.56|  0.68|  0.72|  0.77|  0.82|▅▁▇▆▇ |
|Diversity_BirdSpecies   |         0|             1|  1.66|  0.20|  1.16|  1.60|  1.68|  1.78|  2.01|▂▂▅▇▃ |
|Rich_MammalSpecies      |         0|             1|  9.88|  1.68|  6.00|  9.00| 10.00| 11.00| 12.00|▂▂▃▅▇ |
|Evenness_MammalSpecies  |         0|             1|  0.75|  0.06|  0.62|  0.71|  0.74|  0.78|  0.86|▂▃▇▂▅ |
|Diversity_MammalSpecies |         0|             1|  1.70|  0.17|  1.38|  1.57|  1.70|  1.81|  2.06|▅▇▇▇▃ |

```r
head(ivindodata)
```

```
## # A tibble: 6 x 26
##   TransectID Distance HuntCat NumHouseholds LandUse Veg_Rich Veg_Stems Veg_liana
##        <dbl>    <dbl> <chr>           <dbl> <chr>      <dbl>     <dbl>     <dbl>
## 1          1     7.14 Modera~            54 Park        16.7      31.2      5.78
## 2          2    17.3  None               54 Park        15.8      37.4     13.2 
## 3          2    18.3  None               29 Park        16.9      32.3      4.75
## 4          3    20.8  None               29 Logging     12.4      29.4      9.78
## 5          4    16.0  None               29 Park        17.1      36       13.2 
## 6          5    17.5  None               29 Park        16.5      29.2     12.9 
## # ... with 18 more variables: Veg_DBH <dbl>, Veg_Canopy <dbl>,
## #   Veg_Understory <dbl>, RA_Apes <dbl>, RA_Birds <dbl>, RA_Elephant <dbl>,
## #   RA_Monkeys <dbl>, RA_Rodent <dbl>, RA_Ungulate <dbl>,
## #   Rich_AllSpecies <dbl>, Evenness_AllSpecies <dbl>,
## #   Diversity_AllSpecies <dbl>, Rich_BirdSpecies <dbl>,
## #   Evenness_BirdSpecies <dbl>, Diversity_BirdSpecies <dbl>,
## #   Rich_MammalSpecies <dbl>, Evenness_MammalSpecies <dbl>,
## #   Diversity_MammalSpecies <dbl>
```

```r
ivindodata$HuntCat <- as.factor(ivindodata$HuntCat)
ivindodata$LandUse <- as.factor(ivindodata$LandUse)
```


**10. (4 points) For the transects with high and moderate hunting intensity, how does the average diversity of birds and mammals compare?**


```r
ivindodata %>% 
  filter(HuntCat == "Moderate" | HuntCat == "High") %>%
  group_by(HuntCat) %>% 
  summarize(avedivbirds = mean(Diversity_BirdSpecies), avedivmammals = mean(Diversity_MammalSpecies))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 2 x 3
##   HuntCat  avedivbirds avedivmammals
##   <fct>          <dbl>         <dbl>
## 1 High            1.66          1.74
## 2 Moderate        1.62          1.68
```


**11. (4 points) One of the conclusions in the study is that the relative abundance of animals drops off the closer you get to a village. Let's try to reconstruct this (without the statistics). **

**How does the relative abundance (RA) of apes, birds, elephants, monkeys, rodents, and ungulates compare between sites that are less than 5km from a village to sites that are greater than 20km from a village? The variable `Distance` measures the distance of the transect from the nearest village. Hint: try using the `across` operator.**  


```r
greaterthan20dist <- ivindodata %>% 
  filter(Distance>20) %>%
  summarize(across(contains("RA_"), mean)) %>% 
  mutate(Distanceis = "Greater than 20km")
greaterthan20dist
```

```
## # A tibble: 1 x 7
##   RA_Apes RA_Birds RA_Elephant RA_Monkeys RA_Rodent RA_Ungulate Distanceis      
##     <dbl>    <dbl>       <dbl>      <dbl>     <dbl>       <dbl> <chr>           
## 1    7.21     44.5       0.557       40.1      2.68        4.98 Greater than 20~
```

```r
smallerthan5dist <- ivindodata %>% 
  filter(Distance<5) %>% 
  summarize(across(contains("RA_"), mean)) %>% 
  mutate(Distanceis = "Less than 5km")
smallerthan5dist
```

```
## # A tibble: 1 x 7
##   RA_Apes RA_Birds RA_Elephant RA_Monkeys RA_Rodent RA_Ungulate Distanceis   
##     <dbl>    <dbl>       <dbl>      <dbl>     <dbl>       <dbl> <chr>        
## 1    0.08     70.4      0.0967       24.1      3.66        1.59 Less than 5km
```

```r
comparing <- rbind.data.frame(greaterthan20dist, smallerthan5dist)

comparing
```

```
## # A tibble: 2 x 7
##   RA_Apes RA_Birds RA_Elephant RA_Monkeys RA_Rodent RA_Ungulate Distanceis      
##     <dbl>    <dbl>       <dbl>      <dbl>     <dbl>       <dbl> <chr>           
## 1    7.21     44.5      0.557        40.1      2.68        4.98 Greater than 20~
## 2    0.08     70.4      0.0967       24.1      3.66        1.59 Less than 5km
```


```r
hello <-ivindodata %>% 
  mutate(DistancefrmVillage = ifelse(Distance > 20, yes ="greaterthan20",no=ifelse(Distance<5,yes= "lessthan5", no = NA))) %>%
  filter(DistancefrmVillage == "greaterthan20"| DistancefrmVillage == "lessthan5") %>% 
  group_by(DistancefrmVillage) %>% 
  summarize(across(contains("RA_"), mean), .groups= 'keep')

hello
```

```
## # A tibble: 2 x 7
## # Groups:   DistancefrmVillage [2]
##   DistancefrmVill~ RA_Apes RA_Birds RA_Elephant RA_Monkeys RA_Rodent RA_Ungulate
##   <chr>              <dbl>    <dbl>       <dbl>      <dbl>     <dbl>       <dbl>
## 1 greaterthan20       7.21     44.5      0.557        40.1      2.68        4.98
## 2 lessthan5           0.08     70.4      0.0967       24.1      3.66        1.59
```



#### The relative abundance of rodents and birds are greater at distances less than 5km from a village, and the relative abundances of apes, elephants, monkeys, and ungulates are greater at distances greater than 20Km from villages ####

**12. (4 points) Based on your interest, do one exploratory analysis on the `gabon` data of your choice. This analysis needs to include a minimum of two functions in `dplyr.`**

#### Bird diversity is greater in lands used as parks, but the relative abundance of birds is greater where the land is used for logging ####


```r
ivindodata %>% 
  filter(LandUse != "Neither") %>% 
  group_by(LandUse) %>%
  summarise(birddiversity = mean(Diversity_BirdSpecies), birdabundance = mean(RA_Birds))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 2 x 3
##   LandUse birddiversity birdabundance
##   <fct>           <dbl>         <dbl>
## 1 Logging          1.56          62.7
## 2 Park             1.77          44.0
```




