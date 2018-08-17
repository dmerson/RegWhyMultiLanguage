library(stringr)


# Special Characters

RegWhy.period =function(){return ("\\.")}
RegWhy.backslash =function(){return ("\\")}
RegWhy.bar=function(){return ("\\|")}
RegWhy.leftParenthesis =function(){return ("\\(")}
RegWhy.rightParenthesis =function(){return ("\\)")}
RegWhy.leftBracket =function(){return ("\\[")}
RegWhy.rightBracket =function(){return ("]")}
RegWhy.leftBrace =function(){return ("\\{")}
RegWhy.rightBrace =function(){return ("\\}")}
RegWhy.dollarSign =function(){return ("\\$")}
RegWhy.asterisk =function(){return ("\\*")}
RegWhy.plusSign =function(){return ("\\+")}
RegWhy.questionMark =function(){return ("\\?")}
RegWhy.leftAngle =function(){return ("<")}
RegWhy.rightAngle =function(){return (">")}
RegWhy.caret =function(){return ("\\^")}
RegWhy.tab =function(){return ("\t")};
RegWhy.return =function(){return ("\r")};
RegWhy.newLine =function(){return ("\n")};
#Section parts

RegWhy.literal <- function(valueToSearch){
  valueToSearch =str_replace_all(valueToSearch,"\\.","\\\\.")
  valueToSearch=str_replace_all(valueToSearch,"\\\\", "\\\\\\")
  valueToSearch=str_replace_all(valueToSearch,"\\|", "\\\\|")
  valueToSearch=str_replace_all(valueToSearch,"\\(", "\\\\(")
  valueToSearch=str_replace_all(valueToSearch,"\\)", "\\\\)")
  valueToSearch=str_replace_all(valueToSearch,"\\[", "\\\\[")
  valueToSearch=str_replace_all(valueToSearch,"\\]", "\\\\]")
  valueToSearch=str_replace_all(valueToSearch,"\\{", "\\\\{")
  valueToSearch=str_replace_all(valueToSearch,"\\}", "\\\\}")
  valueToSearch=str_replace_all(valueToSearch,"\\$", "\\\\$")
  valueToSearch=str_replace_all(valueToSearch,"\\*", "\\\\*")
  valueToSearch=str_replace_all(valueToSearch,"\\+", "\\\\+")
  valueToSearch=str_replace_all(valueToSearch,"\\?", "\\\\?")
  valueToSearch=str_replace_all(valueToSearch,"\\<", "\\\\<")
  valueToSearch=str_replace_all(valueToSearch,"\\>", "\\\\>")
  valueToSearch=str_replace_all(valueToSearch,"\\^", "\\\\^")
  return (valueToSearch);
}

RegWhy.statement <- function (arrayOfRegWhy){
  paste(arrayOfRegWhy,collapse ="", sep="")
}
#Anchor Sequences
RegWhy.characterType.digit =function(){return ("\\d")}
RegWhy.characterType.nonDigit =function(){return ("\\D")}
RegWhy.characterType.whitespace =function(){return ("\\s")}
RegWhy.characterType.nonWhiteSpace =function(){return ("\\S")}
RegWhy.characterType.wordCharacter =function(){return ("\\w")}
RegWhy.characterType.nonWordCharacter =function(){return ("\\W")}
RegWhy.characterType.wordBoundary =function(){return ("\\b")}
RegWhy.characterType.nonWordBoundary =function(){return ("\\B")}
RegWhy.characterType.horizontalSpace=function (){return ("\\h")};
RegWhy.characterType.nonHorizontalSpace=function (){return ("\\H")};
RegWhy.characterType.verticalSpace=function (){return ("\\v")};
RegWhy.characterType.nonVerticalSpace=function (){return ("\\V")};

#Character Classes

RegWhy.characterType.lowerCaseVowel=function (){return ("[aeiouy]")};
RegWhy.characterType.upperCaseVowel=function (){return ("[AEIOUY]")};
RegWhy.characterType.anyCaseVowel=function (){return ("[aeiouyAEIOUY]")};
RegWhy.characterType.lowerCaseASCII=function (){return ("[a-z]")};
RegWhy.characterType.upperCaseASCII=function (){return ("[A-Z]")};
RegWhy.characterType.upperCaseASCIIAndSpace=function (){return ("[A-Z ]")};
RegWhy.characterType.dontMatch=function (regWhyStatement){return (paste("^",regWhyStatement,sep=""))};

#POSIx 
RegWhy.characterType.alphaNumeric=function (){return ("[[:alnum:]]")};
RegWhy.characterType.anyCharacter=function (){return (".")};
RegWhy.characterType.controlCharacter=function (){return ("[[:control:]]")};
RegWhy.characterType.punctuation=function (){return ("[[:alnum:]]")};
RegWhy.characterType.hexadecial=function (){return ("[[:xdigit:]]")};
RegWhy.characterType.space=function (){return ("[[:space:]]")}; #tab, newline, vertical tab, form feed,carriage return, and space
RegWhy.characterType.printable=function (){return ("[[:print:]]")}; #alpha punct and space
RegWhy.characterType.graphical=function (){return ("[[:graph:]]")}; #alpha punct and space
RegWhy.characterType.blankSpace=function (){return ("[[:blank:]]")}; #space and tab

#Unicode
RegWhy.unicode=function (unicodeNumber){return (paste("\x{",unicodeNumber, "}",sep=""))};




Regwhy.group.start.capturing=function(){return ("(")}
Regwhy.group.start.nonCapturing=function(){return ("(?:")}
Regwhy.group.start.named=function(nameOfGroup){return (paste("(?<",nameOfGroup,">", sep=""))};
RegWhy.group.start.range=function(){return ("[")}
RegWhy.group.start.range.none=function(){return ("^[")}
RegWhy.group.end.range=function(){return ("]")}
RegWhy.group.range=function (bottom,top){return (paste("[",bottom,"-",top,"]", sep=""))};
RegWhy.group.range.customCharacters=function (range){return (paste("[",range,"]", sep=""))};
RegWhy.group.optionalLiterals.capturing=function(listOfWords){
  words <-paste(listOfWords,collapse ="|", sep="")
  return (paste("(", words,")",sep=""));
}
RegWhy.group.optionalLiterals.noncapturing=function(listOfWords){
  words <-paste(listOfWords,collapse ="|", sep="")
  return (paste(Regwhy.group.start.nonCapturing(), words,")",sep=""));
}

RegWhy.group.or=function(){return ("|")}
RegWhy.group.list=function(listOfWords){
  return (paste(listOfWords,collapse="|"))
}
RegWhy.group.end=function(){return (")")}
RegWhy.group.end.optional=function(){return (")?")}
RegWhy.group.end.zeroOrMore=function(){return (")*")}
RegWhy.group.end.oneOrMore=function(){return (")+")}
RegWhy.group.end.exactNumber=function(number){return (paste("){",number,"}",sep=""))}
RegWhy.group.end.exactNumberOrAbove=function(number){return (paste("){",number,",}",sep=""))}
RegWhy.group.end.range=function(bottomNumber, topNumber){return (paste("){",bottomNumber,",",topNumber,"}",sep=""))}

#Quantifiers 
RegWhy.count.optional=function (){return ("?")}; 
RegWhy.count.zeroOrMore=function (){return ("*")};
RegWhy.count.oneOrMore=function (){return ("+")};
RegWhy.count.exactNumber=function (number){return (paste("{",number,"}",sep=""))};
RegWhy.count.exactNumberOrMore=function (number){return (paste("{",number,",}",sep=""))};
RegWhy.count.rangeOfTimes=function (bottomNumber,topNumber){return (paste("{",bottomNumber,",",topNumber,"}",sep=""))};

RegWhy.match.startOfString=function(){return ("^")}
RegWhy.match.endOfString=function(){return ("$")}
RegWhy.match.endOfStringOrLineBreak=function(){return ("\\Z")}
RegWhy.match.startOfMatchAttempt=function(){return ("\\G")}

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
RegWhy.do.match.capturedNumber <- function ( statementToSearch,regWhyStatement, groupNumber){
   
  return (str_match(statementToSearch,regWhyStatement)[groupNumber])
  
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
 
