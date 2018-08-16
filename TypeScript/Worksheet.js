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
    return RegWhy;
}());
var CharacterType = /** @class */ (function () {
    function CharacterType() {
    }
    return CharacterType;
}());
var Group = /** @class */ (function () {
    function Group() {
    }
    return Group;
}());
var Where = /** @class */ (function () {
    function Where() {
    }
    return Where;
}());
var Do = /** @class */ (function () {
    function Do() {
    }
    Do.prototype.Dectect = function (stringToSearch, valueToFind) {
        return "detect is not implement";
    };
    Do.prototype.ExtractFirst = function (stringToSearch, valueToFind) {
        return "extract first  is not implement";
    };
    Do.prototype.ExtractAll = function (stringToSearch, valueToFind) {
        return "extract all  is not implement";
    };
    Do.prototype.MatchFirst = function (stringToSearch, valueToFind) {
        return "match first is  is not implement";
    };
    Do.prototype.MatchAll = function (stringToSearch, valueToFind) {
        return "match all is not implemented";
    };
    Do.prototype.MatchCapturedGroup = function (stringToSearch, valueToFind) {
        return "match captured group is not implemented";
    };
    Do.prototype.LocateFirst = function (stringToSearch, valueToFind) {
        return "locate first is not implemented";
    };
    Do.prototype.LocateAll = function (stringToSearch, valueToFind) {
        return "locate all  is not implement";
    };
    Do.prototype.ReaplaceAll = function (stringToSearch, valueToFind) {
        return "replace all  is not implemented";
    };
    Do.prototype.SplitList = function (stringToSearch, valueToFind) {
        return "split list  is not implemented";
    };
    return Do;
}());
var Count = /** @class */ (function () {
    function Count() {
    }
    return Count;
}());
// var regWhy = new RegWhy();
//  console.log("testin")
// console.log(regWhy.Do().ExtractAll("Test","t"));
console.log(RegWhy.Statement(["test", "test"]));
console.log(RegWhy.Do().ExtractAll("test", 't'));
console.log(RegWhy.Literal("hello world"));
//# sourceMappingURL=Worksheet.js.map