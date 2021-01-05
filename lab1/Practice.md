---
title: "Practice Rmd"
output: 
  html_document: 
    keep_md: yes
---



#### This is # 4 from lab 1_2

```r
#install.packages("tidyverse")
library("tidyverse")
```


```r
ggplot(mtcars, aes(x = factor(cyl))) +
    geom_bar()
```

![](Practice_files/figure-html/unnamed-chunk-2-1.png)<!-- -->
