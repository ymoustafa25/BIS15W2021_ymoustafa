---
title: "Lab 6 Homework"
author: "Yumna Moustafa"
date: "2021-01-27"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries

```r
library(tidyverse)
library(janitor)
library(skimr)
```

For this assignment we are going to work with a large data set from the [United Nations Food and Agriculture Organization](http://www.fao.org/about/en/) on world fisheries. These data are pretty wild, so we need to do some cleaning. First, load the data.  

Load the data `FAO_1950to2012_111914.csv` as a new object titled `fisheries`.

```r
fisheries <- readr::read_csv("data/FAO_1950to2012_111914.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   .default = col_character(),
##   `ISSCAAP group#` = col_double(),
##   `FAO major fishing area` = col_double()
## )
## i Use `spec()` for the full column specifications.
```

1. Do an exploratory analysis of the data (your choice). What are the names of the variables, what are the dimensions, are there any NA's, what are the classes of the variables?  

```r
glimpse(fisheries)
```

```
## Rows: 17,692
## Columns: 71
## $ Country                   <chr> "Albania", "Albania", "Albania", "Albania...
## $ `Common name`             <chr> "Angelsharks, sand devils nei", "Atlantic...
## $ `ISSCAAP group#`          <dbl> 38, 36, 37, 45, 32, 37, 33, 45, 38, 57, 3...
## $ `ISSCAAP taxonomic group` <chr> "Sharks, rays, chimaeras", "Tunas, bonito...
## $ `ASFIS species#`          <chr> "10903XXXXX", "1750100101", "17710001XX",...
## $ `ASFIS species name`      <chr> "Squatinidae", "Sarda sarda", "Sphyraena ...
## $ `FAO major fishing area`  <dbl> 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 3...
## $ Measure                   <chr> "Quantity (tonnes)", "Quantity (tonnes)",...
## $ `1950`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1951`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1952`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1953`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1954`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1955`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1956`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1957`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1958`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1959`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1960`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1961`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1962`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1963`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1964`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1965`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1966`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1967`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1968`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1969`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1970`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1971`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1972`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1973`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1974`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1975`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1976`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1977`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1978`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1979`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1980`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1981`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1982`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1983`                    <chr> NA, NA, NA, NA, NA, NA, "559", NA, NA, NA...
## $ `1984`                    <chr> NA, NA, NA, NA, NA, NA, "392", NA, NA, NA...
## $ `1985`                    <chr> NA, NA, NA, NA, NA, NA, "406", NA, NA, NA...
## $ `1986`                    <chr> NA, NA, NA, NA, NA, NA, "499", NA, NA, NA...
## $ `1987`                    <chr> NA, NA, NA, NA, NA, NA, "564", NA, NA, NA...
## $ `1988`                    <chr> NA, NA, NA, NA, NA, NA, "724", NA, NA, NA...
## $ `1989`                    <chr> NA, NA, NA, NA, NA, NA, "583", NA, NA, NA...
## $ `1990`                    <chr> NA, NA, NA, NA, NA, NA, "754", NA, NA, NA...
## $ `1991`                    <chr> NA, NA, NA, NA, NA, NA, "283", NA, NA, NA...
## $ `1992`                    <chr> NA, NA, NA, NA, NA, NA, "196", NA, NA, NA...
## $ `1993`                    <chr> NA, NA, NA, NA, NA, NA, "150 F", NA, NA, ...
## $ `1994`                    <chr> NA, NA, NA, NA, NA, NA, "100 F", NA, NA, ...
## $ `1995`                    <chr> "0 0", "1", NA, "0 0", "0 0", NA, "52", "...
## $ `1996`                    <chr> "53", "2", NA, "3", "2", NA, "104", "8", ...
## $ `1997`                    <chr> "20", "0 0", NA, "0 0", "0 0", NA, "65", ...
## $ `1998`                    <chr> "31", "12", NA, NA, NA, NA, "220", "18", ...
## $ `1999`                    <chr> "30", "30", NA, NA, NA, NA, "220", "18", ...
## $ `2000`                    <chr> "30", "25", "2", NA, NA, NA, "220", "20",...
## $ `2001`                    <chr> "16", "30", NA, NA, NA, NA, "120", "23", ...
## $ `2002`                    <chr> "79", "24", NA, "34", "6", NA, "150", "84...
## $ `2003`                    <chr> "1", "4", NA, "22", NA, NA, "84", "178", ...
## $ `2004`                    <chr> "4", "2", "2", "15", "1", "2", "76", "285...
## $ `2005`                    <chr> "68", "23", "4", "12", "5", "6", "68", "1...
## $ `2006`                    <chr> "55", "30", "7", "18", "8", "9", "86", "1...
## $ `2007`                    <chr> "12", "19", NA, NA, NA, NA, "132", "18", ...
## $ `2008`                    <chr> "23", "27", NA, NA, NA, NA, "132", "23", ...
## $ `2009`                    <chr> "14", "21", NA, NA, NA, NA, "154", "20", ...
## $ `2010`                    <chr> "78", "23", "7", NA, NA, NA, "80", "228",...
## $ `2011`                    <chr> "12", "12", NA, NA, NA, NA, "88", "9", NA...
## $ `2012`                    <chr> "5", "5", NA, NA, NA, NA, "129", "290", N...
```

```r
str(fisheries)
```

```
## tibble [17,692 x 71] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ Country                : chr [1:17692] "Albania" "Albania" "Albania" "Albania" ...
##  $ Common name            : chr [1:17692] "Angelsharks, sand devils nei" "Atlantic bonito" "Barracudas nei" "Blue and red shrimp" ...
##  $ ISSCAAP group#         : num [1:17692] 38 36 37 45 32 37 33 45 38 57 ...
##  $ ISSCAAP taxonomic group: chr [1:17692] "Sharks, rays, chimaeras" "Tunas, bonitos, billfishes" "Miscellaneous pelagic fishes" "Shrimps, prawns" ...
##  $ ASFIS species#         : chr [1:17692] "10903XXXXX" "1750100101" "17710001XX" "2280203101" ...
##  $ ASFIS species name     : chr [1:17692] "Squatinidae" "Sarda sarda" "Sphyraena spp" "Aristeus antennatus" ...
##  $ FAO major fishing area : num [1:17692] 37 37 37 37 37 37 37 37 37 37 ...
##  $ Measure                : chr [1:17692] "Quantity (tonnes)" "Quantity (tonnes)" "Quantity (tonnes)" "Quantity (tonnes)" ...
##  $ 1950                   : chr [1:17692] NA NA NA NA ...
##  $ 1951                   : chr [1:17692] NA NA NA NA ...
##  $ 1952                   : chr [1:17692] NA NA NA NA ...
##  $ 1953                   : chr [1:17692] NA NA NA NA ...
##  $ 1954                   : chr [1:17692] NA NA NA NA ...
##  $ 1955                   : chr [1:17692] NA NA NA NA ...
##  $ 1956                   : chr [1:17692] NA NA NA NA ...
##  $ 1957                   : chr [1:17692] NA NA NA NA ...
##  $ 1958                   : chr [1:17692] NA NA NA NA ...
##  $ 1959                   : chr [1:17692] NA NA NA NA ...
##  $ 1960                   : chr [1:17692] NA NA NA NA ...
##  $ 1961                   : chr [1:17692] NA NA NA NA ...
##  $ 1962                   : chr [1:17692] NA NA NA NA ...
##  $ 1963                   : chr [1:17692] NA NA NA NA ...
##  $ 1964                   : chr [1:17692] NA NA NA NA ...
##  $ 1965                   : chr [1:17692] NA NA NA NA ...
##  $ 1966                   : chr [1:17692] NA NA NA NA ...
##  $ 1967                   : chr [1:17692] NA NA NA NA ...
##  $ 1968                   : chr [1:17692] NA NA NA NA ...
##  $ 1969                   : chr [1:17692] NA NA NA NA ...
##  $ 1970                   : chr [1:17692] NA NA NA NA ...
##  $ 1971                   : chr [1:17692] NA NA NA NA ...
##  $ 1972                   : chr [1:17692] NA NA NA NA ...
##  $ 1973                   : chr [1:17692] NA NA NA NA ...
##  $ 1974                   : chr [1:17692] NA NA NA NA ...
##  $ 1975                   : chr [1:17692] NA NA NA NA ...
##  $ 1976                   : chr [1:17692] NA NA NA NA ...
##  $ 1977                   : chr [1:17692] NA NA NA NA ...
##  $ 1978                   : chr [1:17692] NA NA NA NA ...
##  $ 1979                   : chr [1:17692] NA NA NA NA ...
##  $ 1980                   : chr [1:17692] NA NA NA NA ...
##  $ 1981                   : chr [1:17692] NA NA NA NA ...
##  $ 1982                   : chr [1:17692] NA NA NA NA ...
##  $ 1983                   : chr [1:17692] NA NA NA NA ...
##  $ 1984                   : chr [1:17692] NA NA NA NA ...
##  $ 1985                   : chr [1:17692] NA NA NA NA ...
##  $ 1986                   : chr [1:17692] NA NA NA NA ...
##  $ 1987                   : chr [1:17692] NA NA NA NA ...
##  $ 1988                   : chr [1:17692] NA NA NA NA ...
##  $ 1989                   : chr [1:17692] NA NA NA NA ...
##  $ 1990                   : chr [1:17692] NA NA NA NA ...
##  $ 1991                   : chr [1:17692] NA NA NA NA ...
##  $ 1992                   : chr [1:17692] NA NA NA NA ...
##  $ 1993                   : chr [1:17692] NA NA NA NA ...
##  $ 1994                   : chr [1:17692] NA NA NA NA ...
##  $ 1995                   : chr [1:17692] "0 0" "1" NA "0 0" ...
##  $ 1996                   : chr [1:17692] "53" "2" NA "3" ...
##  $ 1997                   : chr [1:17692] "20" "0 0" NA "0 0" ...
##  $ 1998                   : chr [1:17692] "31" "12" NA NA ...
##  $ 1999                   : chr [1:17692] "30" "30" NA NA ...
##  $ 2000                   : chr [1:17692] "30" "25" "2" NA ...
##  $ 2001                   : chr [1:17692] "16" "30" NA NA ...
##  $ 2002                   : chr [1:17692] "79" "24" NA "34" ...
##  $ 2003                   : chr [1:17692] "1" "4" NA "22" ...
##  $ 2004                   : chr [1:17692] "4" "2" "2" "15" ...
##  $ 2005                   : chr [1:17692] "68" "23" "4" "12" ...
##  $ 2006                   : chr [1:17692] "55" "30" "7" "18" ...
##  $ 2007                   : chr [1:17692] "12" "19" NA NA ...
##  $ 2008                   : chr [1:17692] "23" "27" NA NA ...
##  $ 2009                   : chr [1:17692] "14" "21" NA NA ...
##  $ 2010                   : chr [1:17692] "78" "23" "7" NA ...
##  $ 2011                   : chr [1:17692] "12" "12" NA NA ...
##  $ 2012                   : chr [1:17692] "5" "5" NA NA ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   Country = col_character(),
##   ..   `Common name` = col_character(),
##   ..   `ISSCAAP group#` = col_double(),
##   ..   `ISSCAAP taxonomic group` = col_character(),
##   ..   `ASFIS species#` = col_character(),
##   ..   `ASFIS species name` = col_character(),
##   ..   `FAO major fishing area` = col_double(),
##   ..   Measure = col_character(),
##   ..   `1950` = col_character(),
##   ..   `1951` = col_character(),
##   ..   `1952` = col_character(),
##   ..   `1953` = col_character(),
##   ..   `1954` = col_character(),
##   ..   `1955` = col_character(),
##   ..   `1956` = col_character(),
##   ..   `1957` = col_character(),
##   ..   `1958` = col_character(),
##   ..   `1959` = col_character(),
##   ..   `1960` = col_character(),
##   ..   `1961` = col_character(),
##   ..   `1962` = col_character(),
##   ..   `1963` = col_character(),
##   ..   `1964` = col_character(),
##   ..   `1965` = col_character(),
##   ..   `1966` = col_character(),
##   ..   `1967` = col_character(),
##   ..   `1968` = col_character(),
##   ..   `1969` = col_character(),
##   ..   `1970` = col_character(),
##   ..   `1971` = col_character(),
##   ..   `1972` = col_character(),
##   ..   `1973` = col_character(),
##   ..   `1974` = col_character(),
##   ..   `1975` = col_character(),
##   ..   `1976` = col_character(),
##   ..   `1977` = col_character(),
##   ..   `1978` = col_character(),
##   ..   `1979` = col_character(),
##   ..   `1980` = col_character(),
##   ..   `1981` = col_character(),
##   ..   `1982` = col_character(),
##   ..   `1983` = col_character(),
##   ..   `1984` = col_character(),
##   ..   `1985` = col_character(),
##   ..   `1986` = col_character(),
##   ..   `1987` = col_character(),
##   ..   `1988` = col_character(),
##   ..   `1989` = col_character(),
##   ..   `1990` = col_character(),
##   ..   `1991` = col_character(),
##   ..   `1992` = col_character(),
##   ..   `1993` = col_character(),
##   ..   `1994` = col_character(),
##   ..   `1995` = col_character(),
##   ..   `1996` = col_character(),
##   ..   `1997` = col_character(),
##   ..   `1998` = col_character(),
##   ..   `1999` = col_character(),
##   ..   `2000` = col_character(),
##   ..   `2001` = col_character(),
##   ..   `2002` = col_character(),
##   ..   `2003` = col_character(),
##   ..   `2004` = col_character(),
##   ..   `2005` = col_character(),
##   ..   `2006` = col_character(),
##   ..   `2007` = col_character(),
##   ..   `2008` = col_character(),
##   ..   `2009` = col_character(),
##   ..   `2010` = col_character(),
##   ..   `2011` = col_character(),
##   ..   `2012` = col_character()
##   .. )
```

#### Dimension: 17692 rows by 71 columns, Yes there are NAs names of variables:  ####

```r
names(fisheries)
```

```
##  [1] "Country"                 "Common name"            
##  [3] "ISSCAAP group#"          "ISSCAAP taxonomic group"
##  [5] "ASFIS species#"          "ASFIS species name"     
##  [7] "FAO major fishing area"  "Measure"                
##  [9] "1950"                    "1951"                   
## [11] "1952"                    "1953"                   
## [13] "1954"                    "1955"                   
## [15] "1956"                    "1957"                   
## [17] "1958"                    "1959"                   
## [19] "1960"                    "1961"                   
## [21] "1962"                    "1963"                   
## [23] "1964"                    "1965"                   
## [25] "1966"                    "1967"                   
## [27] "1968"                    "1969"                   
## [29] "1970"                    "1971"                   
## [31] "1972"                    "1973"                   
## [33] "1974"                    "1975"                   
## [35] "1976"                    "1977"                   
## [37] "1978"                    "1979"                   
## [39] "1980"                    "1981"                   
## [41] "1982"                    "1983"                   
## [43] "1984"                    "1985"                   
## [45] "1986"                    "1987"                   
## [47] "1988"                    "1989"                   
## [49] "1990"                    "1991"                   
## [51] "1992"                    "1993"                   
## [53] "1994"                    "1995"                   
## [55] "1996"                    "1997"                   
## [57] "1998"                    "1999"                   
## [59] "2000"                    "2001"                   
## [61] "2002"                    "2003"                   
## [63] "2004"                    "2005"                   
## [65] "2006"                    "2007"                   
## [67] "2008"                    "2009"                   
## [69] "2010"                    "2011"                   
## [71] "2012"
```

2. Use `janitor` to rename the columns and make them easier to use. As part of this cleaning step, change `country`, `isscaap_group_number`, `asfis_species_number`, and `fao_major_fishing_area` to data class factor. 

```r
fisheries <- janitor::clean_names(fisheries)
```


```r
fisheries$country <- as.factor(fisheries$country)
fisheries$isscaap_group_number <- as.factor(fisheries$isscaap_group_number)
fisheries$asfis_species_number <- as.factor(fisheries$asfis_species_number)
fisheries$fao_major_fishing_area <- as.factor(fisheries$fao_major_fishing_area)
```

We need to deal with the years because they are being treated as characters and start with an X. We also have the problem that the column names that are years actually represent data. We haven't discussed tidy data yet, so here is some help. You should run this ugly chunk to transform the data for the rest of the homework. It will only work if you have used janitor to rename the variables in question 2!

```r
fisheries_tidy <- fisheries %>% 
  pivot_longer(-c(country,common_name,isscaap_group_number,isscaap_taxonomic_group,asfis_species_number,asfis_species_name,fao_major_fishing_area,measure),
               names_to = "year",
               values_to = "catch",
               values_drop_na = TRUE) %>% 
  mutate(year= as.numeric(str_replace(year, 'x', ''))) %>% 
  mutate(catch= str_replace(catch, c(' F'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('...'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('-'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('0 0'), replacement = ''))

fisheries_tidy$catch <- as.numeric(fisheries_tidy$catch)
```

3. How many countries are represented in the data? Provide a count and list their names.

```r
table(fisheries_tidy$country)
```

```
## 
##                   Albania                   Algeria            American Samoa 
##                       934                      1561                       556 
##                    Angola                  Anguilla       Antigua and Barbuda 
##                      2119                       129                       356 
##                 Argentina                     Aruba                 Australia 
##                      3403                       172                      8183 
##                   Bahamas                   Bahrain                Bangladesh 
##                       423                      1169                       169 
##                  Barbados                   Belgium                    Belize 
##                       795                      2530                      1075 
##                     Benin                   Bermuda  Bonaire/S.Eustatius/Saba 
##                      1419                       846                         4 
##    Bosnia and Herzegovina                    Brazil  British Indian Ocean Ter 
##                        21                      4784                        97 
##    British Virgin Islands         Brunei Darussalam                  Bulgaria 
##                       332                       186                      1596 
##          C<f4>te d'Ivoire                Cabo Verde                  Cambodia 
##                      1859                       462                       238 
##                  Cameroon                    Canada            Cayman Islands 
##                      1340                      5099                        84 
##           Channel Islands                     Chile                     China 
##                      1313                      3878                      2801 
##      China, Hong Kong SAR          China, Macao SAR                  Colombia 
##                      1782                       206                      2710 
##                   Comoros   Congo, Dem. Rep. of the        Congo, Republic of 
##                       965                       484                      1527 
##              Cook Islands                Costa Rica                   Croatia 
##                       810                      1171                       947 
##                      Cuba                Cura<e7>ao                    Cyprus 
##                      2981                        18                      1703 
##                   Denmark                  Djibouti                  Dominica 
##                      3741                       352                       213 
##        Dominican Republic                   Ecuador                     Egypt 
##                      1958                      1595                      2467 
##               El Salvador         Equatorial Guinea                   Eritrea 
##                       620                       551                       653 
##                   Estonia                  Ethiopia    Falkland Is.(Malvinas) 
##                      1088                       129                       502 
##             Faroe Islands         Fiji, Republic of                   Finland 
##                      2283                      1798                       706 
##                    France             French Guiana          French Polynesia 
##                     10639                       231                       672 
##      French Southern Terr                     Gabon                    Gambia 
##                       139                      1089                      1214 
##                   Georgia                   Germany                     Ghana 
##                       428                      4813                      2462 
##                 Gibraltar                    Greece                 Greenland 
##                        61                      4091                      1311 
##                   Grenada                Guadeloupe                      Guam 
##                      1635                       372                       520 
##                 Guatemala                    Guinea              GuineaBissau 
##                       622                       697                       634 
##                    Guyana                     Haiti                  Honduras 
##                       251                       204                       842 
##                   Iceland                     India                 Indonesia 
##                      2346                      5588                      9274 
##    Iran (Islamic Rep. of)                      Iraq                   Ireland 
##                      1210                       150                      3235 
##               Isle of Man                    Israel                     Italy 
##                       952                      1359                      4567 
##                   Jamaica                     Japan                    Jordan 
##                       149                     15429                       226 
##                     Kenya                  Kiribati  Korea, Dem. People's Rep 
##                       958                       875                       210 
##        Korea, Republic of                    Kuwait                    Latvia 
##                     10824                       805                      1101 
##                   Lebanon                   Liberia                     Libya 
##                       614                      1514                       578 
##                 Lithuania                Madagascar                  Malaysia 
##                      1274                      1008                      6963 
##                  Maldives                     Malta          Marshall Islands 
##                       487                      2156                       292 
##                Martinique                Mauritania                 Mauritius 
##                       672                      1501                       991 
##                   Mayotte                    Mexico Micronesia, Fed.States of 
##                       194                      6202                       413 
##                    Monaco                Montenegro                Montserrat 
##                        43                       168                        63 
##                   Morocco                Mozambique                   Myanmar 
##                      4758                       434                       117 
##                   Namibia                     Nauru               Netherlands 
##                       905                       150                      2944 
##      Netherlands Antilles             New Caledonia               New Zealand 
##                       338                       789                      4594 
##                 Nicaragua                   Nigeria                      Niue 
##                       904                      1479                       145 
##            Norfolk Island      Northern Mariana Is.                    Norway 
##                        41                       488                      3747 
##                      Oman                 Other nei                  Pakistan 
##                      1086                      1556                      2166 
##                     Palau   Palestine, Occupied Tr.                    Panama 
##                       636                       429                      1773 
##          Papua New Guinea                      Peru               Philippines 
##                       686                      2767                      4548 
##          Pitcairn Islands                    Poland                  Portugal 
##                        63                      2553                     11570 
##               Puerto Rico                     Qatar                R<e9>union 
##                       918                       941                       736 
##                   Romania        Russian Federation       Saint Barth<e9>lemy 
##                      1738                      4736                         6 
##              Saint Helena     Saint Kitts and Nevis               Saint Lucia 
##                       609                       397                       558 
##  Saint Vincent/Grenadines               SaintMartin                     Samoa 
##                       715                         6                       386 
##     Sao Tome and Principe              Saudi Arabia                   Senegal 
##                      1035                      2200                      2988 
##     Serbia and Montenegro                Seychelles              Sierra Leone 
##                       516                      1142                      1526 
##                 Singapore              Sint Maarten                  Slovenia 
##                      1937                         4                       644 
##           Solomon Islands                   Somalia              South Africa 
##                       505                       141                      3881 
##                     Spain                 Sri Lanka   St. Pierre and Miquelon 
##                     17482                      1351                      1038 
##                     Sudan            Sudan (former)                  Suriname 
##                         3                        90                       234 
##    Svalbard and Jan Mayen                    Sweden      Syrian Arab Republic 
##                        41                      3115                       793 
##  Taiwan Province of China  Tanzania, United Rep. of                  Thailand 
##                      9927                      1277                      4843 
##                TimorLeste                      Togo                   Tokelau 
##                        98                      1723                       102 
##                     Tonga       Trinidad and Tobago                   Tunisia 
##                       403                       923                      3019 
##                    Turkey      Turks and Caicos Is.                    Tuvalu 
##                      3326                       193                       162 
##                   Ukraine        Un. Sov. Soc. Rep.      United Arab Emirates 
##                      1823                      7084                      1801 
##            United Kingdom  United States of America                   Uruguay 
##                      6577                     18080                      2134 
##         US Virgin Islands                   Vanuatu   Venezuela, Boliv Rep of 
##                       348                       789                      3409 
##                  Viet Nam     Wallis and Futuna Is.            Western Sahara 
##                       405                       128                         0 
##                     Yemen            Yugoslavia SFR                  Zanzibar 
##                      1278                      1383                       247
```


```r
fisheries_tidy %>% 
  summarize(n_distinct(country))
```

```
## # A tibble: 1 x 1
##   `n_distinct(country)`
##                   <int>
## 1                   203
```

4. Refocus the data only to include only: country, isscaap_taxonomic_group, asfis_species_name, asfis_species_number, year, catch.

```r
new_fisheries <- fisheries_tidy %>% 
  select(country, isscaap_taxonomic_group, asfis_species_name, asfis_species_number, year, catch)
```

5. Based on the asfis_species_number, how many distinct fish species were caught as part of these data?

```r
new_fisheries %>%
  summarize(n_distinct(asfis_species_number))
```

```
## # A tibble: 1 x 1
##   `n_distinct(asfis_species_number)`
##                                <int>
## 1                               1551
```

6. Which country had the largest overall catch in the year 2000?

#### China ####


```r
new_fisheries %>%
  filter(year == 2000) %>% 
  group_by(country) %>% 
  summarize(sumcatch = sum(catch, na.rm = T)) %>% 
  arrange(desc(sumcatch))
```

```
## # A tibble: 193 x 2
##    country                  sumcatch
##    <fct>                       <dbl>
##  1 China                       25899
##  2 Russian Federation          12181
##  3 United States of America    11762
##  4 Japan                        8510
##  5 Indonesia                    8341
##  6 Peru                         7443
##  7 Chile                        6906
##  8 India                        6351
##  9 Thailand                     6243
## 10 Korea, Republic of           6124
## # ... with 183 more rows
```

7. Which country caught the most sardines (_Sardina pilchardus_) between the years 1990-2000?
#### Morocco ####


```r
new_fisheries %>%
  filter(asfis_species_name == "Sardina pilchardus") %>% 
  filter(between(year, 1990, 2000)) %>% 
  group_by(country) %>%
  summarize(sumsardinecatch = sum(catch, na.rm= T)) %>% 
  arrange(desc(sumsardinecatch))
```

```
## # A tibble: 37 x 2
##    country               sumsardinecatch
##    <fct>                           <dbl>
##  1 Morocco                          7470
##  2 Spain                            3507
##  3 Russian Federation               1639
##  4 Ukraine                          1030
##  5 France                            966
##  6 Portugal                          818
##  7 Greece                            528
##  8 Italy                             507
##  9 Serbia and Montenegro             478
## 10 Denmark                           477
## # ... with 27 more rows
```


8. Which five countries caught the most cephalopods between 2008-2012?

#### India, China, Spain, Algeria, and France ####


```r
new_fisheries %>% 
  filter(asfis_species_name=="Cephalopoda") %>%
  filter(between(year, 2008, 2012)) %>%
  group_by(country) %>%
  summarize(sumceph = sum(catch, na.rm = T)) %>%
  arrange(desc(sumceph))
```

```
## # A tibble: 16 x 2
##    country                  sumceph
##    <fct>                      <dbl>
##  1 India                        570
##  2 China                        257
##  3 Spain                        198
##  4 Algeria                      162
##  5 France                       101
##  6 Mauritania                    90
##  7 TimorLeste                    76
##  8 Italy                         66
##  9 Mozambique                    16
## 10 Cambodia                      15
## 11 Taiwan Province of China      13
## 12 Madagascar                    11
## 13 Croatia                        7
## 14 Israel                         0
## 15 Somalia                        0
## 16 Viet Nam                       0
```


9. Which species had the highest catch total between 2008-2012? (hint: Osteichthyes is not a species)

#### Theragra chalcogramma ####


```r
new_fisheries %>% 
  filter(asfis_species_name != "Osteichthyes") %>%
  filter(between(year, 2008, 2012)) %>% 
  group_by(asfis_species_name) %>% 
  summarize(catchcount = sum(catch, na.rm= T)) %>% 
  arrange(desc(catchcount))
```

```
## # A tibble: 1,471 x 2
##    asfis_species_name    catchcount
##    <chr>                      <dbl>
##  1 Theragra chalcogramma      41075
##  2 Engraulis ringens          35523
##  3 Katsuwonus pelamis         32153
##  4 Trichiurus lepturus        30400
##  5 Clupea harengus            28527
##  6 Thunnus albacares          20119
##  7 Scomber japonicus          14723
##  8 Gadus morhua               13253
##  9 Thunnus alalunga           12019
## 10 Natantia                   11984
## # ... with 1,461 more rows
```

10. Use the data to do at least one analysis of your choice.

### In the year 2009, the most Sharks/Rays/Chimaeras were caught ###

```r
new_fisheries %>% 
  filter(isscaap_taxonomic_group == "Sharks, rays, chimaeras") %>% 
  group_by(isscaap_taxonomic_group, year) %>% 
  summarise(sharkspluscaught = sum(catch, na.rm = T)) %>% 
  arrange(desc(sharkspluscaught))
```

```
## `summarise()` has grouped output by 'isscaap_taxonomic_group'. You can override using the `.groups` argument.
```

```
## # A tibble: 63 x 3
## # Groups:   isscaap_taxonomic_group [1]
##    isscaap_taxonomic_group  year sharkspluscaught
##    <chr>                   <dbl>            <dbl>
##  1 Sharks, rays, chimaeras  2009            13200
##  2 Sharks, rays, chimaeras  2008            12897
##  3 Sharks, rays, chimaeras  2010            12516
##  4 Sharks, rays, chimaeras  2011            12034
##  5 Sharks, rays, chimaeras  2012            11734
##  6 Sharks, rays, chimaeras  2007            11372
##  7 Sharks, rays, chimaeras  2005            10870
##  8 Sharks, rays, chimaeras  2006            10858
##  9 Sharks, rays, chimaeras  2004            10669
## 10 Sharks, rays, chimaeras  2003             9386
## # ... with 53 more rows
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
