using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace RegWhyClassLibarary
{
    public static class RegWhy
    {
        public static string Literal(string value)
        {
            value = value.Replace(@".", Period);
            value = value.Replace(@"\", BackSlash);
            value = value.Replace(@"|", Bar);
            value = value.Replace(@"(", LeftParenthesis);
            value = value.Replace(@")", RightParenthesis);
            value = value.Replace(@"[", LeftBracket);
            value = value.Replace(@"]", RightBracket);
            value = value.Replace(@"{", LeftBrace);
            value = value.Replace(@"}", RightBrace);
            value = value.Replace(@"$", DollarSign);
            value = value.Replace(@"*", Asterik);
            value = value.Replace(@"?", QuestionMark);
            value = value.Replace(@"<", LeftAngle);
            value = value.Replace(@">", RightAngle);
            value = value.Replace(@"+", PlusSign);
            value = value.Replace(@"^", Caret);
            return value;
        }
        public static string Period = @"\.";
        public static string BackSlash = @"\\";
        public static string Bar = @"\|";
        public static string LeftParenthesis = @"\(";
        public static string RightParenthesis = @"\)";
        public static string NullString = @"\0";
        public static string LeftBracket = @"\[";
        public static string RightBracket = @"\]";
        public static string LeftBrace = @"\{";
        public static string RightBrace = @"\}";
        public static string DollarSign = @"\$";
        public static string Asterik = @"\*";
        public static string QuestionMark = @"\?";
        public static string LeftAngle = @"\<";
        public static string RightAngle = @"\>";
		public static string PlusSign=@"\+";
        public static string Caret = @"\^";
        public static string Tab = @"\t";
        public static string ReturnString = @"\r";
        public static string NewLine = @"\n";
        public static string FormFeed = @"\f";

        public static string Statement(List<string> regWhyStatements)
        {
            var endResult = "";
            foreach (var value in regWhyStatements)
                endResult = endResult + value;
            return endResult;
        }

        

        public static class CharacterType
        {
            public static string AnyCharacter = ".";
            public static string Digit = @"\d";
            public static string NonDigit = @"\D";
            public static string WhiteSpace = @"\s";
            public static string NonWhiteSpace = @"\S";
            public static string WordCharacter = @"\w";
            public static string NonWordCharacter = @"\W";
            public static string WordBounday = @"\b";
            public static string NonWordBoundary = @"\B";
            public static string LowerCaseAsci = @"[a-z]";
            public static string UpperCaseAscii = @"[A-Z]";
            public static string AnyAscii = "[ -~]";
            public static string EndOfFile = "^Z";
            public static string AlphaCharacterRange = "[A-Za-z]";
            public static string AlphaNumericCharacterRange = "[A-Za-z0-9]";
            public static string UpperCaseLetters = "[A-Z]";
            public static string LowerCaseLetters = "[a-z]";

            public static string AlphaNumericCharacterRangePlus(string otherCharacters)
            {
                return "[A-Za-z0-9" + otherCharacters + "]";
            }
            public static string NumericCharacterRangePlus(string otherCharacters)
            {
                return "[0-9" + otherCharacters + "]";
            }
            public static string Unicode(string fourDigitalNumber)
            {
                return @"\\" + fourDigitalNumber;
            }

            public static string Hexidecimal(string twoDigitalCode)
            {
                return @"\\" + "x" + twoDigitalCode;
            }

            public static string CharacterRange(string listOfCharacters)
            {
                return "[" + listOfCharacters + "]";
            }

            public static string NotInCharacterRange(string listOfCharacters)
            {
                return "[^" + listOfCharacters + "]";
            }
        }


        public static class Group
        {
             
            public static string End = ")";
            public static string EndOptional = ")?";
            public static string EndZeroOrMore = ")*";
            public static string EndOneOfMore = ")+";
            public static string SmallestMatch = "?";
            public static string LargestMatch = "";
            public static string EndOptionSmallestMatch = ")??";
            public static string EndZeroOrMoreSmallestMatch = ")*?";
            public static string EndOneOrMoreSmallestMatch = ")+?";
            public static string EndOfNumberedSmallestMatch = "?";
            public static string LastMatch = "$&";
            public static string LastParen = "$+";
            public static string PrecedingMatch = "%`";

            public static string BackReference(int whichReference)
            {
                if (whichReference > 9 || whichReference < 1)
                    throw new Exception("Backreferences must be between 1 and 9");
                return "$" + whichReference;
            }

            public static string MatchOnlyIfThisIsNext(string whatsNext)
            {
                return "(?=" + whatsNext + ")";
            }

            public static string MatchOnlyIfThisIsNotNext(string whatsNext)
            {
                return "(?|" + whatsNext + ")";
            }

            public static string EndExactNumber(int countOfTimes)
            {
                return "){" + countOfTimes + "}";
            }

            public static string EndExactNumberOrAbove(int countOfTimes)
            {
                return "){" + countOfTimes + ",}";
            }

            public static string EndRange(int bottomNumber, int topNumber)
            {
                return "){" + bottomNumber + "," + topNumber + "}";
            }

             
                public static string StartCapturing = @"(";
                public static string StartNonCapturing = @"(?:";

                public static string StartNamed(string nameOfGroup)
                {
                    return "(<" + nameOfGroup + ">";
                }

                public static string StartOptionalCapturingList(List<string> listOfWords)
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

                public static string StartoptionalNonCapturingList(List<string> listOfWords)
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

        public static class Where
        {
            public static string StartOfString = "^";
            public static string EndOfString = "$";
        }

        public static class Count
        {
            public static string Optional = "?";
            public static string ZeroOrMore = "*";
            public static string OneOrMore = "+";

            public static string StringexactNumber(int numberOfDigits)
            {
                return @"{" + numberOfDigits + @"}";
            }

            public static string StringexactNumberOrMore(int numberOfDigits)
            {
                return "{" + numberOfDigits + ",}";
            }

            public static string RangeOfTimes(int bottomNumber, int topNUmber)
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

            public static string ExtractCapturedGroup(string stringToSearch, string valueToFind, int groupToCapture, bool caseInsensitive = false,
                bool multilineMode = false)
            {
                var regexOptions = GetRegexOptions(caseInsensitive, multilineMode);
                var match = (regexOptions == null) ?
                    Regex.Match(stringToSearch, valueToFind) :
                    Regex.Match(stringToSearch, valueToFind, (RegexOptions)regexOptions);
                return match.Groups[groupToCapture].Value;
            }
            public static int LocateFirst(string stringToSearch, string valueToFind, bool caseInsensitive = false,
                bool multilineMode = false)
            {
                var regexOptions = GetRegexOptions(caseInsensitive, multilineMode);
                var pattern = GetRegexOptions(caseInsensitive, multilineMode);
                var match = (regexOptions == null) ?
                    Regex.Match(stringToSearch, valueToFind) :
                    Regex.Match(stringToSearch, valueToFind, (RegexOptions)regexOptions);
                return match.Index;
                 
            }
            public static List<int> LocateAll(string stringToSearch, string valueToFind, bool caseInsensitive = false,
                bool multilineMode = false)
            {
                var resultList = new List<int>();
                var regexOptions = GetRegexOptions(caseInsensitive, multilineMode);
                 
                var matchList = (regexOptions == null) ?
                    Regex.Matches(stringToSearch, valueToFind) :
                    Regex.Matches(stringToSearch, valueToFind, (RegexOptions)regexOptions);
                foreach (Match match in matchList)
                {
                    resultList.Add(match.Index);
                }
                return resultList;
            }

            public static string ReplaceFirst(string stringToSearch, string valueToFind,string valueToReplace, bool caseInsensitive = false,
                bool multilineMode = false)
            {

                var regExOptions = GetRegexOptions(caseInsensitive, multilineMode);
                var regex = RegWhy.Do.SetRegExForDoFunction(valueToFind, caseInsensitive, multilineMode);
                var result = regex.Replace(stringToSearch, valueToReplace,1);
                return result;
            }
            public static string ReplaceAll(string stringToSearch, string valueToFind, string valueToReplace, bool caseInsensitive = false,
                bool multilineMode = false)
            {
                var regExOptions = GetRegexOptions(caseInsensitive, multilineMode);
                var result = 
                    (regExOptions==null)?
                    Regex.Replace(stringToSearch, valueToFind, valueToReplace ):
                            Regex.Replace(stringToSearch, valueToFind, valueToReplace, (RegexOptions)regExOptions);
                return result;
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