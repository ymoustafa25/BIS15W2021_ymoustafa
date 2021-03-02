---
title: "group project excel join"
author: "Aryss Hearne"
date: "2/26/2021"
output: 
  html_document: 
    keep_md: yes
---




```r
#install.packages("stringr")
```



```r
library(tidyverse)
```

```
## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --
```

```
## v ggplot2 3.3.3     v purrr   0.3.4
## v tibble  3.0.6     v dplyr   1.0.4
## v tidyr   1.1.2     v stringr 1.4.0
## v readr   1.4.0     v forcats 0.5.1
```

```
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(here)
```

```
## here() starts at C:/Users/yamou/Desktop/BIS105L/BIS15W2021_ymoustafa
```

```r
library(janitor)
```

```
## 
## Attaching package: 'janitor'
```

```
## The following objects are masked from 'package:stats':
## 
##     chisq.test, fisher.test
```

```r
library(naniar)
library(stringr)
```


```r
virus<-readr::read_csv("data/viruses.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   `Organism Name` = col_character(),
##   `Organism Groups` = col_character(),
##   BioSample = col_logical(),
##   BioProject = col_character(),
##   Assembly = col_character(),
##   Level = col_character(),
##   `Size(Mb)` = col_double(),
##   `GC%` = col_double(),
##   Host = col_character(),
##   CDS = col_double(),
##   Neighbors = col_double(),
##   `Release Date` = col_datetime(format = ""),
##   `GenBank FTP` = col_character(),
##   `RefSeq FTP` = col_character(),
##   Genes = col_double(),
##   Scaffolds = col_double()
## )
```

```
## Warning: 344 parsing failures.
##  row       col           expected       actual               file
## 1438 BioSample 1/0/T/F/TRUE/FALSE SAMN02981359 'data/viruses.csv'
## 4401 BioSample 1/0/T/F/TRUE/FALSE SAMN02981224 'data/viruses.csv'
## 8940 BioSample 1/0/T/F/TRUE/FALSE SAMN01137200 'data/viruses.csv'
## 8941 BioSample 1/0/T/F/TRUE/FALSE SAMN01137212 'data/viruses.csv'
## 8944 BioSample 1/0/T/F/TRUE/FALSE SAMN01137140 'data/viruses.csv'
## .... ......... .................. ............ ..................
## See problems(...) for more details.
```



```r
virus2<-virus%>%
  separate(`Organism Groups`, into = c("viruss","other","family"),sep=";") %>% 
  select(-"viruss",-"other")
virus2 <- janitor::clean_names(virus2)
```



```r
virus3<-virus2 %>% 
  separate(`host`, into = c("host1","host2","host3","host4", "host5"),sep=",")
```

```
## Warning: Expected 5 pieces. Missing pieces filled with `NA` in 29949 rows [1, 2,
## 3, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, ...].
```

```r
view(virus3)

naniar::miss_var_summary(virus3)
```

```
## # A tibble: 20 x 3
##    variable      n_miss pct_miss
##    <chr>          <int>    <dbl>
##  1 bio_sample     34747 100     
##  2 host5          34449  99.1   
##  3 host4          34110  98.2   
##  4 host3          33398  96.1   
##  5 neighbors      32785  94.4   
##  6 bio_project    27586  79.4   
##  7 ref_seq_ftp    26878  77.4   
##  8 host2          24235  69.7   
##  9 host1           4500  13.0   
## 10 gen_bank_ftp       7   0.0201
## 11 organism_name      0   0     
## 12 family             0   0     
## 13 assembly           0   0     
## 14 level              0   0     
## 15 size_mb            0   0     
## 16 gc_percent         0   0     
## 17 cds                0   0     
## 18 release_date       0   0     
## 19 genes              0   0     
## 20 scaffolds          0   0
```



```r
virus3<- virus3 %>%
  mutate(strain=word(organism_name, 1L,2, sep=fixed(" ")))

new<- as.data.frame(table(virus3$strain)) %>% 
  #filter(Freq==10) %>% 
  rename(strain=Var1)

virus4 <- full_join(virus3, new, by="strain")

virus4<-virus4 %>% 
  filter(Freq==5) %>% 
  select(-host3,-host4,-host5)

naniar::miss_var_summary(virus4)
```

```
## # A tibble: 19 x 3
##    variable      n_miss pct_miss
##    <chr>          <int>    <dbl>
##  1 bio_sample       365   100   
##  2 host2            347    95.1 
##  3 bio_project      330    90.4 
##  4 neighbors        314    86.0 
##  5 ref_seq_ftp      154    42.2 
##  6 host1             35     9.59
##  7 organism_name      0     0   
##  8 family             0     0   
##  9 assembly           0     0   
## 10 level              0     0   
## 11 size_mb            0     0   
## 12 gc_percent         0     0   
## 13 cds                0     0   
## 14 release_date       0     0   
## 15 gen_bank_ftp       0     0   
## 16 genes              0     0   
## 17 scaffolds          0     0   
## 18 strain             0     0   
## 19 Freq               0     0
```

```r
view(virus4)
```






















