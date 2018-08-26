library(stringr)


RegWhy.Statement <- function (arrayOfRegWhy){
  paste(arrayOfRegWhy,collapse ="", sep="")
}
# Special Characters

RegWhy.Period ="\\."
RegWhy.Backslash ="\\"
RegWhy.Bar="\\|"
RegWhy.LeftParenthesis ="\\("
RegWhy.RightParenthesis ="\\)"
RegWhy.LeftBracket ="\\["
RegWhy.RightBracket ="]"
RegWhy.LeftBrace ="\\{"
RegWhy.RightBrace ="\\}"
RegWhy.DollarSign ="\\$"
RegWhy.Asterisk = "\\*"
RegWhy.PlusSign ="\\+"
RegWhy.QuestionMark ="\\?"
RegWhy.LeftAngle ="\\<"
RegWhy.RightAngle ="\\>"
RegWhy.Caret ="\\^"
RegWhy.Tab ="\t"
RegWhy.Return ="\r";
RegWhy.NewLine ="\n"
RegWhy.OrMarker="|"
#Section parts

RegWhy.Literal <- function(valueToSearch){
  valueToSearch=str_replace_all(valueToSearch,"\\\\", "\\\\\\")
  valueToSearch =str_replace_all(valueToSearch,"\\.","\\\\.")
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



RegWhy.CharacterType.AnyCharacter=".";
RegWhy.CharacterType.Digit ="\\d";
RegWhy.CharacterType.NonDigit ="\\D"
RegWhy.CharacterType.Whitespace ="\\s"
RegWhy.CharacterType.NonWhiteSpace ="\\S"
RegWhy.CharacterType.WordCharacter ="\\w"
RegWhy.CharacterType.NonWordCharacter ="\\W"
RegWhy.CharacterType.WordBoundary ="\\b"
RegWhy.CharacterType.NonWordBoundary ="\\B"
RegWhy.CharacterType.HorizontalSpace="\\h"
RegWhy.CharacterType.NonHorizontalSpace="\\H"
RegWhy.CharacterType.VerticalSpace="\\v"
RegWhy.CharacterType.NonVerticalSpace="\\V"
RegWhy.CharacterType.LowerCaseLetters="[a-z]"
RegWhy.CharacterType.UpperCaseLetters="[A-Z]"
RegWhy.CharacterType.alphaNumericCharacterRange="[A-Za-z0-9]"
RegWhy.CharacterType.AlphaNumericCharacterRangePlus=function (otherCharacters){return (paste("[A-Za-z0-9]",
                                                                              otherCharacters,sep=""))};
RegWhy.CharacterType.AlphaNumeric="[[:alnum:]]"
RegWhy.CharacterType.ControlCharacter="[[:control:]]";
RegWhy.CharacterType.Punctuation="[[:alnum:]]";
RegWhy.CharacterType.Hexadecial="[[:xdigit:]]";
RegWhy.CharacterType.Space="[[:space:]]"; #tab, newline, vertical tab, form feed,carriage return, and space
RegWhy.CharacterType.Printable="[[:print:]]"; #alpha punct and space
RegWhy.CharacterType.Graphical="[[:graph:]]"; #alpha punct and space
RegWhy.CharacterType.BlankSpace="[[:blank:]]"; #space and tab
RegWhy.CharacterType.CharacterRange=function (listOfCharacters){return (paste("[",listOfCharacters,"]", sep=""))};
RegWhy.CharacterType.NotInCharacterRange=function (listOfCharacters){return (paste("[^",listOfCharacters,"]", sep=""))};


RegWhy.Unicode=function (unicodeNumber){return (paste("\\x{",unicodeNumber, "}",sep=""))};

RegWhy.Group.StartCapturing="("
RegWhy.Group.StartNonCapturing="(?:"
RegWhy.Group.StartNamed=function(nameOfGroup){return (paste("(?<",nameOfGroup,">", sep=""))};
RegWhy.Group.End=")"
RegWhy.Group.EndOptional=")?"
RegWhy.Group.EndZeroOrMore=")*"
RegWhy.Group.EndOneOrMore=")+"
RegWhy.Group.EndOptionSmallestMatch=")??"
RegWhy.Group.EndOptionZeroOrMoreSmallestMatch=")*?"
RegWhy.Group.EndOptionOneOrMoreSmallestMatch=")+?"
RegWhy.Group.EndOfSmallestMatch="?"
RegWhy.Group.LastMatch="$&"
RegWhy.Group.LastParen="$+"
RegWhy.Group.PrecedingMatch="%`"
RegWhy.Group.BackReference=function(number){return (paste("$",number,sep=""))}
RegWhy.Group.MatchOnlyIfThisIsNext=function(whatsNext){return (paste("(?=",number,")",sep=""))}
RegWhy.Group.MatchOnlyIfThisIsNotNext=function(whatsNext){return (paste("(?|",number,")",sep=""))}

RegWhy.Group.EndExactNumber=function(number){return (paste("){",number,"}",sep=""))}
RegWhy.Group.EndEexactNumberOrAbove=function(number){return (paste("){",number,",}",sep=""))}
RegWhy.Group.EndRange=function(bottomNumber, topNumber){return (paste("){",bottomNumber,",",topNumber,"}",sep=""))}

#Quantifiers 
RegWhy.Count.Optional="?"
RegWhy.Count.ZeroOrMore="*"
RegWhy.Count.OneOrMore="+"
RegWhy.Count.ExactNumber=function (number){return (paste("{",number,"}",sep=""))};
RegWhy.Count.ExactNumberOrMore=function (number){return (paste("{",number,",}",sep=""))};
RegWhy.Count.RangeOfTimes=function (bottomNumber,topNumber){return (paste("{",bottomNumber,",",topNumber,"}",sep=""))};

RegWhy.Where.StartOfString="^"
RegWhy.Where.EndOfString="$"
 

#Reg Why Do Functions
RegWhy.Do.Detect <- function ( statementToSearch,regWhyStatement){
  return (str_detect(statementToSearch,regWhyStatement))
  
}


RegWhy.Do.Extract <- function ( statementToSearch,regWhyStatement){
  return (str_extract(statementToSearch,regWhyStatement))
  
}
RegWhy.Do.ExtractAll <- function ( statementToSearch,regWhyStatement){
  return (str_extract_all(statementToSearch,regWhyStatement))
  
}

 
RegWhy.Do.ExtractCapturedGroup <- function ( statementToSearch,regWhyStatement, groupNumber){
   
  return (str_match(statementToSearch,regWhyStatement)[1, groupNumber + 1])
  
}
 
RegWhy.Do.Locate <- function ( statementToSearch,regWhyStatement){
  return (str_locate(statementToSearch,regWhyStatement))
  
}
RegWhy.Do.LocateAll <- function ( statementToSearch,regWhyStatement){
  return (str_locate_all(statementToSearch,regWhyStatement))
  
}
RegWhy.Do.ReplaceFirst <- function ( statementToSearch,regWhyStatement, regWhyStatementReplacement){
  return (str_replace(statementToSearch,regWhyStatement))
  
}
RegWhy.Do.ReplaceAll <- function ( statementToSearch,regWhyStatement, regWhyStatementReplacement){
  return (str_replace_all(statementToSearch,regWhyStatement, regWhyStatementReplacement))
  
}
RegWhy.Do.SplitList <- function ( listOfStrings,regWhyStatement){
  return (str_split(statementToSearch,regWhyStatement ))
  
}

 
 
