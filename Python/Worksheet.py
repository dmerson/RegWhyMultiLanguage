#!/usr/bin/env python
import re
class RegWhy:
    Period="\."
    BackSlash="\\\\"
    Bar ="\|"
    LeftParenthesis="\("
    RightParenthesis= "\)"
    NullString="\0"
    LeftBracket="\["
    RightBracket="\]"
    LeftBrace="\{"
    RightBrace="\}"
    DollarSign="\$"
    Asterik="\*"
    QuestionMark="\?"
    LeftAngle="\<"
    RightAngle="\>"
    Caret="\^"
    PlusSign="+"
    Tab="\t"
    ReturnString="\r"
    NewLine="\n"
    FormFeed="\f"
    OrMarker="|"
    def __init__(self):
        self.CharacterType = self.CharacterType()
        self.Group = self.Group()
        self.Where=self.Where()
        self.Count=self.Count()

    @staticmethod
    def Literal(value):
        finalValue=value
        finalValue=finalValue.replace("\\",RegWhy.BackSlash)
        finalValue=finalValue.replace("." , RegWhy.Period)
        finalValue=finalValue.replace("|",RegWhy.Bar)
        finalValue=finalValue.replace("(",RegWhy.LeftParenthesis)
        finalValue=finalValue.replace(")",RegWhy.RightParenthesis)
        finalValue=finalValue.replace("[",RegWhy.LeftBracket)
        finalValue=finalValue.replace("]",RegWhy.RightBracket)
        finalValue=finalValue.replace("{",RegWhy.LeftBrace)
        finalValue=finalValue.replace("}",RegWhy.RightBrace)
        finalValue=finalValue.replace("$",RegWhy.DollarSign)
        finalValue=finalValue.replace("*",RegWhy.Asterik)
        finalValue=finalValue.replace("?",RegWhy.QuestionMark)
        finalValue=finalValue.replace("<",RegWhy.LeftAngle)
        finalValue=finalValue.replace(">",RegWhy.RightAngle)
        finalValue=finalValue.replace("^",RegWhy.Caret)
        finalValue=finalValue.replace("+",RegWhy.PlusSign)
        return finalValue
    @staticmethod
    def Statement(listOfRegWhy):
            final_string=""
            for str in listOfRegWhy:
                final_string +=str
            return final_string
    
    class CharacterType:
        AnyCharacter="."
        Digit ="\d"
        NonDigit="\D"
        WhiteSpace="\s"
        NonWhiteSpace="\S"
        WordCharacter="\w"
        NonWordCharacter="\W"
        WordBounday="\b"
        NonWordBoundary="\B"
        LowerCaseASCI="[a-z]"
        UpperCaseASCII="[A-Z]"
        AnyASCII='[ -~]'
        EndOfFile="^Z"
        @staticmethod
        def Unicode(fourDigitUniCodeNumber):
            unicodeString ="\\u" + fourDigitUniCodeNumber
            return (unicodeString)

        @staticmethod
        def Hexidecimal(twoDigitNumberCode):
            return ("\\" +"x" + twoDigitNumberCode)

        @staticmethod
        def CharacterRange(listOfCharacters):
            return "[" + listOfCharacters + "]"

        @staticmethod
        def NotInCharacterRange(listOfCharacters):
            return "[^" + listOfCharacters + "]"

        def __init__(self):
            pass
    class Group:
        StartCapturing="("
        StartNonCapturing="(:"
        End=")"
        EndOptional=")?"
        EndZeroOrMore=")*"
        EndOneOfMore=")+"
        SmallestMatch="?"
        LargestMatch=""
        EndOptionSmallestMatch=")??"
        EndZeroOrMoreSmallestMatch=")*?"
        EndOneOrMoreSmallestMatch=")+?"
        EndOfNumberedSmallestMatch="?"
        LastMatch="$&"
        LastParen="$+"
        PrecedingMatch ="%`"
        @staticmethod
        def StartNamedGroup(nameOfGroup):
            return "(<" + nameOfGroup + ">" 
        
        @staticmethod
        def BackReference(whichReference):
            if (whichReference > 9 or whichReference < 1):
                raise Exception("You must have a number between 1 and 9")
            return "$" + whichReference
        
        @staticmethod
        def MatchOnlyIfThisIsNext(whatsNext):
            return "(?=" + whatsNext

        @staticmethod
        def MatchOnlyIfThisIsNotNext(whatsNext):
            return "(?|" + whatsNext

        @staticmethod
        def EndExactNumbe(countOfTimes):
            return "){" + countOfTimes + "}"

        @staticmethod
        def EndExactNumberOfAbove(countOfTimes):
            return "){" + countOfTimes + ",}"

        @staticmethod
        def EndRangeOfTimes(bottomNumber:int,topNumber):
            return "){" + bottomNumber + "," + topNumber +  "}"

        @staticmethod
        def List(listOfItems:list, doCapture:bool):
            finalString="("
            firstitem=True
            if (doCapture):
                finalString=finalString + "?:"
            for item in listOfItems:
                if (firstitem):
                    firstitem=False
                    finalString=finalString + item
                else:
                    finalString ="|" + item
                finalString=finalString + item
            finalString =finalString + ")"
            return finalString
         

        def __init__(self):
            pass

    class Where:
        StartOfString="^"
        EndOfString="$"
        def __init__(self):
            pass
    class Count:
        Optional="?"
        ZeroOrMore="*"
        OneOrMore="+"

        @staticmethod
        def ExactNumber(numberOfDigits):
            return "{" + str(numberOfDigits) + "}"
        
        @staticmethod
        def ExactNumberOrMore(numberOfDigits):
            return "{" + str(numberOfDigits) + ",}"

        @staticmethod
        def RangeOfTimes(bottomNumber,topNumber):
            return "{" + str(bottomNumber) + "," + str(topNumber) + "}"
        
        def __init__(self):
            pass
    class Do:
        def __init__(self):
            pass

        @staticmethod
        def Detect(stringToSearch, valueToFind, caseInsensitive=False, multilineMatching=False):
            regEx = RegWhy.Do.SetRegEx(caseInsensitive, multilineMatching, valueToFind)
            match =regEx.search(stringToSearch)
            if match:
                return True
            else:
                return False

        @staticmethod
        def SetRegEx(caseInsensitive, multilineMatching, valueToFind):
            flags = 0
            if multilineMatching:
                flags = re.MULTILINE
            if caseInsensitive:
                flags |= re.IGNORECASE
            regEx = re.compile(valueToFind, flags)
            return regEx

        @staticmethod
        def ExtractFirst(stringToSearch, valueToFind, caseInsensitive=False, multilineMatching=False):
            regEx = RegWhy.Do.SetRegEx(caseInsensitive, multilineMatching, valueToFind)
            found = regEx.search(stringToSearch)

            return found.group()
        
        @staticmethod
        def ExtractAll(stringToSearch, valueToFind, caseInsensitive=False, multilineMatching=False):
            regEx = RegWhy.Do.SetRegEx(caseInsensitive, multilineMatching, valueToFind)
            found = regEx.findall(stringToSearch)

            return found

        @staticmethod
        def ExtractGroup(stringToSearch, valueToFind,groupNumber:int, caseInsensitive=False, multilineMatching=False):
            regEx = RegWhy.Do.SetRegEx(caseInsensitive, multilineMatching, valueToFind)
            found = regEx.search(stringToSearch)

            return found.group(groupNumber)

        @staticmethod
        def LocateFirst(stringToSearch, valueToFind, caseInsensitive=False, multilineMatching=False):
            regEx = RegWhy.Do.SetRegEx(caseInsensitive, multilineMatching, valueToFind)
            found = regEx.search(stringToSearch)
            return found.start()


        @staticmethod
        def LocateAll(stringToSearch, valueToFind, caseInsensitive=False, multilineMatching=False):
            regEx = RegWhy.Do.SetRegEx(caseInsensitive, multilineMatching, valueToFind)
            found = [m.start(0) for m in regEx.finditer(stringToSearch)]

            return found

        @staticmethod
        def ReplaceFirst(stringToSearch, valueToFind, valueToReplace, caseInsensitive=False, multilineMatching=False):
            regEx = RegWhy.Do.SetRegEx(caseInsensitive, multilineMatching, valueToFind)
            return regEx.sub(valueToReplace, stringToSearch,1)


        @staticmethod
        def ReplaceAll(stringToSearch, valueToFind,valueToReplace, caseInsensitive=False, multilineMatching=False):
            regEx = RegWhy.Do.SetRegEx(caseInsensitive, multilineMatching, valueToFind)
            return regEx.sub(valueToReplace,stringToSearch)

        @staticmethod
        def SplitList(stringToSearch, valueToSplitWith, caseInsensitive=False, multilineMatching=False):
            regEx = RegWhy.Do.SetRegEx(caseInsensitive, multilineMatching, valueToSplitWith)
            return re.split(regEx,stringToSearch)






if __name__ == '__main__':

    print(RegWhy.Statement([
        RegWhy.Group.StartCapturing,
        RegWhy.Literal("\\?+."),
        RegWhy.OrMarker,
        RegWhy.Literal("or"),
        RegWhy.Group.End,
        RegWhy.CharacterType.AnyCharacter,
        RegWhy.CharacterType.Unicode("1234"),
        RegWhy.Count.ExactNumber(3)
    ]))
    print(RegWhy.Do.Detect("test","T",True))
    print(RegWhy.Do.ExtractFirst("test","t"))
    print(RegWhy.Do.ExtractAll("test", "t"))
    print(RegWhy.Do.LocateAll("test", "t"))
    print(RegWhy.Do.ReplaceFirst("test", "t", "q"))
    print(RegWhy.Do.ReplaceAll("test", "t","q"))
    print(RegWhy.Do.SplitList("tester", "t"))
