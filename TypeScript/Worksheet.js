var RegWhy = /** @class */ (function () {
    function RegWhy() {
    }
    RegWhy.Statement = function (listOfStatements) {
        var finalStatement = "";
        for (var _i = 0, listOfStatements_1 = listOfStatements; _i < listOfStatements_1.length; _i++) {
            var statement = listOfStatements_1[_i];
            finalStatement = finalStatement + statement;
        }
        return finalStatement;
    };
    RegWhy.Literal = function (literalText) {
        return literalText;
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
    RegWhy.period = "\.";
    RegWhy.backSlash = "\\";
    RegWhy.bar = "\|";
    RegWhy.leftParenthesis = "\(";
    RegWhy.rightParenthesis = "\)";
    RegWhy.leftBracket = "\[";
    RegWhy.rightBracket = "\]";
    RegWhy.leftBrace = "\{";
    RegWhy.rightBrace = "\}";
    RegWhy.dollarSign = "\$";
    RegWhy.asterik = "\*";
    RegWhy.questionMark = "\?";
    RegWhy.leftAngle = "\<";
    RegWhy.rightAngle = "\>";
    RegWhy.caret = "\^";
    RegWhy.tab = "\t";
    RegWhy["return"] = "\r";
    RegWhy.newLine = "\n";
    RegWhy.formFeed = "\f";
    return RegWhy;
}());
var CharacterType = /** @class */ (function () {
    function CharacterType() {
        this.anyCharacter = ".";
        this.digit = "\d";
        this.nonDigit = "\D";
        this.whiteSpace = "\s";
        this.nonWhiteSpace = "\S";
        this.wordCharacter = "\w";
        this.nonWordCharacter = "\W";
        this.wordBounday = "\b";
        this.nonWordBoundary = "\B";
        this.lowerCaseASCI = "[a-z]";
        this.upperCaseASCII = "[A-Z]";
        //POSIX COMMANDS
        this.alphaNumeric = "[[almum:]]";
        this.punctuation = "[[:almum:]]";
        this.hexadecial = "[[:xdigit:]]";
        this.space = "[[:space:]]"; //tab, newline, vertical tab, form feed,carriage return, and space
        this.printable = "[[:print:]]";
        this.graphical = "[[:graph:]]";
        this.blankSpace = "[[:blank:]]"; //space and tab
    }
    CharacterType.prototype.unicode = function (fourDigitUniCodeNumber) {
        return ("\\" + "u" + fourDigitUniCodeNumber);
    };
    CharacterType.prototype.characterRange = function (listOfCharacters) {
        return "[" + listOfCharacters;
    };
    CharacterType.prototype.notInCharacterRange = function (listOfCharacters) {
        return "[^" + listOfCharacters;
    };
    return CharacterType;
}());
var Group = /** @class */ (function () {
    function Group() {
        this.or = "|";
        this.end = ")";
        this.endOptional = ")?";
        this.endZeroOrMore = ")*";
        this.endOneOfMore = ")+";
    }
    Group.prototype.Start = function () {
        return new Start();
    };
    Group.prototype.endExactNumber = function (countOfTimes) {
        return "){" + countOfTimes + "}";
    };
    Group.prototype.endExactNumberOrAbove = function (countOfTimes) {
        return "){" + countOfTimes + ",}";
    };
    Group.prototype.endRange = function (bottomNumber, topNumber) {
        return "){" + bottomNumber + "," + topNumber + "}";
    };
    return Group;
}());
var Start = /** @class */ (function () {
    function Start() {
        this.capturing = "(";
        this.nonCapturing = "(?:";
    }
    Start.prototype.named = function (nameOfGroup) {
        return "(<" + nameOfGroup + ">";
    };
    Start.prototype.optionalCapturingList = function (listOfWords) {
        var finalStatement = "(";
        for (var _i = 0, listOfWords_1 = listOfWords; _i < listOfWords_1.length; _i++) {
            var statement = listOfWords_1[_i];
            if (finalStatement.length > 1) {
                finalStatement = finalStatement + "|";
            }
            finalStatement = finalStatement + statement;
        }
        return finalStatement;
    };
    Start.prototype.optionalNonCapturingList = function (listOfWords) {
        var finalStatement = "(?:";
        for (var _i = 0, listOfWords_2 = listOfWords; _i < listOfWords_2.length; _i++) {
            var statement = listOfWords_2[_i];
            if (finalStatement.length > 2) {
                finalStatement = finalStatement + "|";
            }
            finalStatement = finalStatement + statement;
        }
        return finalStatement;
    };
    return Start;
}());
var Where = /** @class */ (function () {
    function Where() {
        this.startOfString = "^";
        this.endOfString = "$";
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
    Do.prototype.Dectect = function (stringToSearch, valueToFind, caseInsensitive, multilineMatching) {
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
    // public MatchFirst(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
    //     return "match first is  is not implement";
    // }
    // public MatchAll(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
    //     return "match all is not implemented";
    // }
    Do.prototype.ExtractCapturedGroup = function (stringToSearch, valueToFind, groupToCapture, caseInsensitive, multilineMatching) {
        if (caseInsensitive === void 0) { caseInsensitive = false; }
        if (multilineMatching === void 0) { multilineMatching = false; }
        groupToCapture || (groupToCapture = 1); // default to the first capturing group
        var matches = [];
        var match;
        var pattern = new RegExp(valueToFind, Do.SetRegExOptions(true, caseInsensitive, multilineMatching));
        while (match = pattern.exec(stringToSearch)) {
            matches.push(match);
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
        this.optional = "?";
        this.zeroOrMore = "*";
        this.oneOrMore = "+";
    }
    Count.prototype.exactNumber = function (numberOfDigits) {
        return "{" + numberOfDigits + "}";
    };
    Count.prototype.exactNumberOrMore = function (numberOfDigits) {
        return "{" + numberOfDigits + ",}";
    };
    Count.prototype.rangeOfTimes = function (bottomNumber, topNUmber) {
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
console.log(RegWhy.Literal("hello world"));
console.log(RegWhy.Do().Dectect("test", "t"));
console.log(RegWhy.Do().Dectect("test", "x"));
