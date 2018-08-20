library(stringr)


RegWhy.statement <- function (arrayOfRegWhy){
  paste(arrayOfRegWhy,collapse ="", sep="")
}
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
RegWhy.orMarker=function(){return ("|")};
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



RegWhy.characterType.anyCharacter=function (){return (".")};
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
RegWhy.characterType.lowerCaseLetters=function (){return ("[a-z]")};
RegWhy.characterType.upperCaseLetters=function (){return ("[A-Z]")};
RegWhy.characterType.alphaNumericCharacterRange=function (){return ("[A-Za-z0-9]")};
RegWhy.characterType.alphaNumericCharacterRangePlus=function (otherCharacters){return (paste("[A-Za-z0-9]",
                                                                              otherCharacters,sep=""))};
RegWhy.characterType.alphaNumeric=function (){return ("[[:alnum:]]")};
RegWhy.characterType.controlCharacter=function (){return ("[[:control:]]")};
RegWhy.characterType.punctuation=function (){return ("[[:alnum:]]")};
RegWhy.characterType.hexadecial=function (){return ("[[:xdigit:]]")};
RegWhy.characterType.space=function (){return ("[[:space:]]")}; #tab, newline, vertical tab, form feed,carriage return, and space
RegWhy.characterType.printable=function (){return ("[[:print:]]")}; #alpha punct and space
RegWhy.characterType.graphical=function (){return ("[[:graph:]]")}; #alpha punct and space
RegWhy.characterType.blankSpace=function (){return ("[[:blank:]]")}; #space and tab
RegWhy.characterType.characterRange=function (listOfCharacters){return (paste("[",listOfCharacters,"]", sep=""))};
RegWhy.characterType.notInCharacterRange=function (listOfCharacters){return (paste("[^",listOfCharacters,"]", sep=""))};


RegWhy.unicode=function (unicodeNumber){return (paste("\\x{",unicodeNumber, "}",sep=""))};

RegWhy.group.startCapturing=function(){return ("(")}
RegWhy.group.startNonCapturing=function(){return ("(?:")}
RegWhy.group.startNamed=function(nameOfGroup){return (paste("(?<",nameOfGroup,">", sep=""))};
RegWhy.group.end=function(){return (")")}
RegWhy.group.endOptional=function(){return (")?")}
RegWhy.group.endZeroOrMore=function(){return (")*")}
RegWhy.group.endOneOrMore=function(){return (")+")}
RegWhy.group.endOptionSmallestMatch=function(){return (")??")}
RegWhy.group.endOptionZeroOrMoreSmallestMatch=function(){return (")*?")}
RegWhy.group.endOptionOneOrMoreSmallestMatch=function(){return (")+?")}
RegWhy.group.endOfSmallestMatch=function(){return ("?")}
RegWhy.group.lastMatch=function(){return ("$&")}
RegWhy.group.lastParen=function(){return ("$+")}
RegWhy.group.precedingMatch=function(){return ("%`")}
RegWhy.group.backReference=function(number){return (paste("$",number,sep=""))}
RegWhy.group.matchOnlyIfThisIsNext=function(whatsNext){return (paste("(?=",number,")",sep=""))}
RegWhy.group.matchOnlyIfThisIsNotNext=function(whatsNext){return (paste("(?|",number,")",sep=""))}

RegWhy.group.endExactNumber=function(number){return (paste("){",number,"}",sep=""))}
RegWhy.group.endEexactNumberOrAbove=function(number){return (paste("){",number,",}",sep=""))}
RegWhy.group.endRange=function(bottomNumber, topNumber){return (paste("){",bottomNumber,",",topNumber,"}",sep=""))}

#Quantifiers 
RegWhy.count.optional=function (){return ("?")}; 
RegWhy.count.zeroOrMore=function (){return ("*")};
RegWhy.count.oneOrMore=function (){return ("+")};
RegWhy.count.exactNumber=function (number){return (paste("{",number,"}",sep=""))};
RegWhy.count.exactNumberOrMore=function (number){return (paste("{",number,",}",sep=""))};
RegWhy.count.rangeOfTimes=function (bottomNumber,topNumber){return (paste("{",bottomNumber,",",topNumber,"}",sep=""))};

RegWhy.Where.startOfString=function(){return ("^")}
RegWhy.Where.endOfString=function(){return ("$")}
 

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

 
RegWhy.do.extractCapturedGroup <- function ( statementToSearch,regWhyStatement, groupNumber){
   
  return (str_match(statementToSearch,regWhyStatement)[groupNumber])
  
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

 
 
