---
title: "Lab 4 Homework"
author: "Yumna Moustafa"
date: "2021-01-18"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the tidyverse

```r
library(tidyverse)
```

## Data
For the homework, we will use data about vertebrate home range sizes. The data are in the class folder, but the reference is below.  

**Database of vertebrate home range sizes.**  
Reference: Tamburello N, Cote IM, Dulvy NK (2015) Energy and the scaling of animal space use. The American Naturalist 186(2):196-211. http://dx.doi.org/10.1086/682070.  
Data: http://datadryad.org/resource/doi:10.5061/dryad.q5j65/1  

**1. Load the data into a new object called `homerange`.**

```r
homerange <- readr::read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")
```

```
## Parsed with column specification:
## cols(
##   .default = col_character(),
##   mean.mass.g = col_double(),
##   log10.mass = col_double(),
##   mean.hra.m2 = col_double(),
##   log10.hra = col_double(),
##   preymass = col_double(),
##   log10.preymass = col_double(),
##   PPMR = col_double()
## )
```

```
## See spec(...) for full column specifications.
```


**2. Explore the data. Show the dimensions, column names, classes for each variable, and a statistical summary. Keep these as separate code chunks.** 


```r
glimpse(homerange)
```

```
## Rows: 569
## Columns: 24
## $ taxon                      <chr> "lake fishes", "river fishes", "river fi...
## $ common.name                <chr> "american eel", "blacktail redhorse", "c...
## $ class                      <chr> "actinopterygii", "actinopterygii", "act...
## $ order                      <chr> "anguilliformes", "cypriniformes", "cypr...
## $ family                     <chr> "anguillidae", "catostomidae", "cyprinid...
## $ genus                      <chr> "anguilla", "moxostoma", "campostoma", "...
## $ species                    <chr> "rostrata", "poecilura", "anomalum", "fu...
## $ primarymethod              <chr> "telemetry", "mark-recapture", "mark-rec...
## $ N                          <chr> "16", NA, "20", "26", "17", "5", "2", "2...
## $ mean.mass.g                <dbl> 887.00, 562.00, 34.00, 4.00, 4.00, 3525....
## $ log10.mass                 <dbl> 2.9479236, 2.7497363, 1.5314789, 0.60206...
## $ alternative.mass.reference <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ...
## $ mean.hra.m2                <dbl> 282750.00, 282.10, 116.11, 125.50, 87.10...
## $ log10.hra                  <dbl> 5.4514026, 2.4504031, 2.0648696, 2.09864...
## $ hra.reference              <chr> "Minns, C. K. 1995. Allometry of home ra...
## $ realm                      <chr> "aquatic", "aquatic", "aquatic", "aquati...
## $ thermoregulation           <chr> "ectotherm", "ectotherm", "ectotherm", "...
## $ locomotion                 <chr> "swimming", "swimming", "swimming", "swi...
## $ trophic.guild              <chr> "carnivore", "carnivore", "carnivore", "...
## $ dimension                  <chr> "3D", "2D", "2D", "2D", "2D", "2D", "2D"...
## $ preymass                   <dbl> NA, NA, NA, NA, NA, NA, 1.39, NA, NA, NA...
## $ log10.preymass             <dbl> NA, NA, NA, NA, NA, NA, 0.1430148, NA, N...
## $ PPMR                       <dbl> NA, NA, NA, NA, NA, NA, 530, NA, NA, NA,...
## $ prey.size.reference        <chr> NA, NA, NA, NA, NA, NA, "Brose U, et al....
```



```r
names(homerange)
```

```
##  [1] "taxon"                      "common.name"               
##  [3] "class"                      "order"                     
##  [5] "family"                     "genus"                     
##  [7] "species"                    "primarymethod"             
##  [9] "N"                          "mean.mass.g"               
## [11] "log10.mass"                 "alternative.mass.reference"
## [13] "mean.hra.m2"                "log10.hra"                 
## [15] "hra.reference"              "realm"                     
## [17] "thermoregulation"           "locomotion"                
## [19] "trophic.guild"              "dimension"                 
## [21] "preymass"                   "log10.preymass"            
## [23] "PPMR"                       "prey.size.reference"
```

```r
summary(homerange)
```

```
##     taxon           common.name           class              order          
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##     family             genus             species          primarymethod     
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##       N              mean.mass.g        log10.mass     
##  Length:569         Min.   :      0   Min.   :-0.6576  
##  Class :character   1st Qu.:     50   1st Qu.: 1.6990  
##  Mode  :character   Median :    330   Median : 2.5185  
##                     Mean   :  34602   Mean   : 2.5947  
##                     3rd Qu.:   2150   3rd Qu.: 3.3324  
##                     Max.   :4000000   Max.   : 6.6021  
##                                                        
##  alternative.mass.reference  mean.hra.m2          log10.hra     
##  Length:569                 Min.   :0.000e+00   Min.   :-1.523  
##  Class :character           1st Qu.:4.500e+03   1st Qu.: 3.653  
##  Mode  :character           Median :3.934e+04   Median : 4.595  
##                             Mean   :2.146e+07   Mean   : 4.709  
##                             3rd Qu.:1.038e+06   3rd Qu.: 6.016  
##                             Max.   :3.551e+09   Max.   : 9.550  
##                                                                 
##  hra.reference         realm           thermoregulation    locomotion       
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##  trophic.guild       dimension            preymass         log10.preymass   
##  Length:569         Length:569         Min.   :     0.67   Min.   :-0.1739  
##  Class :character   Class :character   1st Qu.:    20.02   1st Qu.: 1.3014  
##  Mode  :character   Mode  :character   Median :    53.75   Median : 1.7304  
##                                        Mean   :  3989.88   Mean   : 2.0188  
##                                        3rd Qu.:   363.35   3rd Qu.: 2.5603  
##                                        Max.   :130233.20   Max.   : 5.1147  
##                                        NA's   :502         NA's   :502      
##       PPMR         prey.size.reference
##  Min.   :  0.380   Length:569         
##  1st Qu.:  3.315   Class :character   
##  Median :  7.190   Mode  :character   
##  Mean   : 31.752                      
##  3rd Qu.: 15.966                      
##  Max.   :530.000                      
##  NA's   :502
```



**3. Change the class of the variables `taxon` and `order` to factors and display their levels.**  


```r
homerange$taxon <- as.factor(homerange$taxon)
homerange$order <- as.factor(homerange$order)
```

```r
table(homerange$order)
```

```
## 
##    accipitriformes       afrosoricida     anguilliformes       anseriformes 
##                  6                  2                  1                  1 
##     apterygiformes       artiodactyla   caprimulgiformes          carnivora 
##                  1                 39                  1                 56 
##    charadriiformes      columbidormes      columbiformes      coraciiformes 
##                  1                  1                  2                  2 
##       cuculiformes      cypriniformes      dasyuromorpha      dasyuromorpia 
##                  4                  4                  3                  1 
##    didelphimorphia        diprodontia      diprotodontia     erinaceomorpha 
##                  2                 12                  7                  2 
##        esociformes      falconiformes         gadiformes        galliformes 
##                  1                 17                  2                  8 
##         gruiformes         lagomorpha      macroscelidea       monotrematae 
##                  3                 14                  3                  1 
##      passeriformes     pelecaniformes    peramelemorphia        perciformes 
##                 70                  2                  2                 88 
##     perissodactyla         piciformes             pilosa        proboscidea 
##                  3                  7                  1                  2 
##     psittaciformes         rheiformes              roden           rodentia 
##                  1                  2                  1                 77 
##      salmoniformes    scorpaeniformes       siluriformes       soricomorpha 
##                  5                  8                  1                 10 
##           squamata       strigiformes   struthioniformes    syngnathiformes 
##                 52                  9                  1                  2 
##         testudines tetraodontiformes<U+00A0>       tinamiformes 
##                 26                  1                  1
```

```r
table(homerange$taxon)
```

```
## 
##         birds   lake fishes       lizards       mammals marine fishes 
##           140             9            11           238            90 
##  river fishes        snakes     tortoises       turtles 
##            14            41            12            14
```



**4. What taxa are represented in the `homerange` data frame? Make a new data frame `taxa` that is restricted to taxon, common name, class, order, family, genus, species.**  

```r
taxarep <- as.data.frame(table(homerange$taxon))
taxarep$Var1
```

```
## [1] birds         lake fishes   lizards       mammals       marine fishes
## [6] river fishes  snakes        tortoises     turtles      
## 9 Levels: birds lake fishes lizards mammals marine fishes ... turtles
```

```r
taxa <- select(homerange, "taxon", "common.name", "class", "order", "family", "genus", "species")
```

**5. The variable `taxon` identifies the large, common name groups of the species represented in `homerange`. Make a table the shows the counts for each of these `taxon`.**  


```r
table(taxa$taxon)
```

```
## 
##         birds   lake fishes       lizards       mammals marine fishes 
##           140             9            11           238            90 
##  river fishes        snakes     tortoises       turtles 
##            14            41            12            14
```


**6. The species in `homerange` are also classified into trophic guilds. How many species are represented in each trophic guild.**  

```r
as.factor(homerange$trophic.guild)
```

```
##   [1] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##   [8] carnivore herbivore herbivore herbivore herbivore carnivore carnivore
##  [15] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [22] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [29] carnivore carnivore carnivore carnivore carnivore carnivore herbivore
##  [36] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [43] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [50] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [57] carnivore carnivore carnivore carnivore carnivore herbivore herbivore
##  [64] herbivore carnivore herbivore herbivore herbivore herbivore herbivore
##  [71] herbivore herbivore herbivore herbivore herbivore herbivore carnivore
##  [78] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [85] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [92] carnivore carnivore carnivore herbivore carnivore carnivore carnivore
##  [99] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [106] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [113] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [120] herbivore carnivore carnivore carnivore herbivore herbivore herbivore
## [127] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [134] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [141] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [148] carnivore carnivore herbivore herbivore herbivore herbivore herbivore
## [155] herbivore herbivore herbivore carnivore herbivore carnivore carnivore
## [162] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [169] herbivore herbivore carnivore carnivore herbivore herbivore carnivore
## [176] carnivore herbivore carnivore carnivore carnivore carnivore carnivore
## [183] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [190] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [197] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [204] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [211] herbivore carnivore carnivore carnivore carnivore carnivore carnivore
## [218] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [225] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [232] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [239] carnivore herbivore herbivore herbivore carnivore carnivore carnivore
## [246] carnivore carnivore carnivore carnivore carnivore carnivore herbivore
## [253] herbivore carnivore carnivore herbivore herbivore herbivore herbivore
## [260] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [267] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [274] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [281] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [288] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [295] herbivore carnivore carnivore carnivore carnivore carnivore carnivore
## [302] carnivore herbivore carnivore carnivore carnivore carnivore carnivore
## [309] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [316] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [323] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [330] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [337] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [344] carnivore herbivore herbivore carnivore carnivore carnivore carnivore
## [351] carnivore carnivore carnivore carnivore carnivore carnivore herbivore
## [358] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [365] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [372] herbivore herbivore herbivore herbivore carnivore carnivore herbivore
## [379] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [386] herbivore herbivore herbivore herbivore herbivore herbivore carnivore
## [393] carnivore carnivore carnivore carnivore carnivore herbivore herbivore
## [400] herbivore herbivore herbivore herbivore carnivore herbivore herbivore
## [407] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [414] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [421] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [428] herbivore herbivore carnivore herbivore herbivore herbivore herbivore
## [435] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [442] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [449] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [456] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [463] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [470] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [477] herbivore herbivore herbivore herbivore herbivore carnivore carnivore
## [484] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [491] carnivore herbivore carnivore carnivore carnivore carnivore carnivore
## [498] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [505] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [512] carnivore carnivore carnivore carnivore carnivore carnivore herbivore
## [519] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [526] herbivore carnivore herbivore carnivore carnivore carnivore carnivore
## [533] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [540] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [547] carnivore carnivore carnivore carnivore carnivore herbivore herbivore
## [554] carnivore carnivore carnivore herbivore herbivore herbivore herbivore
## [561] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [568] herbivore carnivore
## Levels: carnivore herbivore
```

```r
table(homerange$trophic.guild)
```

```
## 
## carnivore herbivore 
##       342       227
```

## There are 342 carnivorous species and 227 herbivore species ##

**7. Make two new data frames, one which is restricted to carnivores and another that is restricted to herbivores.**  


```r
carnivorespecies <- filter(homerange, trophic.guild == "carnivore")
herbivorespecies <- filter(homerange, trophic.guild == "herbivore")
```


**8. Do herbivores or carnivores have, on average, a larger `mean.hra.m2`? Remove any NAs from the data.**  


```r
mean(carnivorespecies$mean.hra.m2, na.rm = T)
```

```
## [1] 13039918
```

```r
mean(herbivorespecies$mean.hra.m2, na.rm = T)
```

```
## [1] 34137012
```
## herbivores on average have a larger mean.hra.m2 ##

**9. Make a new dataframe `deer` that is limited to the mean mass, log10 mass, family, genus, and species of deer in the database. The family for deer is cervidae. Arrange the data in descending order by log10 mass. Which is the largest deer? What is its common name?**  



```r
deer <- select(homerange, "mean.mass.g", "log10.mass", "family", "genus", "species", "common.name")
deer <- filter(deer, family== "cervidae")
view(deer)
```
## alces alces, or Moose, have the largest deer ##
**10. As measured by the data, which snake species has the smallest homerange? Show all of your work, please. Look this species up online and tell me about it!** **Snake is found in taxon column** 

```r
snek <- filter(homerange, taxon == "snakes")
view(snek)
```
## Western worm snake is the smallest, they are a non-venomous snakes that mostly eat earthworms  ##

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
