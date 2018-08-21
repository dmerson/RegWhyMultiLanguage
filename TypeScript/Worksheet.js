var RegWhy = /** @class */ (function () {
    function RegWhy() {
    }
    RegWhy.AlphaNumericCharacterRangePlus = function (otherCharacters) {
        return "[A-Za-z0-9" + otherCharacters + "]";
    };
    RegWhy.NumericCharacterRangePlus = function (otherCharacters) {
        return "[0-9" + otherCharacters + "]";
    };
    RegWhy.Unicode = function (fourDigitalNumber) {
        return "\\\\" + fourDigitalNumber;
    };
    RegWhy.Hexidecimal = function (twoDigitalCode) {
        return "\\\\" + "x" + twoDigitalCode;
    };
    RegWhy.CharacterRange = function (listOfCharacters) {
        return "[" + listOfCharacters + "]";
    };
    RegWhy.NotInCharacterRange = function (listOfCharacters) {
        return "[^" + listOfCharacters + "]";
    };
    RegWhy.Statement = function (listOfStatements) {
        var finalStatement = "";
        for (var _i = 0, listOfStatements_1 = listOfStatements; _i < listOfStatements_1.length; _i++) {
            var statement = listOfStatements_1[_i];
            finalStatement = finalStatement + statement;
        }
        return finalStatement;
    };
    RegWhy.Literal = function (value) {
        value = value.replace(".", RegWhy.Period);
        value = value.replace("\\", RegWhy.BackSlash);
        value = value.replace("|", RegWhy.Bar);
        value = value.replace("(", RegWhy.LeftParenthesis);
        value = value.replace(")", RegWhy.RightParenthesis);
        value = value.replace("[", RegWhy.LeftBracket);
        value = value.replace("]", RegWhy.RightBracket);
        value = value.replace("{", RegWhy.LeftBrace);
        value = value.replace("}", RegWhy.RightBrace);
        value = value.replace("$", RegWhy.DollarSign);
        value = value.replace("*", RegWhy.Asterik);
        value = value.replace("?", RegWhy.QuestionMark);
        value = value.replace("<", RegWhy.LeftAngle);
        value = value.replace(">", RegWhy.RightAngle);
        value = value.replace("+", RegWhy.PlusSign);
        value = value.replace("^", RegWhy.Caret);
        return value;
    };
    RegWhy.CharacterType = function () {
        return new CharacterType();
    };
    RegWhy.Do = function () {
        return new Do();
    };
    RegWhy.Group = function () {
        return new Group();
    };
    RegWhy.Where = function () {
        return new Where();
    };
    RegWhy.Count = function () {
        return new Count();
    };
    RegWhy.Period = "\.";
    RegWhy.BackSlash = "\\";
    RegWhy.Bar = "\|";
    RegWhy.LeftParenthesis = "\(";
    RegWhy.RightParenthesis = "\)";
    RegWhy.NullString = "\0";
    RegWhy.LeftBracket = "\[";
    RegWhy.RightBracket = "\]";
    RegWhy.LeftBrace = "\{";
    RegWhy.RightBrace = "\}";
    RegWhy.DollarSign = "\$";
    RegWhy.Asterik = "\*";
    RegWhy.QuestionMark = "\?";
    RegWhy.LeftAngle = "\<";
    RegWhy.RightAngle = "\>";
    RegWhy.PlusSign = "\+";
    RegWhy.Caret = "\^";
    RegWhy.Tab = "\t";
    RegWhy.ReturnString = "\r";
    RegWhy.NewLine = "\n";
    RegWhy.FormFeed = "\f";
    RegWhy.OrMarker = "|";
    return RegWhy;
}());
var CharacterType = /** @class */ (function () {
    function CharacterType() {
        this.AnyCharacter = ".";
        this.Digit = "\d";
        this.NonDigit = "\D";
        this.WhiteSpace = "\s";
        this.NonWhiteSpace = "\S";
        this.WordCharacter = "\w";
        this.NonWordCharacter = "\W";
        this.WordBounday = "\b";
        this.NonWordBoundary = "\B";
        this.LowerCaseASCI = "[a-z]";
        this.UpperCaseASCII = "[A-Z]";
        this.AnyASCII = '[ -~]';
        this.EndOfFile = "^Z";
    }
    CharacterType.prototype.Unicode = function (fourDigitUniCodeNumber) {
        return ("\\" + "u" + fourDigitUniCodeNumber);
    };
    CharacterType.prototype.Hexidecimal = function (twoDigitalCode) {
        return ("\\" + "x" + twoDigitalCode);
    };
    CharacterType.prototype.CharacterRange = function (listOfCharacters) {
        return "[" + listOfCharacters + "]";
    };
    CharacterType.prototype.NotInCharacterRange = function (listOfCharacters) {
        return "[^" + listOfCharacters + "]";
    };
    return CharacterType;
}());
var Group = /** @class */ (function () {
    function Group() {
        this.StartCapturing = "(";
        this.StartNonCapturing = "(?:";
        this.End = ")";
        this.EndOptional = ")?";
        this.EndZeroOrMore = ")*";
        this.EndOneOfMore = ")+";
        this.SmallestMatch = "?";
        this.LargestMatch = "";
        this.EndOptionSmallestMatch = ")??";
        this.EndZeroOrMoreSmallestMatch = ")*?";
        this.EndOneOrMoreSmallestMatch = ")+?";
        this.EndOfNumberedSmallestMatch = "?";
        this.LastMatch = "$&";
        this.LastParen = "$+";
        this.PrecedingMatch = "%`";
    }
    Group.prototype.StartNamed = function (nameOfGroup) {
        return "(<" + nameOfGroup + ">";
    };
    Group.prototype.StartOptionalCapturingList = function (listOfWords) {
        var finalStatement = "(";
        for (var _i = 0, listOfWords_1 = listOfWords; _i < listOfWords_1.length; _i++) {
            var statement = listOfWords_1[_i];
            if (finalStatement.length > 1) {
                finalStatement = finalStatement + "|";
            }
            finalStatement = finalStatement + statement;
        }
        return finalStatement + ")";
    };
    Group.prototype.StartOptionalNonCapturingList = function (listOfWords) {
        var finalStatement = "(?:";
        for (var _i = 0, listOfWords_2 = listOfWords; _i < listOfWords_2.length; _i++) {
            var statement = listOfWords_2[_i];
            if (finalStatement.length > 2) {
                finalStatement = finalStatement + "|";
            }
            finalStatement = finalStatement + statement;
        }
        return finalStatement + ")";
    };
    Group.prototype.BackReference = function (whichReference) {
        if (whichReference > 9 || whichReference < 1) {
            throw new Error("Backreferences must be between 1 and 9");
        }
        return "$" + whichReference;
    };
    Group.prototype.MatchOnlyIfThisIsNext = function (whatsNext) {
        return "(?=" + whatsNext;
    };
    Group.prototype.MatchOnlyIfThisIsNotNext = function (whatsNext) {
        return "(?|" + whatsNext;
    };
    Group.prototype.EndExactNumber = function (countOfTimes) {
        return "){" + countOfTimes + "}";
    };
    Group.prototype.EndExactNumberOrAbove = function (countOfTimes) {
        return "){" + countOfTimes + ",}";
    };
    Group.prototype.EndRange = function (bottomNumber, topNumber) {
        return "){" + bottomNumber + "," + topNumber + "}";
    };
    return Group;
}());
var Where = /** @class */ (function () {
    function Where() {
        this.StartOfString = "^";
        this.EndOfString = "$";
    }
    return Where;
}());
var Do = /** @class */ (function () {
    function Do() {
    }
    Do.SetRegExOptions = function (global, caseInsensitive, multilineMatching) {
        var returnString = "";
        if (global) {
            returnString = "g";
        }
        if (caseInsensitive) {
            returnString = returnString + 'i';
        }
        if (multilineMatching) {
            returnString = returnString + "m";
        }
        return returnString;
    };
    Do.prototype.Detect = function (stringToSearch, valueToFind, caseInsensitive, multilineMatching) {
        if (caseInsensitive === void 0) { caseInsensitive = false; }
        if (multilineMatching === void 0) { multilineMatching = false; }
        var pattern = new RegExp(valueToFind, Do.SetRegExOptions(false, caseInsensitive, multilineMatching));
        return (pattern.test(stringToSearch));
    };
    Do.prototype.ExtractFirst = function (stringToSearch, valueToFind, caseInsensitive, multilineMatching) {
        if (caseInsensitive === void 0) { caseInsensitive = false; }
        if (multilineMatching === void 0) { multilineMatching = false; }
        var pattern = new RegExp(valueToFind, Do.SetRegExOptions(false, caseInsensitive, multilineMatching));
        var result = (pattern.exec(stringToSearch));
        if (result == null) {
            return null;
        }
        return result[0];
    };
    Do.prototype.ExtractAll = function (stringToSearch, valueToFind, caseInsensitive, multilineMatching) {
        if (caseInsensitive === void 0) { caseInsensitive = false; }
        if (multilineMatching === void 0) { multilineMatching = false; }
        var matches = [];
        var match;
        var pattern = new RegExp(valueToFind, Do.SetRegExOptions(true, caseInsensitive, multilineMatching));
        while (match = pattern.exec(stringToSearch)) {
            matches.push(match[0]);
        }
        return matches;
    };
    Do.prototype.ExtractCapturedGroup = function (stringToSearch, valueToFind, groupToCapture, caseInsensitive, multilineMatching) {
        if (caseInsensitive === void 0) { caseInsensitive = false; }
        if (multilineMatching === void 0) { multilineMatching = false; }
        groupToCapture || (groupToCapture = 1); // default to the first capturing group
        var matches = [];
        var match;
        var pattern = new RegExp(valueToFind, Do.SetRegExOptions(true, caseInsensitive, multilineMatching));
        while (match = pattern.exec(stringToSearch)) {
            matches.push(match[0]);
        }
        return matches[groupToCapture];
    };
    Do.prototype.LocateFirst = function (stringToSearch, valueToFind, caseInsensitive, multilineMatching) {
        if (caseInsensitive === void 0) { caseInsensitive = false; }
        if (multilineMatching === void 0) { multilineMatching = false; }
        var pattern = new RegExp(valueToFind, Do.SetRegExOptions(false, caseInsensitive, multilineMatching));
        var result = (pattern.exec(stringToSearch));
        if (result == null) {
            return -1;
        }
        return result.index;
    };
    Do.prototype.LocateAll = function (stringToSearch, valueToFind, caseInsensitive, multilineMatching) {
        if (caseInsensitive === void 0) { caseInsensitive = false; }
        if (multilineMatching === void 0) { multilineMatching = false; }
        var matches = [];
        var match;
        var pattern = new RegExp(valueToFind, Do.SetRegExOptions(true, caseInsensitive, multilineMatching));
        while (match = pattern.exec(stringToSearch)) {
            matches.push(match.index);
        }
        return matches;
    };
    Do.prototype.ReplaceFirst = function (stringToSearch, valueToFind, valueToReplaceWith, caseInsensitive, multilineMatching) {
        if (caseInsensitive === void 0) { caseInsensitive = false; }
        if (multilineMatching === void 0) { multilineMatching = false; }
        var pattern = new RegExp(valueToFind, Do.SetRegExOptions(false, caseInsensitive, multilineMatching));
        return stringToSearch.replace(pattern, valueToReplaceWith);
    };
    Do.prototype.ReplaceAll = function (stringToSearch, valueToFind, valueToReplaceWith, caseInsensitive, multilineMatching) {
        if (caseInsensitive === void 0) { caseInsensitive = false; }
        if (multilineMatching === void 0) { multilineMatching = false; }
        var pattern = new RegExp(valueToFind, Do.SetRegExOptions(true, caseInsensitive, multilineMatching));
        return stringToSearch.split(pattern).join(valueToReplaceWith);
    };
    Do.prototype.SplitList = function (stringToSearch, valueToSplitWith, caseInsensitive, multilineMatching) {
        if (caseInsensitive === void 0) { caseInsensitive = false; }
        if (multilineMatching === void 0) { multilineMatching = false; }
        var pattern = new RegExp(valueToSplitWith, Do.SetRegExOptions(false, caseInsensitive, multilineMatching));
        return stringToSearch.split(pattern);
    };
    return Do;
}());
var Count = /** @class */ (function () {
    function Count() {
        this.Optional = "?";
        this.ZeroOrMore = "*";
        this.OneOrMore = "+";
    }
    Count.prototype.ExactNumber = function (numberOfDigits) {
        return "{" + numberOfDigits + "}";
    };
    Count.prototype.ExactNumberOrMore = function (numberOfDigits) {
        return "{" + numberOfDigits + ",}";
    };
    Count.prototype.RangeOfTimes = function (bottomNumber, topNUmber) {
        return "{" + bottomNumber + "," + topNUmber + "}";
    };
    return Count;
}());
// var regWhy = new RegWhy();
//  console.log("testin")
// console.log(regWhy.Do().ExtractAll("Test","t"));
console.log(RegWhy.Statement(["test", "test"]));
console.log(RegWhy.Do().ExtractAll("test", 't'));
console.log(RegWhy.Do().ExtractFirst("test", 't'));
console.log(RegWhy.Do().LocateFirst("test", 't'));
console.log(RegWhy.Do().LocateAll("test", 't'));
console.log(RegWhy.Literal("hello world"));
console.log(RegWhy.Do().Detect("test", "t"));
console.log(RegWhy.Do().Detect("test", "x"));
