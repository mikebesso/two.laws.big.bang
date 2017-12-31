rownames(installed.packages())



packages <-
  setdiff(
    c(
      "pryr",
      "wrapr",
      "stringr",
      "stringi",
      "lucr",
      "readr",
      "plyr",
      "rlist",
      "broom",
      "dplyr",
      "forcats",
      "ggplot2",
      "haven",
      "httr",
      "hms",
      "jsonlite",
      "lubridate",
      "magrittr",
      "assertive",
      "testthat",
      "tools",
      "devtools",
      "gtools",
      "checkmate",
      "settings",
      "testthat",
      "config",
      "digest",
      "R6",
      "rmarkdown",
      "htmltools",
      "shiny",
      "rio",
      "timeDate",
      "png",
      "rmdformats",
      "htmlwidgets"
    ),
    rownames(installed.packages())
  );



lapply(
  packages,
  install.packages
)

