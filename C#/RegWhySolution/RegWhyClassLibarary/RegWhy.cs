using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace RegWhyClassLibarary
{
    public static class RegWhy
    {
        public static string Literal(string value)
        {
            value = value.Replace(@".", period);
            value = value.Replace(@"\", backSlash);
            value = value.Replace(@"|", bar);
            value = value.Replace(@"(", leftParenthesis);
            value = value.Replace(@")", rightParenthesis);
            value = value.Replace(@"[", leftBracket);
            value = value.Replace(@"]", rightBracket);
            value = value.Replace(@"{", leftBrace);
            value = value.Replace(@"}", rightBrace);
            value = value.Replace(@"$", dollarSign);
            value = value.Replace(@"*", asterik);
            value = value.Replace(@"?", questionMark);
            value = value.Replace(@"<", leftAngle);
            value = value.Replace(@">", rightAngle);
            value = value.Replace(@"+", plusSign);
            value = value.Replace(@"^", caret);
            return value;
        }
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
		public static string plusSign=@"\+";
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
            private static Regex SetRegExForDoFunction(string valueToFind, bool caseInsensitive, bool multiLineMode)
            {
                var options = GetRegexOptions(caseInsensitive, multiLineMode);

                var pattern = options != null ? new Regex(valueToFind, (RegexOptions)options) : new Regex(valueToFind);
                return pattern;
            }
            private static RegexOptions? GetRegexOptions(bool caseInsensitve, bool matchInMultipleLines)
            {
                if (caseInsensitve && !matchInMultipleLines)
                {
                    return RegexOptions.IgnoreCase;
                }
                if (caseInsensitve && matchInMultipleLines)
                {
                    return RegexOptions.IgnoreCase|RegexOptions.Multiline;
                }
                if (!caseInsensitve && matchInMultipleLines)
                {
                    return RegexOptions.Multiline;
                    
                }
                return null;
            }
            public static bool Detect(string stringToSearch, string valueToFind, bool caseInsensitive=false, bool multiLineMode=false)
            {
                var pattern = SetRegExForDoFunction(valueToFind, caseInsensitive, multiLineMode);
                return pattern.IsMatch(stringToSearch);
            }

           

            public static bool Detect(string stringToSearch, string valueToFind, RegexOptions options)
            {
                var pattern = new Regex(valueToFind,options );
                return pattern.IsMatch(stringToSearch);
                
            }

            public static string ExtractFirst(string stringToSearch, string valueToFind, bool caseInsensitive = false,
                bool multilineMode = false)
            {
                var regexOptions = GetRegexOptions(caseInsensitive, multilineMode);
                var match =(regexOptions==null)? 
                    Regex.Match(stringToSearch, valueToFind):
                    Regex.Match(stringToSearch,valueToFind,(RegexOptions)regexOptions);
                return match.Value;
            }
            public static List<string> ExtractAll(string stringToSearch, string valueToFind, bool caseInsensitive = false,
                bool multilineMode = false)
            {
                
                var resultList=new List<string>();
                var regexOptions = GetRegexOptions(caseInsensitive, multilineMode);
                var matchList = (regexOptions == null) ?
                    Regex.Matches(stringToSearch, valueToFind) :
                    Regex.Matches(stringToSearch, valueToFind, (RegexOptions)regexOptions);
                foreach (Match match in matchList)
                {
                    resultList.Add(match.Value);
                }
                return resultList;
            }

            public static List<string> ExtractCapturedGroup(string stringToSearch, string valueToFind, int GroupToCapture, bool caseInsensitive = false,
                bool multilineMode = false)
            {
                var pattern = GetRegexOptions(caseInsensitive, multilineMode);
                var resultList = new List<string>();
                return resultList;
            }
            public static int LocateFirst(string stringToSearch, string valueToFind, bool caseInsensitive = false,
                bool multilineMode = false)
            {
                var pattern = GetRegexOptions(caseInsensitive, multilineMode);
                return -1;
            }
            public static List<int> LocateAll(string stringToSearch, string valueToFind, bool caseInsensitive = false,
                bool multilineMode = false)
            {
                var pattern = GetRegexOptions(caseInsensitive, multilineMode);
                var resultList=new List<int>();
                return resultList ;
            }

            public static string ReplaceFirst(string stringToSearch, string valueToFind, bool caseInsensitive = false,
                bool multilineMode = false)
            {
                var pattern = GetRegexOptions(caseInsensitive, multilineMode);
                return "";
            }
            public static List<string> ReplaceAll(string stringToSearch, string valueToFind, bool caseInsensitive = false,
                bool multilineMode = false)
            {
                var pattern = GetRegexOptions(caseInsensitive, multilineMode);
                var resultList = new List<string>();
                return resultList;
            }
            public static List<string> SplitList(string stringToSearch, string valueToFind, bool caseInsensitive = false,
                bool multilineMode = false)
            {
                var resultList = new List<string>();
                var regexOptions = GetRegexOptions(caseInsensitive, multilineMode);
                var matchList = (regexOptions == null) ?
                    Regex.Split(stringToSearch, valueToFind) :
                    Regex.Split(stringToSearch, valueToFind, (RegexOptions)regexOptions);
                foreach (var match in matchList)
                {
                    resultList.Add(match);
                }
                return resultList;
                 
            }
        }

    }
}