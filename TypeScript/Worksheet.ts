abstract class RegWhy {
    constructor() {
        
    }
    public static Period="\.";
    public static BackSlash="\\";
    public static Bar ="\|";
    public static LeftParenthesis="\(";
    public static RightParenthesis="\)";
    public static NullString="\0";
    public static LeftBracket="\[";
    public static RightBracket="\]";
    public static LeftBrace="\{";
    public static RightBrace="\}";
    public static DollarSign="\$";
    public static Asterik="\*";
    public static QuestionMark="\?";
    public static LeftAngle="\<";
    public static RightAngle="\>";
	public static PlusSign="\+"
    public static Caret="\^";
    public static Tab="\t";
    public static ReturnString="\r";
    public static NewLine="\n";
    public static FormFeed="\f";
    public static OrMarker="|";
    public static AlphaNumericCharacterRangePlus(otherCharacters){
        return "[A-Za-z0-9" + otherCharacters + "]";
    }
    public static  NumericCharacterRangePlus( otherCharacters)
            {
                return "[0-9" + otherCharacters + "]";
            }

    public static  Unicode( fourDigitalNumber)
    {
        return "\\\\" + fourDigitalNumber;
    }

    public static  Hexidecimal( twoDigitalCode)
    {
        return "\\\\" + "x" + twoDigitalCode;
    }

    public static  CharacterRange( listOfCharacters)
    {
        return "[" + listOfCharacters + "]";
    }

    public static  NotInCharacterRange( listOfCharacters)
    {
        return "[^" + listOfCharacters + "]";
    }

    public static Statement(listOfStatements: Array<string>) {
        let finalStatement="";
        for ( let statement of listOfStatements){
             
            finalStatement=finalStatement + statement;
        }
        return finalStatement;

    }
    public static Literal(value: string) {
        value = value.replace("\\", RegWhy.BackSlash);
        value = value.replace(".", RegWhy.Period);
        
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
    AnyCharacter="."
    Digit ="\d";
    NonDigit="\D";
    Whitespace="\s";
    NonWhitespace="\S";
    WordCharacter="\w";
    NonWordCharacter="\W";
    WordBounday="\b";
    NonWordBoundary="\B";
    LowerCaseASCI="[a-z]";
    UpperCaseASCII="[A-Z]";
    AnyASCII='[ -~]';
    EndOfFile="^Z";
     
    
    public Unicode(fourDigitUniCodeNumber:string):string{
        return ("\\" +"u" + fourDigitUniCodeNumber) ; 
    }
    public Hexidecimal(twoDigitalCode:string):string{
        return ("\\" +"x" + twoDigitalCode) ; 
    }
    public CharacterRange(listOfCharacters){
        return "[" + listOfCharacters + "]";
    }
    public NotInCharacterRange(listOfCharacters){
        return "[^" + listOfCharacters + "]";
    }
    public AlphaNumeric="[A-Za-z0-9]"
    public Printable ="[A-Za-z0-9 .\\`~!@#$%^&*()_-+={[}]|;:'\"<,>?/";
    public Punctuation="[.\\`~!@#$%^&*()_-+={[}]|;:'\"<,>?/]"
    public Space="[\r\n\t \f]"
    public BlankSpace="[ \t]"
    public AlphaNumericCharacterRangePlus(otherValues){
        return "[A-Za-z0-9" + otherValues + "]"
    }
     
}
class Group{

    constructor() {
        
    }
     
    StartCapturing="("
    StartNonCapturing="(?:"
    
    public StartNamed(nameOfGroup){
        return "(<" + nameOfGroup + ">";
    }
    public StartOptionalCapturingList(listOfWords:Array<string>):string{
        let finalStatement="(";
        for ( let statement of listOfWords){
             if (finalStatement.length > 1){
                finalStatement=finalStatement + "|"
             }
            finalStatement=finalStatement + statement;
        }
        return finalStatement +")";
    }
    public StartOptionalNonCapturingList(listOfWords:Array<string>):string{
        let finalStatement="(?:";
        for ( let statement of listOfWords){
             if (finalStatement.length > 2){
                finalStatement=finalStatement + "|"
             }
            finalStatement=finalStatement + statement;
        }
        return finalStatement +")";
    }
    End=")";
    EndOptional=")?";
    EndZeroOrMore=")*";
    EndOneOfMore=")+";
    SmallestMatch="?";
    LargestMatch="";
    EndOptionSmallestMatch=")??";
    EndZeroOrMoreSmallestMatch=")*?";
    EndOneOrMoreSmallestMatch=")+?";
    EndOfNumberedSmallestMatch="?";

    public BackReference(whichReference:number):string{
        if (whichReference > 9 || whichReference < 1){
            throw new Error("Backreferences must be between 1 and 9")
        }
        return "$" + whichReference;
    }
    public LastMatch="$&";
    public LastParen="$+";
    public PrecedingMatch ="%`";


    public MatchOnlyIfThisIsNext(whatsNext){
        return "(?=" + whatsNext
    }
    public MatchOnlyIfThisIsNotNext(whatsNext){
        return "(?|" + whatsNext
    }
    public EndExactNumber(countOfTimes){
        return "){" + countOfTimes + "}";
    }
    public EndExactNumberOrAbove(countOfTimes){
        return "){" + countOfTimes + ",}";
    }
    public EndRange(bottomNumber, topNumber){
        return "){" + bottomNumber + "," + topNumber +  "}";
    }

    
     
}




class Where{

    constructor() {
        
    }
    StartOfString="^";
    EndOfString="$";
     
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
    public Detect(stringToSearch:string, valueToFind:string, caseInsensitive=false, multilineMatching=false){
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
    Optional="?";
    ZeroOrMore="*";
    OneOrMore="+";
    public ExactNumber(numberOfDigits:number){
        return "{" + numberOfDigits + "}";
    }
    public ExactNumberOrMore(numberOfDigits:number){
        return "{" + numberOfDigits + ",}";
    }
    public RangeOfTimes(bottomNumber:number, topNUmber:number){
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
console.log(RegWhy.Do().Detect("test","t"))
console.log(RegWhy.Do().Detect("test","x"))
console.log(RegWhy.Statement([
    RegWhy.Group().StartNonCapturing,
  RegWhy.Literal("INT"),
  RegWhy.OrMarker,
  RegWhy.Literal("EXT"),
  RegWhy.Group().End,
  RegWhy.Period,
  RegWhy.Count().ZeroOrMore,
  RegWhy.CharacterType().Whitespace,
  RegWhy.Count().OneOrMore,
  RegWhy.Group().StartCapturing,
  RegWhy.CharacterType().AlphaNumeric,
  RegWhy.Count().OneOrMore,
  RegWhy.Group().End
]))
 

