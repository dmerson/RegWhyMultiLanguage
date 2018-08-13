library(stringr)


# Special Characters

RegWhy.period =function(){return ("\\.")}
RegWhy.backslash =function(){return ("\\")}
RegWhy.bar=function(){return ("\\|")}
RegWhy.leftParenthesis =function(){return ("\\(")}
RegWhy.rightParenthesis =function(){return ("\\)")}
RegWhy.leftBracket =function(){return ("\\[")}
RegWhy.leftBracket =function(){return ("]")}
RegWhy.leftBrace =function(){return ("\\{")}
RegWhy.rightBrace =function(){return ("\\}")}
RegWhy.dollarSign =function(){return ("\\$")}
RegWhy.asterisk =function(){return ("\\*")}
RegWhy.plusSign =function(){return ("\\+")}
RegWhy.minusSign =function(){return ("-")}
RegWhy.questionMark =function(){return ("\\?")}
RegWhy.leftAngle =function(){return ("<")}
RegWhy.rightAngle =function(){return (">")}
RegWhy.period =function(){return ("\\.")}
RegWhy.caret =function(){return ("\\^")}

#Anchor Sequences
RegWhy.digit =function(){return ("\d")}
RegWhy.nonDigit =function(){return ("\D")}
RegWhy.space =function(){return ("\s")}
RegWhy.nonSpace =function(){return ("\S")}
RegWhy.wordCharacter =function(){return ("\w")}
RegWhy.nonWordCharacter =function(){return ("\W")}
RegWhy.wordBoundary =function(){return ("\b")}
RegWhy.nonWordBoundary =function(){return ("\B")}
RegWhy.horizontalSpace=function (){return ("\h")};
RegWhy.nonHorizontalSpace=function (){return ("\H")};
RegWhy.verticalSpace=function (){return ("\v")};
RegWhy.nonVerticalSpace=function (){return ("\V")};

#Character Classes

RegWhy.lowerCaseVowel=function (){return ("[aeiou]")};
RegWhy.upperCaseVowel=function (){return ("[AEIOU]")};
RegWhy.anyCaseVowel=function (){return ("[aeiouAEIOU]")};
RegWhy.lowerCaseASCII=function (){return ("[a-z]")};
RegWhy.upperCaseASCII=function (){return ("[A-Z]")};
RegWhy.upperCaseASCIIAndSpace=function (){return ("[A-Z ]")};
RegWhy.dontMatch=function (regWhyStatement){return (paste("^",regWhyStatement,sep=""))};

#POSIx 
RegWhy.alphaNumeric=function (){return ("[[:alnum:]]")};
RegWhy.anyCharacter=function (){return (".")};
RegWhy.controlCharacter=function (){return ("[[:control:]]")};
RegWhy.punctuation=function (){return ("[[:alnum:]]")};
RegWhy.hexadecial=function (){return ("[[:xdigit:]]")};
RegWhy.space=function (){return ("[[:space:]]")}; #tab, newline, vertical tab, form feed,carriage return, and space
RegWhy.printable=function (){return ("[[:print:]]")}; #alpha punct and space
RegWhy.graphical=function (){return ("[[:graph:]]")}; #alpha punct and space
RegWhy.blankSpace=function (){return ("[[:blank:]]")}; #space and tab

#Unicode
RegWhy.unicode=function (unicodeNumber){return (paste("\x{",unicodeNumber, "}",sep=""))};

#Section parts

RegWhy.literal <- function(valueToSearch){
  return (valueToSearch);
}
RegWhy.statement <- function (arrayOfRegWhy){
  paste(arrayOfRegWhy,collapse ="", sep="")
}


Regwhy.group.start.capturing=function(){return ("(")}
Regwhy.group.start.nonCapturing=function(){return ("(?:")}
Regwhy.group.start.named=function(nameOfGroup){return (paste("(?<",nameOfGroup,">", sep=""))};
RegWhy.group.start.range=function(){return ("[")}
RegWhy.group.start.range.none=function(){return ("^[")}
RegWhy.group.end.range=function(){return ("]")}
RegWhy.group.range=function (bottom,top){return (paste("[",bottom,"-",top,"]", sep=""))};
RegWhy.group.range.customCharacters=function (range){return (paste("[",range,"]", sep=""))};

Regwhy.group.or=function(){return ("|")}
Regwhy.group.list=function(listOfWords){
  return (paste(listOfWords,collapse="|"))
}
Regwhy.group.end=function(){return (")")}
Regwhy.group.end.optional=function(){return (")?")}
Regwhy.group.end.zeroOrMore=function(){return (")*")}
Regwhy.group.end.exactNumber=function(number){return (paste("){",number,"}",sep=""))}
Regwhy.group.end.exactNumberOrAbove=function(number){return (paste("){",number,",}",sep=""))}
Regwhy.group.end.range=function(bottomNumber, topNumber){return (paste("){",bottomNumber,",",topNumber,"}",sep=""))}

#Quantifiers 
RegWhy.count.optional=function (){return ("?")}; 
RegWhy.count.zeroOrMore=function (){return ("*")};
RegWhy.count.oneOrMore=function (){return ("+")};
RegWhy.count.exactNumber=function (number){return (paste("{",number,"}",sep=""))};
RegWhy.count.exactNumberOrMore=function (number){return (paste("{",number,",}",sep=""))};
RegWhy.count.rangeOfTimes=function (bottomNumber,topNumber){return (paste("{",bottomNumber,",",topNumber,"}",sep=""))};

Regewhy.match.startOfString=function(){return ("^")}
Regewhy.match.endOfString=function(){return ("$")}
Regewhy.match.endOfStringOrLineBreak=function(){return ("\Z")}
Regewhy.match.startOfMatchAttempt=function(){return ("\G")}

# RegWhy.match.ZeroOrMoreCharacter=function (character){return (paste(character,"*",sep=""))}; 
# RegWhy.match.ZeroOrMoreStatement=function (regWhyStatement){return (paste("(",regWhyStatement,")","*",sep=""))};
# RegWhy.match.OneOrMoreCharacter=function (character){return (paste(character,"+",sep=""))}; 
# RegWhy.match.OneOrMoreStatement=function (regWhyStatement){return (paste("(",regWhyStatement,")","+",sep=""))};
# RegWhy.match.ExactNumberOfCharacter=function (character, number){return (paste(character,"{",number,"}",sep=""))}; 
# RegWhy.match.ExactNumberOfStatement=function (regWhyStatement, number){return (paste("(",regWhyStatement,"{",number,"}",sep=""))};
# RegWhy.match.NumberOrAboveOfCharacter=function (character, number){return (paste(character,"{",number,",}",sep=""))}; 
# RegWhy.match.NumberOrAboveOfStatement=function (regWhyStatement, number){return (paste("(",regWhyStatement,"{",number,",}",sep=""))};
# RegWhy.match.NumberRangeOfCharacter=function (character, bottomrange,toprange){return (paste(character,"{",bottomrange,",",toprange,"}",sep=""))}; 
# RegWhy.match.NumberRangeOfStatement=function (regWhyStatement, bottomrange,toprange){return (paste("(",regWhyStatement,"{",bottomrange,",",toprange,"}",sep=""))};


Regwhy.presets.screenplay.character= RegWhy.make.statement(  c(
  Regewhy.match.startOfString(),
  RegWhy.make.group.range.customCharacters("A-Z0-9 "),
  RegWhy.make.previous.oneOrMore(),
  Regewhy.match.endOfString()
  ))



#Reg Why Do Functions
RegWhy.do.detect <- function ( statementToSearch,regWhyStatement){
  return (str_detect(statementToSearch,regWhyStatement))
  
}

RegWhy.do.dontDetect <- function ( statementToSearch,regWhyStatement){
  return (!str_detect(statementToSearch,regWhyStatement))
  
}

RegWhy.do.extract <- function ( statementToSearch,regWhyStatement){
  return (str_extract(statementToSearch,regWhyStatement))
  
}
RegWhy.do.extractAll <- function ( statementToSearch,regWhyStatement){
  return (str_extract_all(statementToSearch,regWhyStatement))
  
}

RegWhy.do.match <- function ( statementToSearch,regWhyStatement){
  return (str_match(statementToSearch,regWhyStatement))
  
}
RegWhy.do.matchAll <- function ( statementToSearch,regWhyStatement){
  return (str_match_all(statementToSearch,regWhyStatement))
  
}
RegWhy.do.locate <- function ( statementToSearch,regWhyStatement){
  return (str_locate(statementToSearch,regWhyStatement))
  
}
RegWhy.do.locateAll <- function ( statementToSearch,regWhyStatement){
  return (str_locate_all(statementToSearch,regWhyStatement))
  
}
RegWhy.do.replace <- function ( statementToSearch,regWhyStatement, regWhyStatementReplacement){
  return (str_replace(statementToSearch,regWhyStatement))
  
}
RegWhy.do.replaceAll <- function ( statementToSearch,regWhyStatement, regWhyStatementReplacement){
  return (str_replace_all(statementToSearch,regWhyStatement, regWhyStatementReplacement))
  
}
RegWhy.do.splitList <- function ( listOfStrings,regWhyStatement){
  return (str_split(statementToSearch,regWhyStatement ))
  
}


helloWorld= RegWhy.make.statement(
  c(
            RegWhy.make.literal("Hello"),
            RegWhy.anyCharacter(),
            RegWhy.make.literal("World")
              )
)
range_statement=RegWhy.matchRange("A","Z")
RegWhy.do.detect("Hello World", helloWorld)
tester <-RegWhy.make.statement(
  c(  
    Regwhy.make.group.start.nonCapturing(),
     Regwhy.make.group.list(c("test","tom","bill")),
    Regwhy.make.group.end()
  )
  
)
print(tester)
RegWhy.do.detect("test",tester)
splits=RegWhy.do.splitAll("test Two three",RegWhy.space())
 
