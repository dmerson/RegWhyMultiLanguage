#!/usr/bin/env python

class RegWhy:
    period="\."
    backSlash="\\"
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
    def Statement(listOfRegWhy):
            final_string=""
            for str in listOfRegWhy:
                final_string +=str
            return final_string
    @staticmethod
    def Literal(value):
            return value
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





if __name__ == '__main__':
    print(RegWhy.asterik)
    print(RegWhy.CharacterType.anyCharacter)
    print(RegWhy.Group.end)
    print(RegWhy.Statement([
        RegWhy.Group.startCapturing,
        RegWhy.Literal("and"),
        RegWhy.orMarker,
        RegWhy.Literal("or"),
        RegWhy.Group.end,
        RegWhy.CharacterType.anyCharacter,
        RegWhy.CharacterType.unicode("1234"),
        RegWhy.Count.exactNumber(3)
    ]))
