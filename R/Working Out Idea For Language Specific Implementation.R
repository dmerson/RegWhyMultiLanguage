RegWhy.literal <- function(valueToSearch){
  return (valueToSearch);
}
RegWhy.statement <- function (arrayOfRegWhy){
  paste(arrayOfRegWhy,collapse ="")
}
RegWhy.hasValue <- function (regWhyStatement, statementToSearch){
  return (grep(regWhyStatement,statementToSearch)==1)
  
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
RegWhy.anyCharacter=function (){return (".")};


literal_statement=RegWhy.statement(
  c(
            RegWhy.literal("Hello"),
            RegWhy.anyCharacter(),
            literal("World")
              )
)
range_statement=RegWhy.matchRange("A","Z")
literal_statement                   
RegWhy.hasValue( literal_statement, "Hello World")
RegWhy.hasValue("hello",literal_statement)
RegWhy.hasValue(range_statement,"caLm")
 
