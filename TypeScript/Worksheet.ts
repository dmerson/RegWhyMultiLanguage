class RegWhy {
    greeting: string;
    constructor(message: string) {
        this.greeting = message;
    }
    greet() {
        return "Hello, " + this.greeting;
    }
    Make() {
        return new Make();
    }
    Do() {
        return new Do();
    }
}
class Make{
    
    constructor() {
        
    }
    Previous() {
        return new Previous();
    }
}
class Previous{

    constructor() {
        
    }
    optional() {
        return "?"
    }
}
class Do{
    
    constructor() {
        
    }
}
let regWhy = new RegWhy("world");
var x = regWhy.Make().Previous().optional();
console.log(x)
 