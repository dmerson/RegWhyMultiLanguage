abstract class RegWhy {
    constructor() {
        
    }
    public static period="\.";
    public static backSlash="\\";
    public static bar ="\|";
    public static leftParenthesis="\(";
    public static rightParenthesis="\)";
    public static leftBracket="\[";
    public static rightBracket="\]";
    public static leftBrace="\{";
    public static rightBrace="\}";
    public static dollarSign="\$";
    public static asterik="\*";
    public static questionMark="\?";
    public static leftAngle="\<";
    public static rightAngle="\>";
    public static caret="\^";
    public static tab="\t";
    public static return="\r";
    public static newLine="\n";
    public static formFeed="\f";

    public static Statement(listOfStatements: Array<string>) {
        let finalStatement="";
        for ( let statement of listOfStatements){
             
            finalStatement=finalStatement + statement;
        }
        return finalStatement;

    }
    public static Literal(literalText: string) {
        return literalText;
    }
    public static CharacterType() {
        return new CharacterType();
    }
    public static Do() {
        return new Do();
    }
    public static Group() {
        return new Group();
    }
    public static Where() {
        return new Where();
    }
    public static Count(){
        return new Count();
    }
}


class CharacterType{
    
    constructor() {
        
    }
    anyCharacter="."
    digit ="\d";
    nonDigit="\D";
    whiteSpace="\s";
    nonWhiteSpace="\S";
    wordCharacter="\w";
    nonWordCharacter="\W";
    wordBounday="\b";
    nonWordBoundary="\B";
    lowerCaseASCI="[a-z]";
    upperCaseASCII="[A-Z]";
     
    //POSIX COMMANDS
    alphaNumeric="[[almum:]]";
    punctuation="[[:almum:]]";
    hexadecial="[[:xdigit:]]";
    space="[[:space:]]"; //tab, newline, vertical tab, form feed,carriage return, and space
    printable="[[:print:]]"
    graphical="[[:graph:]]"
    blankSpace="[[:blank:]]" //space and tab
    public unicode(fourDigitUniCodeNumber:string):string{
        return ("\\" +"u" + fourDigitUniCodeNumber) ; 
    }
     
    public characterRange(listOfCharacters){
        return "[" + listOfCharacters;
    }
    public notInCharacterRange(listOfCharacters){
        return "[^" + listOfCharacters;
    }
    
     
}
class Group{

    constructor() {
        
    }
    public Start(){
        return new Start();
    }
    or="|"
    end=")";
    endOptional=")?";
    endZeroOrMore=")*";
    endOneOfMore=")+";
    public endExactNumber(countOfTimes){
        return "){" + countOfTimes + "}";
    }
    public endExactNumberOrAbove(countOfTimes){
        return "){" + countOfTimes + ",}";
    }
    public endRange(bottomNumber, topNumber){
        return "){" + bottomNumber + "," + topNumber +  "}";
    }


     
}

class Start{
    capturing="("
    nonCapturing="(?:"
    
    public named(nameOfGroup){
        return "(<" + nameOfGroup + ">";
    }
    public optionalCapturingList(listOfWords:Array<string>):string{
        let finalStatement="(";
        for ( let statement of listOfWords){
             if (finalStatement.length > 1){
                finalStatement=finalStatement + "|"
             }
            finalStatement=finalStatement + statement;
        }
        return finalStatement;
    }
    public optionalNonCapturingList(listOfWords:Array<string>):string{
        let finalStatement="(?:";
        for ( let statement of listOfWords){
             if (finalStatement.length > 2){
                finalStatement=finalStatement + "|"
             }
            finalStatement=finalStatement + statement;
        }
        return finalStatement;
    }
    constructor(){

    }
}

class Where{

    constructor() {
        
    }
    startOfString="^";
    endOfString="$";
     
}
class Do{
    
    constructor() {
        
    }
    public Dectect(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
        var newValue ="/" + valueToFind + "/";
        if (caseInsensitive)
        {
            newValue=newValue + "i"
        }
        if (multilineMatching)
        {
            newValue=newValue + "m"
        }
        var pattern =new RegExp(valueToFind)
        
        
        return (pattern.test(stringToSearch))
    }
    public ExtractFirst(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
        var newValue ="/" + valueToFind + "/";
        if (caseInsensitive)
        {
            newValue=newValue + "i"
        }
        if (multilineMatching)
        {
            newValue=newValue + "m"
        }
        var pattern =new RegExp(valueToFind)
        var result= (pattern.exec(stringToSearch))
        if (result==null){return null}
        return result[0];
    }
    public ExtractAll(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
        var matches = [];
        var match;
        var newValue ="/" + valueToFind + "/g";
        if (caseInsensitive)
        {
            newValue=newValue + "i"
        }
        if (multilineMatching)
        {
            newValue=newValue + "m"
        }
        var pattern =new RegExp(newValue)
        while (match = pattern.exec(stringToSearch)) {
        matches.push(match);
        }
        return matches;
    }
    // public MatchFirst(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
    //     return "match first is  is not implement";
    // }
    // public MatchAll(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
    //     return "match all is not implemented";
    // }
    public ExtractCapturedGroup(stringToSearch:string, valueToFind:string, groupToCapture:number, caseInsensitive=false, multilineMatching=false){
        groupToCapture || (groupToCapture = 1); // default to the first capturing group
        var matches = [];
        var match;
        var newValue ="/" + valueToFind + "/g";
        if (caseInsensitive)
        {
            newValue=newValue + "i"
        }
        if (multilineMatching)
        {
            newValue=newValue + "m"
        }
        var pattern =new RegExp(newValue)
        while (match = pattern.exec(stringToSearch)) {
        matches.push(match);
        }
        return matches[groupToCapture];
         
    }
    public LocateFirst(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
        var newValue ="/" + valueToFind + "/";
        if (caseInsensitive)
        {
            newValue=newValue + "i"
        }
        if (multilineMatching)
        {
            newValue=newValue + "m"
        }
        var pattern =new RegExp(newValue)
        
        var result= (pattern.exec(stringToSearch))
        if (result==null){return -1}
        return result.index;
    }
    public LocateAll(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
        var matches = [];
        var match;
        var newValue ="/" + valueToFind + "/g";
        if (caseInsensitive)
        {
            newValue=newValue + "i"
        }
        if (multilineMatching)
        {
            newValue=newValue + "m"
        }
        var pattern =new RegExp(newValue)
         
        while (match = pattern.exec(stringToSearch)) {
            matches.push(match.index);
            }
         
        return matches;
    }
    public ReplaceFirst(stringToSearch:string, valueToFind:string, valueToReplaceWith:string, caseInsensitive=false, multilineMatching=false):string{
        var newValue ="/" + valueToFind + "/";
        if (caseInsensitive)
        {
            newValue=newValue + "i"
        }
        if (multilineMatching)
        {
            newValue=newValue + "m"
        }
        return stringToSearch.replace(valueToFind,valueToReplaceWith);
    }
    public ReplaceAll(stringToSearch:string, valueToFind:string,valueToReplaceWith:string, caseInsensitive=false, multilineMatching=false){
        var newValue ="/" + valueToFind + "/g";
        if (caseInsensitive)
        {
            newValue=newValue + "i"
        }
        if (multilineMatching)
        {
            newValue=newValue + "m"
        }
        return stringToSearch.split(newValue).join(valueToReplaceWith)
    }
    public SplitList(stringToSearch:string, valueToSplitWith:string, caseInsensitive=false, multilineMatching=false){
        var newValue ="/" + valueToSplitWith + "/";
        if (caseInsensitive)
        {
            newValue=newValue + "i"
        }
        if (multilineMatching)
        {
            newValue=newValue + "m"
        }
        return stringToSearch.split(newValue);
    }
   
}
class Count{
    constructor(){

    }
    optional="?";
    zeroOrMore="*";
    oneOrMore="+";
    public exactNumber(numberOfDigits:number){
        return "{" + numberOfDigits + "}";
    }
    public exactNumberOrMore(numberOfDigits:number){
        return "{" + numberOfDigits + ",}";
    }
    public rangeOfTimes(bottomNumber:number, topNUmber:number){
        return "{" + bottomNumber + "," + topNUmber + "}";
    }
}
// var regWhy = new RegWhy();

//  console.log("testin")
// console.log(regWhy.Do().ExtractAll("Test","t"));
console.log(RegWhy.Statement(["test","test"]))
console.log(RegWhy.Do().ExtractAll("test", 't'));
console.log(RegWhy.Literal("hello world"));
console.log(RegWhy.Do().Dectect("test","t"))
console.log(RegWhy.Do().Dectect("test","x"))

