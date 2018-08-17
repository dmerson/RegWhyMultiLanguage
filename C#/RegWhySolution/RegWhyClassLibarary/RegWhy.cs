using System;
using System.Collections.Generic;

namespace RegWhyClassLibarary
{
    public static class RegWhy
    {
        public static string period = @"\.";
        public static string backSlash = @"\\";
        public static string bar = @"\|";
        public static string leftParenthesis = @"\(";
        public static string rightParenthesis = @"\)";
        public static string nullString = @"\0";
        public static string leftBracket = @"\[";
        public static string rightBracket = @"\]";
        public static string leftBrace = @"\{";
        public static string rightBrace = @"\}";
        public static string dollarSign = @"\$";
        public static string asterik = @"\*";
        public static string questionMark = @"\?";
        public static string leftAngle = @"\<";
        public static string rightAngle = @"\>";
        public static string caret = @"\^";
        public static string tab = @"\t";
        public static string returnString = @"\r";
        public static string newLine = @"\n";
        public static string formFeed = @"\f";

        public static string Statement(List<string> regWhyStatements)
        {
            var endResult = "";
            foreach (var value in regWhyStatements)
                endResult = endResult + value;
            return endResult;
        }

        public static string Literal(string value)
        {
            return value;
        }

        public static class CharacterType
        {
            public static string anyCharacter = ".";
            public static string digit = @"\d";
            public static string nonDigit = @"\D";
            public static string whiteSpace = @"\s";
            public static string nonWhiteSpace = @"\S";
            public static string wordCharacter = @"\w";
            public static string nonWordCharacter = @"\W";
            public static string wordBounday = @"\b";
            public static string nonWordBoundary = @"\B";
            public static string lowerCaseASCI = @"[a-z]";
            public static string upperCaseASCII = @"[A-Z]";
            public static string anyASCII = "[ -~]";
            public static string endOfFile = "^Z";

            public static string unicode(string fourDigitalNumber)
            {
                return @"\\" + fourDigitalNumber;
            }

            public static string hexidecimal(string twoDigitalCode)
            {
                return @"\\" + "x" + twoDigitalCode;
            }

            public static string characterRange(string listOfCharacters)
            {
                return "[" + listOfCharacters + "]";
            }

            public static string notInCharacterRange(string listOfCharacters)
            {
                return "[^" + listOfCharacters + "]";
            }
        }


        public static class Group
        {
            public static string or = "|";
            public static string end = ")";
            public static string endOptional = ")?";
            public static string endZeroOrMore = ")*";
            public static string endOneOfMore = ")+";
            public static string smallestMatch = "?";
            public static string largestMatch = "";
            public static string endOptionSmallestMatch = ")??";
            public static string endZeroOrMoreSmallestMatch = ")*?";
            public static string endOneOrMoreSmallestMatch = ")+?";
            public static string endOfNumberedSmallestMatch = "?";
            public static string lastMatch = "$&";
            public static string lastParen = "$+";
            public static string precedingMatch = "%`";

            public static string backReference(int whichReference)
            {
                if (whichReference > 9 || whichReference < 1)
                    throw new Exception("Backreferences must be between 1 and 9");
                return "$" + whichReference;
            }

            public static string matchOnlyIfThisIsNext(string whatsNext)
            {
                return "(?=" + whatsNext;
            }

            public static string matchOnlyIfThisIsNotNext(string whatsNext)
            {
                return "(?|" + whatsNext;
            }

            public static string endExactNumber(int countOfTimes)
            {
                return "){" + countOfTimes + "}";
            }

            public static string endExactNumberOrAbove(int countOfTimes)
            {
                return "){" + countOfTimes + ",}";
            }

            public static string endRange(int bottomNumber, int topNumber)
            {
                return "){" + bottomNumber + "," + topNumber + "}";
            }


            public static class Start
            {
                public static string capturing = @"(";
                public static string nonCapturing = @"(?:";

                public static string named(string nameOfGroup)
                {
                    return "(<" + nameOfGroup + ">";
                }

                public static string optionalCapturingList(List<string> listOfWords)
                {
                    var finalStatement = @"(";
                    foreach (var statement in listOfWords)
                    {
                        if (finalStatement.Length > 1)
                            finalStatement = finalStatement + "|";
                        finalStatement = finalStatement + statement;
                    }
                    return finalStatement;
                }

                public static string optionalNonCapturingList(List<string> listOfWords)
                {
                    var finalStatement = @"(?:";
                    foreach (var statement in listOfWords)
                    {
                        if (finalStatement.Length > 2)
                            finalStatement = finalStatement + "|";
                        finalStatement = finalStatement + statement;
                    }
                    return finalStatement;
                }
            }
        }

        public static class Where
        {
            public static string startOfString = "^";
            public static string endOfString = "$";
        }

        public static class Count
        {
            public static string optional = "?";
            public static string zeroOrMore = "*";
            public static string oneOrMore = "+";

            public static string stringexactNumber(int numberOfDigits)
            {
                return @"{" + numberOfDigits + @"}";
            }

            public static string stringexactNumberOrMore(int numberOfDigits)
            {
                return "{" + numberOfDigits + ",}";
            }

            public static string rangeOfTimes(int bottomNumber, int topNUmber)
            {
                return "{" + bottomNumber + "," + topNUmber + "}";
            }
        }

        public static class Do
        {
        }
    }
}