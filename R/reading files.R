##EXAMPLES https://cran.r-project.org/web/packages/readtext/vignettes/readtext_vignette.html#plain-text-files-.txt
#https://docs.quanteda.io/articles/pkgdown/quickstart.html

#install.packages("readtext")
#install.packages("quanteda")
#install.packages("spacyr")
#devtools::install_github("quanteda/quanteda.corpora")
#devtools::install_github("kbenoit/LIWCalike")

library(spacyr)
library(quanteda)
library(readtext)

# Get the data directory from readtext
DATA_DIR <- system.file("extdata/", package = "readtext")
readtext(paste0(DATA_DIR, "/txt/UDHR/*"))
test <-readtext(paste0(DATA_DIR, "/txt/EU_manifestos/*.txt"),
         docvarsfrom = "filenames", 
         docvarnames = c("unit", "context", "year", "language", "party"),
         dvsep = "_", 
         encoding = "ISO-8859-1")
test <-readtext(paste0(DATA_DIR, "/txt/movie_reviews/*"))
test2 <-test$text[1]
test2
readtext(paste0(DATA_DIR, "/csv/inaugCorpus.csv"), text_field = "texts")
test2

res <- readLines(test2)
readLines(test2[1])

library(readr)
Big_Fish_fountain <- read_delim("C:/Repos/RegWhyMultiLanguage/Documents/Screenplays/Big-Fish.fountain.txt", 
                                "~", escape_double = FALSE, col_names = FALSE)
script_lines <-readLines("../Documents/Screenplays/Big-Fish.fountain.txt")
len_of_script <-length(script_lines)
start_of_script=FALSE
FADE_IN_SCRIPT =RegWhy.statement(c(
                      RegWhy.anyCharacter(),
                      RegWhy.count.zeroOrMore(),
                      RegWhy.make.literal("FADE IN"),
                      RegWhy.anyCharacter(),
                      RegWhy.count.zeroOrMore())
                      )

SCENE =RegWhy.make.statement(c(
                RegWhy.group.optionalLiterals.noncapturing(c("INT","EXT")),
                RegWhy.period(),
                RegWhy.count.zeroOrMore(),
                RegWhy.space(),
                RegWhy.count.oneOrMore(),
                Regwhy.group.start.capturing(),
                RegWhy.alphaNumeric(),
                RegWhy.count.oneOrMore(),
                Regwhy.group.end()
                
))
SCENE

last_line_type=""
for (i in 1:len_of_script){
  #print(script_lines[i])
  if (RegWhy.do.detect(script_lines[i], FADE_IN_SCRIPT)==TRUE){
    start_of_script=TRUE
    print("Start!")
  }
  if ((start_of_script==TRUE) && (RegWhy.do.detect(script_lines[i], FADE_IN_SCRIPT) ==FALSE)){
    print(script_lines[i])
  }
}
