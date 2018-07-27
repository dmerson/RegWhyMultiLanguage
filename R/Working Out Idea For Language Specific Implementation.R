library(stringr)
RegWhy.literal <- function(valueToSearch){
  return (valueToSearch);
}
RegWhy.statement <- function (arrayOfRegWhy){
  paste(arrayOfRegWhy,collapse ="")
}

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
RegWhy.matchRange=function (bottom,top){return (paste("[",bottom,"-",top,"]", sep=""))};
RegWhy.dontMatchRange=function (bottom,top){return (paste("^[",bottom,"-",top,"]", sep=""))};
RegWhy.matchComplexRange=function (range){return (paste("[",range,"]", sep=""))};
RegWhy.dontMatchComplexRange=function (range){return (paste("^[",range,"]", sep=""))};
RegWhy.lowerCaseVowel=function (){return ("[aeiou]")};
RegWhy.upperCaseVowel=function (){return ("[AEIOU]")};
RegWhy.anyCaseVowel=function (){return ("[aeiouAEIOU]")};
RegWhy.lowerCaseASCII=function (){return ("[a-z]")};
RegWhy.upperCaseASCII=function (){return ("[A-Z")};
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

#Quantifiers 
RegWhy.optionalCharacter=function (character){return (paste(character,"?",sep=""))}; 
RegWhy.optionalStatement=function (regWhyStatement){return (paste("(",regWhyStatement,")","?",sep=""))}; 
RegWhy.matchZeroOrMoreCharacter=function (character){return (paste(character,"*",sep=""))}; 
RegWhy.matchZeroOrMoreStatement=function (regWhyStatement){return (paste("(",regWhyStatement,")","*",sep=""))};
RegWhy.matchOneOrMoreCharacter=function (character){return (paste(character,"+",sep=""))}; 
RegWhy.matchOneOrMoreStatement=function (regWhyStatement){return (paste("(",regWhyStatement,")","+",sep=""))};
RegWhy.matchExactNumberOfCharacter=function (character, number){return (paste(character,"{",number,"}",sep=""))}; 
RegWhy.matchExactNumberOfStatement=function (regWhyStatement, number){return (paste("(",regWhyStatement,"{",number,"}",sep=""))};
RegWhy.matchNumberOrAboveOfCharacter=function (character, number){return (paste(character,"{",number,",}",sep=""))}; 
RegWhy.matchNumberOrAboveOfStatement=function (regWhyStatement, number){return (paste("(",regWhyStatement,"{",number,",}",sep=""))};
RegWhy.matchNumberRangeOfCharacter=function (character, bottomrange,toprange){return (paste(character,"{",bottomrange,",",toprange,"}",sep=""))}; 
RegWhy.matchNumberRangeOfStatement=function (regWhyStatement, bottomrange,toprange){return (paste("(",regWhyStatement,"{",bottomrange,",",toprange,"}",sep=""))};

#Reg Why Functions
RegWhy.do.detect <- function ( statementToSearch,regWhyStatement){
  return (str_detect(statementToSearch,regWhyStatement))
  
}


literal_statement=RegWhy.statement(
  c(
            RegWhy.literal("Hello"),
            RegWhy.anyCharacter(),
            literal("World")
              )
)
range_statement=RegWhy.matchRange("A","Z")
RegWhy.do.detect("Hello World", literal_statement)
 
