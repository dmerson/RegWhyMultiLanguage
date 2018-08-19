#!/usr/bin/env python
import re
class RegWhy:
    period="\."
    backSlash="\\\\"
    bar ="\|"
    leftParenthesis="\("
    rightParenthesis="\)"
    nullString="\0"
    leftBracket="\["
    rightBracket="\]"
    leftBrace="\{"
    rightBrace="\}"
    dollarSign="\$"
    asterik="\*"
    questionMark="\?"
    leftAngle="\<"
    rightAngle="\>"
    caret="\^"
    plusSign="+"
    tab="\t"
    returnString="\r"
    newLine="\n"
    formFeed="\f"
    orMarker="|"
    def __init__(self):
        self.CharacterType = self.CharacterType()
        self.Group = self.Group()
        self.Where=self.Where()
        self.Count=self.Count()

    @staticmethod
    def Literal(value):
        finalValue=value
        finalValue=finalValue.replace("." , RegWhy.period)
        finalValue=finalValue.replace("\\",RegWhy.backSlash)
        finalValue=finalValue.replace("|",RegWhy.bar)
        finalValue=finalValue.replace("(",RegWhy.leftParenthesis)
        finalValue=finalValue.replace(")",RegWhy.rightParenthesis)
        finalValue=finalValue.replace("[",RegWhy.leftBracket)
        finalValue=finalValue.replace("]",RegWhy.rightBracket)
        finalValue=finalValue.replace("{",RegWhy.leftBrace)
        finalValue=finalValue.replace("}",RegWhy.rightBrace)
        finalValue=finalValue.replace("$",RegWhy.dollarSign)
        finalValue=finalValue.replace("*",RegWhy.asterik)
        finalValue=finalValue.replace("?",RegWhy.questionMark)
        finalValue=finalValue.replace("<",RegWhy.leftAngle)
        finalValue=finalValue.replace(">",RegWhy.rightAngle)
        finalValue=finalValue.replace("^",RegWhy.caret)
        finalValue=finalValue.replace("+",RegWhy.plusSign)
        return finalValue
    @staticmethod
    def Statement(listOfRegWhy):
            final_string=""
            for str in listOfRegWhy:
                final_string +=str
            return final_string
    
    class CharacterType:
        anyCharacter="."
        digit ="\d"
        nonDigit="\D"
        whiteSpace="\s"
        nonWhiteSpace="\S"
        wordCharacter="\w"
        nonWordCharacter="\W"
        wordBounday="\b"
        nonWordBoundary="\B"
        lowerCaseASCI="[a-z]"
        upperCaseASCII="[A-Z]"
        anyASCII='[ -~]'
        endOfFile="^Z"
        @staticmethod
        def unicode(fourDigitUniCodeNumber):
            unicodeString ="\\u" + fourDigitUniCodeNumber
            return (unicodeString)

        @staticmethod
        def hexidecimal(twoDigitNumberCode):
            return ("\\" +"x" + twoDigitNumberCode)

        @staticmethod
        def characterRange(listOfCharacters):
            return "[" + listOfCharacters + "]"

        @staticmethod
        def notInCharacterRange(listOfCharacters):
            return "[^" + listOfCharacters + "]"

        def __init__(self):
            pass
    class Group:
        startCapturing="("
        startNonCapturing="(:"  
        end=")"
        endOptional=")?"
        endZeroOrMore=")*"
        endOneOfMore=")+"
        smallestMatch="?"
        largestMatch=""
        endOptionSmallestMatch=")??"
        endZeroOrMoreSmallestMatch=")*?"
        endOneOrMoreSmallestMatch=")+?"
        endOfNumberedSmallestMatch="?"
        lastMatch="$&"
        lastParen="$+"
        precedingMatch ="%`"
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
        startOfString="^"
        endOfString="$"
        def __init__(self):
            pass
    class Count:
        optional="?"
        zeroOrMore="*"
        oneOrMore="+"

        @staticmethod
        def exactNumber(numberOfDigits):
            return "{" + str(numberOfDigits) + "}"
        
        @staticmethod
        def exactNumberOrMore(numberOfDigits):
            return "{" + str(numberOfDigits) + ",}"

        @staticmethod
        def rangeOfTimes(bottomNumber,topNumber):
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
    print(RegWhy.asterik)
    print(RegWhy.CharacterType.anyCharacter)
    print(RegWhy.Group.end)
    print(RegWhy.Statement([
        RegWhy.Group.startCapturing,
        RegWhy.Literal("\\?+."),
        RegWhy.orMarker,
        RegWhy.Literal("or"),
        RegWhy.Group.end,
        RegWhy.CharacterType.anyCharacter,
        RegWhy.CharacterType.unicode("1234"),
        RegWhy.Count.exactNumber(3)
    ]))
    print(RegWhy.Do.Detect("test","T",True))
    print(RegWhy.Do.ExtractFirst("test","t"))
    print(RegWhy.Do.ExtractAll("test", "t"))
    print(RegWhy.Do.LocateAll("test", "t"))
    print(RegWhy.Do.ReplaceFirst("test", "t", "q"))
    print(RegWhy.Do.ReplaceAll("test", "t","q"))
    print(RegWhy.Do.SplitList("tester", "t"))
