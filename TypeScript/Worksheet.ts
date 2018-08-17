abstract class RegWhy {
    constructor() {
        
    }
    public static period="\.";
    public static backSlash="\\";
    public static bar ="\|";
    public static leftParenthesis="\(";
    public static rightParenthesis="\)";
    public static nullString="\0";
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
    public static returnString="\r";
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
    anyASCII='[ -~]';
    endOfFile="^Z";
     
    
    public unicode(fourDigitUniCodeNumber:string):string{
        return ("\\" +"u" + fourDigitUniCodeNumber) ; 
    }
    public hexidecimal(twoDigitalCode:string):string{
        return ("\\" +"x" + twoDigitalCode) ; 
    }
    public characterRange(listOfCharacters){
        return "[" + listOfCharacters + "]";
    }
    public notInCharacterRange(listOfCharacters){
        return "[^" + listOfCharacters + "]";
    }
    
     
}
class Group{

    constructor() {
        
    }
    public Start(){
        return new Start();
    }
    or="|";
    end=")";
    endOptional=")?";
    endZeroOrMore=")*";
    endOneOfMore=")+";
    smallestMatch="?";
    largestMatch="";
    endOptionSmallestMatch=")??";
    endZeroOrMoreSmallestMatch=")*?";
    endOneOrMoreSmallestMatch=")+?";
    endOfNumberedSmallestMatch="?";

    public backReference(whichReference:number):string{
        if (whichReference > 9 || whichReference < 1){
            throw new Error("Backreferences must be between 1 and 9")
        }
        return "$" + whichReference;
    }
    public lastMatch="$&";
    public lastParen="$+";
    public precedingMatch ="%`";


    public matchOnlyIfThisIsNext(whatsNext){
        return "(?=" + whatsNext
    }
    public matchOnlyIfThisIsNotNext(whatsNext){
        return "(?|" + whatsNext
    }
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
    public static SetRegExOptions(global:boolean,caseInsensitive:boolean,multilineMatching:boolean):string{
        var returnString="";
        if (global){
            returnString="g";
        }
        if (caseInsensitive){
            returnString =returnString + 'i';
        }
        if (multilineMatching){
            returnString=returnString + "m";
        }
        return returnString;

    }
    public Dectect(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
        var pattern =new RegExp(valueToFind,Do.SetRegExOptions(false,caseInsensitive,multilineMatching))
        return (pattern.test(stringToSearch))
    }
    public ExtractFirst(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
        var pattern =new RegExp(valueToFind,Do.SetRegExOptions(false,caseInsensitive,multilineMatching))
        var result= (pattern.exec(stringToSearch))
        if (result==null){return null}
        return result[0];
    }
    public ExtractAll(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
        var matches = [];
        var match;
         
        var pattern =new RegExp(valueToFind,Do.SetRegExOptions(true,caseInsensitive,multilineMatching))
        while (match = pattern.exec(stringToSearch)) {
         matches.push(match[0]);
          
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
        var pattern =new RegExp(valueToFind,Do.SetRegExOptions(true,caseInsensitive,multilineMatching))
        while (match = pattern.exec(stringToSearch)) {
        matches.push(match[0]);
        }
        return matches[groupToCapture];
         
    }
    public LocateFirst(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
        var pattern =new RegExp(valueToFind,Do.SetRegExOptions(false,caseInsensitive,multilineMatching))
        
        var result= (pattern.exec(stringToSearch))
        if (result==null){return -1}
        return result.index;
    }
    public LocateAll(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
        var matches = [];
        var match;
        var pattern =new RegExp(valueToFind,Do.SetRegExOptions(true,caseInsensitive,multilineMatching))
         
        while (match = pattern.exec(stringToSearch)) {
            matches.push(match.index);
            }
         
        return matches;
    }
    public ReplaceFirst(stringToSearch:string, valueToFind:string, valueToReplaceWith:string, caseInsensitive=false, multilineMatching=false):string{
        var pattern =new RegExp(valueToFind,Do.SetRegExOptions(false,caseInsensitive,multilineMatching))
        return stringToSearch.replace(pattern,valueToReplaceWith);
    }
    public ReplaceAll(stringToSearch:string, valueToFind:string,valueToReplaceWith:string, caseInsensitive=false, multilineMatching=false){
        var pattern =new RegExp(valueToFind,Do.SetRegExOptions(true,caseInsensitive,multilineMatching))
        return stringToSearch.split(pattern).join(valueToReplaceWith)
    }
    public SplitList(stringToSearch:string, valueToSplitWith:string, caseInsensitive=false, multilineMatching=false){
        var pattern =new RegExp(valueToSplitWith,Do.SetRegExOptions(false,caseInsensitive,multilineMatching))
        return stringToSearch.split(pattern);
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
console.log(RegWhy.Do().ExtractFirst("test", 't'));
console.log(RegWhy.Do().LocateFirst("test", 't'));
console.log(RegWhy.Do().LocateAll("test", 't'));
console.log(RegWhy.Literal("hello world"));
console.log(RegWhy.Do().Dectect("test","t"))
console.log(RegWhy.Do().Dectect("test","x"))
 

