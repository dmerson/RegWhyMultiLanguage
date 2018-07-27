var RegWhy = /** @class */ (function () {
    function RegWhy(message) {
        this.greeting = message;
    }
    RegWhy.prototype.greet = function () {
        return "Hello, " + this.greeting;
    };
    RegWhy.prototype.Make = function () {
        return new Make();
    };
    RegWhy.prototype.Do = function () {
        return new Do();
    };
    return RegWhy;
}());
var Make = /** @class */ (function () {
    function Make() {
    }
    Make.prototype.Previous = function () {
        return new Previous();
    };
    return Make;
}());
var Previous = /** @class */ (function () {
    function Previous() {
    }
    Previous.prototype.optional = function () {
        return "?";
    };
    return Previous;
}());
var Do = /** @class */ (function () {
    function Do() {
    }
    return Do;
}());
var regWhy = new RegWhy("world");
var x = regWhy.Make().Previous().optional();
console.log(x);
