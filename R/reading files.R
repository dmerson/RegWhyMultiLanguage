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
pdf_file <- readtext("../Documents/Screenplays/Big Fish.pdf")
three_kings_shooting <- readtext("../Documents/Screenplays/threekings_shootingdraft.pdf")
three_kings_shooting_lines <- stri_split_lines(three_kings_shooting)
pdf_text <- (pdf_file$text)
len_of_script <-length(script_lines)
library(stringi)
pdf_lines <- stri_split_lines1(pdf_text)
start_of_script=FALSE
HAS_A_TAB =RegWhy.statement(c(
  RegWhy.match.startOfString(),
  RegWhy.tab(),
  RegWhy.count.oneOrMore(),
  RegWhy.alphaNumeric(),
  RegWhy.count.oneOrMore(),
  RegWhy.match.endOfString()
))
SIX_SPACES =RegWhy.statement(c(
  RegWhy.match.startOfString(),
  RegWhy.space(),
  RegWhy.count.exactNumber(6),
  RegWhy.anyCharacter(),
  RegWhy.count.oneOrMore(),
  RegWhy.match.endOfString()
  
))
#RegWhy.do.detect("      WILL",SIX_SPACES)

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
# SCENE
BLANK_LINE=""
CHARACTER <- RegWhy.make.statement(c(
          RegWhy.match.startOfString(),
          Regwhy.group.start.capturing(),
          RegWhy.group.range.customCharacters("A-Z0-9 ."),
          RegWhy.group.end(),
          RegWhy.count.oneOrMore(),
          Regwhy.group.start.nonCapturing(),
          RegWhy.literal("(V.O.)"),
          RegWhy.group.end.optional(),
          Regwhy.group.start.nonCapturing(),
          RegWhy.literal("(O.S.)"),
          RegWhy.group.end.optional(),
          Regwhy.group.start.nonCapturing(),
          RegWhy.literal("(CONT'D)"),
          RegWhy.group.end.optional(),
          RegWhy.match.endOfString()
          
  
))
PARENTHETICAL <- RegWhy.make.statement(c(
  RegWhy.match.startOfString(),
  RegWhy.leftParenthesis(),
  RegWhy.anyCharacter(),
  RegWhy.count.oneOrMore(),
  RegWhy.rightParenthesis(),
  RegWhy.match.endOfString()
  
))
CUTS <- RegWhy.make.statement(c(
  RegWhy.match.startOfString(),
  RegWhy.literal("CUT TO"),
  RegWhy.anyCharacter(),
  RegWhy.count.oneOrMore(),
  RegWhy.match.endOfString()
  
))
CAMERADIRECTION <- RegWhy.make.statement(c(
  RegWhy.match.startOfString(),
  RegWhy.literal("CROSSFADE TO"),
  RegWhy.anyCharacter(),
  RegWhy.count.oneOrMore(),
  RegWhy.match.endOfString()
  
))
TRANSISTION <- RegWhy.make.statement(c(
  RegWhy.match.startOfString(),
  RegWhy.literal("TRANSISTION "),
  RegWhy.anyCharacter(),
  RegWhy.count.oneOrMore(),
  RegWhy.match.endOfString()
  
))
#RegWhy.do.detect("CUT TO:",CUTS)
#PARENTHETICAL
#RegWhy.do.detect("(says to JIM)", PARENTHETICAL)
#RegWhy.do.detect("(says to JIM", PARENTHETICAL)
# CHARACTER
# trimws(RegWhy.do.match.capturedNumber("HANDY ",CHARACTER,1))
# RegWhy.do.extractAll("HANDY (V.O.)",CHARACTER)
# RegWhy.do.extract("HANDY (V.O.)",CHARACTER)

last_line_type=""
 
for (i in 1:len_of_script){
  #print(script_lines[i])
  if (RegWhy.do.detect(script_lines[i], FADE_IN_SCRIPT)==TRUE){
    start_of_script=TRUE
    last_line_type="START"
    print("Start!")
  }
  #if script is started
  if ((start_of_script==TRUE) && (RegWhy.do.detect(script_lines[i], FADE_IN_SCRIPT) ==FALSE)){
    current_line <-script_lines[i]
    
    #look for Blank line
    if (current_line==BLANK_LINE){
      last_line_type="BLANK_LINE"
      
    }
    else{
      
      if (RegWhy.do.detect(current_line,CUTS) ||
          RegWhy.do.detect(current_line,CAMERADIRECTION) || 
          RegWhy.do.detect(current_line,TRANSISTION)){
        print("Camera")
        print(current_line)
      }
      else{
      #look for SCENE
      if (RegWhy.do.detect(current_line,SCENE)){
        print("SCENE")
        print(current_line)
        last_line_type="SCENE"
      }
      else{
        #Look for Character
        if (RegWhy.do.detect(current_line,CHARACTER)){
          print("CHARACTER")
          print(RegWhy.do.match.capturedNumber(current_line,CHARACTER,1))
          last_line_type="CHARACTER"
        }
        else{
          
          if (RegWhy.do.detect(current_line,PARENTHETICAL)==TRUE){
            print("PARENTHETICAL")
            last_line_type="PARENTHETICAL"
          }
          else{
            if (last_line_type=="CHARACTER" || last_line_type=="PARENTHETICAL"){
              print("DIALOGUE")
              last_line_type="DIALOGUE"
            }
            else
            {
              if (last_line_type=="DIALOGUE"){
                print("MORE DIALOGUE")
                last_line_type="DIALOGUE"
              }
              else
              {
                if (last_line_type=="BLANK_LINE"){
                  print("STAGE DIRECTION")
                  last_line_type="STAGE_DIRECTION"
                }
              }
            }
          }
          
          print(current_line)
        }
      }
      }
      
    }
    
    
  }
}
