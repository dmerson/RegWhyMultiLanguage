abstract class RegWhy {
    constructor() {
    }
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
}

class CharacterType{
    
    constructor() {
        
    }
     
}
class Group{

    constructor() {
        
    }
     
}
class Where{

    constructor() {
        
    }
     
}
class Do{
    
    constructor() {
        
    }
    public Dectect(stringToSearch:string, valueToFind:string){
        return "detect is not implement";
    }
    public ExtractFirst(stringToSearch:string, valueToFind:string){
        return "extract first  is not implement";
    }
    public ExtractAll(stringToSearch:string, valueToFind:string){
        return "extract all  is not implement";
    }
    public MatchFirst(stringToSearch:string, valueToFind:string){
        return "match first is  is not implement";
    }
    public MatchAll(stringToSearch:string, valueToFind:string){
        return "match all is not implemented";
    }
    public MatchCapturedGroup(stringToSearch:string, valueToFind:string){
        return "match captured group is not implemented";
    }
    public LocateFirst(stringToSearch:string, valueToFind:string){
        return "locate first is not implemented";
    }
    public LocateAll(stringToSearch:string, valueToFind:string){
        return "locate all  is not implement";
    }
    public ReaplaceAll(stringToSearch:string, valueToFind:string){
        return "replace all  is not implemented";
    }
    public SplitList(stringToSearch:string, valueToFind:string){
        return "split list  is not implemented";
    }
}
class Count{
    constructor(){

    }
}
// var regWhy = new RegWhy();

//  console.log("testin")
// console.log(regWhy.Do().ExtractAll("Test","t"));
console.log(RegWhy.Statement(["test","test"]))
console.log(RegWhy.Do().ExtractAll("test", 't'));
console.log(RegWhy.Literal("hello world"));

