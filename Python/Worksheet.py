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
    def __init__(self):
        self.CharacterType = self.CharacterType()
        self.Group = self.Group()
        self.Where=self.Where()
        self.Count=self.Count()

    def Statement(self,listOfRegWhy):
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
        def __init__(self):
            pass
    class Group:
        def __init__(self):
            pass
    class Where:
        def __init__(self):
            pass
    class Count:
        def __init__(self):
            pass
    class Do:
        def __init__(self):
            pass





if __name__ == '__main__':
    print(RegWhy.asterik)
    print(RegWhy.CharacterType.anyCharacter)
