---
title: "Lab 12 Homework"
author: "Yumna Moustafa"
date: "2021-02-25"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above. For any included plots, make sure they are clearly labeled. You are free to use any plot type that you feel best communicates the results of your analysis.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries

```r
library(tidyverse)
library(janitor)
library(here)
library(ggmap)
library(albersusa)
```

## Load the Data
We will use two separate data sets for this homework.  

1. The first [data set](https://rcweb.dartmouth.edu/~f002d69/workshops/index_rspatial.html) represent sightings of grizzly bears (Ursos arctos) in Alaska.  
2. The second data set is from Brandell, Ellen E (2021), Serological dataset and R code for: Patterns and processes of pathogen exposure in gray wolves across North America, Dryad, [Dataset](https://doi.org/10.5061/dryad.5hqbzkh51).  

1. Load the `grizzly` data and evaluate its structure. As part of this step, produce a summary that provides the range of latitude and longitude so you can build an appropriate bounding box.

```r
grizzly <- read_csv(here("lab12", "data", "bear-sightings.csv")) 
```

```
## Parsed with column specification:
## cols(
##   bear.id = col_double(),
##   longitude = col_double(),
##   latitude = col_double()
## )
```


```r
summary(grizzly)
```

```
##     bear.id       longitude         latitude    
##  Min.   :   7   Min.   :-166.2   Min.   :55.02  
##  1st Qu.:2569   1st Qu.:-154.2   1st Qu.:58.13  
##  Median :4822   Median :-151.0   Median :60.97  
##  Mean   :4935   Mean   :-149.1   Mean   :61.41  
##  3rd Qu.:7387   3rd Qu.:-145.6   3rd Qu.:64.13  
##  Max.   :9996   Max.   :-131.3   Max.   :70.37
```

2. Use the range of the latitude and longitude to build an appropriate bounding box for your map.

```r
lat <- c(55.02, 70.37)
long <- c(-166.2, -131.3)
bbox <- make_bbox(long, lat, f = 0.05)
```

3. Load a map from `stamen` in a terrain style projection and display the map.

```r
map1 <- get_map(bbox, maptype = "terrain", source = "stamen")
```

```
## Map tiles by Stamen Design, under CC BY 3.0. Data by OpenStreetMap, under ODbL.
```


```r
ggmap(map1)
```

![](lab12_hw_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

4. Build a final map that overlays the recorded observations of grizzly bears in Alaska.

```r
ggmap(map1) + 
  geom_point(data = grizzly, aes(longitude, latitude)) +
  labs(x = "Longitude", y = "Latitude", title = "Bear Sightings")
```

![](lab12_hw_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

5. Let's switch to the wolves data. Load the data and evaluate its structure.

```r
wolves <- read_csv(here("lab12", "data", "wolves_data","wolves_dataset.csv"))
```

```
## Parsed with column specification:
## cols(
##   .default = col_double(),
##   pop = col_character(),
##   age.cat = col_character(),
##   sex = col_character(),
##   color = col_character()
## )
```

```
## See spec(...) for full column specifications.
```

```r
glimpse(wolves)
```

```
## Rows: 1,986
## Columns: 23
## $ pop                <chr> "AK.PEN", "AK.PEN", "AK.PEN", "AK.PEN", "AK.PEN"...
## $ year               <dbl> 2006, 2006, 2006, 2006, 2006, 2006, 2006, 2006, ...
## $ age.cat            <chr> "S", "S", "A", "S", "A", "A", "A", "P", "S", "P"...
## $ sex                <chr> "F", "M", "F", "M", "M", "M", "F", "M", "F", "M"...
## $ color              <chr> "G", "G", "G", "B", "B", "G", "G", "G", "G", "G"...
## $ lat                <dbl> 57.03983, 57.03983, 57.03983, 57.03983, 57.03983...
## $ long               <dbl> -157.8427, -157.8427, -157.8427, -157.8427, -157...
## $ habitat            <dbl> 254.08, 254.08, 254.08, 254.08, 254.08, 254.08, ...
## $ human              <dbl> 10.42, 10.42, 10.42, 10.42, 10.42, 10.42, 10.42,...
## $ pop.density        <dbl> 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, ...
## $ pack.size          <dbl> 8.78, 8.78, 8.78, 8.78, 8.78, 8.78, 8.78, 8.78, ...
## $ standard.habitat   <dbl> -1.6339, -1.6339, -1.6339, -1.6339, -1.6339, -1....
## $ standard.human     <dbl> -0.9784, -0.9784, -0.9784, -0.9784, -0.9784, -0....
## $ standard.pop       <dbl> -0.6827, -0.6827, -0.6827, -0.6827, -0.6827, -0....
## $ standard.packsize  <dbl> 1.3157, 1.3157, 1.3157, 1.3157, 1.3157, 1.3157, ...
## $ standard.latitude  <dbl> 0.7214, 0.7214, 0.7214, 0.7214, 0.7214, 0.7214, ...
## $ standard.longitude <dbl> -2.1441, -2.1441, -2.1441, -2.1441, -2.1441, -2....
## $ cav.binary         <dbl> 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
## $ cdv.binary         <dbl> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
## $ cpv.binary         <dbl> 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, ...
## $ chv.binary         <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, ...
## $ neo.binary         <dbl> NA, NA, NA, 0, 0, NA, NA, 1, 0, 1, NA, 0, NA, NA...
## $ toxo.binary        <dbl> NA, NA, NA, 1, 0, NA, NA, 1, 0, 0, NA, 0, NA, NA...
```

6. How many distinct wolf populations are included in this study? Mae a new object that restricts the data to the wolf populations in the lower 48 US states.

```r
unique(wolves$pop)
```

```
##  [1] "AK.PEN"  "BAN.JAS" "BC"      "DENALI"  "ELLES"   "GTNP"    "INT.AK" 
##  [8] "MEXICAN" "MI"      "MT"      "N.NWT"   "ONT"     "SE.AK"   "SNF"    
## [15] "SS.NWT"  "YNP"     "YUCH"
```


```r
wolves_rest <- wolves %>% 
  filter(lat <= 48) 
```

7. Use the `albersusa` package to make a base map of the lower 48 US states.

```r
us_comp <- usa_sf() %>% 
  filter(name!="Alaska"& name!="Hawaii")
```


```r
cnty_comp <- counties_sf() %>% 
  filter(name!="Alaska"& name!="Hawaii")
```


```r
ggplot() + 
  geom_sf(data = us_comp, size = 0.125) + 
  theme_linedraw()+
  labs(title = "Lower 48 US states")
```

![](lab12_hw_files/figure-html/unnamed-chunk-13-1.png)<!-- -->

8. Use the relimited data to plot the distribution of wolf populations in the lower 48 US states.



```r
ggplot() + 
  geom_sf(data = us_comp, size = 0.125) + 
  theme_linedraw()+
  labs(title = "Lower 48 US states")+
  geom_point(data = wolves_rest, aes(long, lat, size=0.05))+
  labs(x = "Distribution of Wolves")+
  theme_minimal() +
  theme(axis.text = element_blank()) +
  theme(axis.title.x = element_text(hjust=0.5, size = 10)) +
  theme(axis.title.y = element_blank()) +
  theme(panel.grid = element_blank()) +
  theme(legend.position = c(0.9, 0.3))
```

![](lab12_hw_files/figure-html/unnamed-chunk-14-1.png)<!-- -->

9. What is the average pack size for the wolves in this study by region?

```r
wolves %>% 
  group_by(pop) %>% 
  summarize(meanpacksize = mean(pack.size))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 17 x 2
##    pop     meanpacksize
##    <chr>          <dbl>
##  1 AK.PEN          8.78
##  2 BAN.JAS         9.56
##  3 BC              5.88
##  4 DENALI          6.45
##  5 ELLES           9.19
##  6 GTNP            8.1 
##  7 INT.AK          6.24
##  8 MEXICAN         4.04
##  9 MI              7.12
## 10 MT              5.62
## 11 N.NWT           4   
## 12 ONT             4.37
## 13 SE.AK           5   
## 14 SNF             4.81
## 15 SS.NWT          3.55
## 16 YNP             8.25
## 17 YUCH            6.37
```

10. Make a new map that shows the distribution of wolves in the lower 48 US states but which has the size of location markers adjusted by pack size.

```r
ggplot() + 
  geom_sf(data = us_comp, size = 0.125) + 
  theme_linedraw()+
  labs(title = "Lower 48 US states")+
  geom_point(data = wolves_rest, aes(long, lat, size=pack.size, color=pop))+
  labs(x = "Distribution of Wolves")+
  theme_minimal() +
  theme(axis.text = element_blank()) +
  theme(axis.title.x = element_text(hjust=0.5, size = 10)) +
  theme(axis.title.y = element_blank()) +
  theme(panel.grid = element_blank())
```

![](lab12_hw_files/figure-html/unnamed-chunk-16-1.png)<!-- -->

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 
