#install.packages("RegWhy")
library(RegWhy)
library(stringr)

script_lines <-readLines("../Documents/Screenplays/Big-Fish.fountain.txt")     
start_of_script=FALSE
HAS_A_TAB =RegWhy.Statement(c(
  RegWhy.Where.StartOfString,
  RegWhy.Tab,
  RegWhy.Count.OneOrMore,
  RegWhy.CharacterType.AlphaNumeric,
  RegWhy.Count.OneOrMore,
  RegWhy.Where.EndOfString
))
SIX_SPACES =RegWhy.Statement(c(
  RegWhy.Where.StartOfString,
  RegWhy.CharacterType.Space,
  RegWhy.Count.ExactNumber(6),
  RegWhy.CharacterType.AnyCharacter,
  RegWhy.Count.OneOrMore,
  RegWhy.Where.EndOfString
  
))
#RegWhy.Do.Detect("      WILL",SIX_SPACES)

FADE_IN_SCRIPT =RegWhy.Statement(c(
  RegWhy.CharacterType.AnyCharacter,
  RegWhy.Count.ZeroOrMore,
  RegWhy.Literal("FADE IN"),
  RegWhy.CharacterType.AnyCharacter,
  RegWhy.Count.ZeroOrMore)
)

SCENE =RegWhy.Statement(c(
  RegWhy.Group.StartNonCapturing,
  RegWhy.Literal("INT"),
  RegWhy.OrMarker,
  RegWhy.Literal("EXT"),
  RegWhy.Group.End,
  RegWhy.Period,
  RegWhy.Count.ZeroOrMore,
  RegWhy.CharacterType.Space,
  RegWhy.Count.OneOrMore,
  RegWhy.Group.StartCapturing,
  RegWhy.CharacterType.AlphaNumeric,
  RegWhy.Count.OneOrMore,
  RegWhy.Group.End
  
))
# SCENE
BLANK_LINE=""
CHARACTER <- RegWhy.Statement(c(
  RegWhy.Where.StartOfString,
  RegWhy.Group.StartCapturing,
  RegWhy.CharacterType.CharacterRange("A-Z0-9 ."),
  RegWhy.Group.End,
  RegWhy.Count.OneOrMore,
  RegWhy.Group.StartNonCapturing,
  RegWhy.Literal("(V.O.)"),
  RegWhy.Group.EndOptional,
  RegWhy.Group.StartNonCapturing,
  RegWhy.Literal("(O.S.)"),
  RegWhy.Group.EndOptional,
  RegWhy.Group.StartNonCapturing,
  RegWhy.Literal("(CONT'D)"),
  RegWhy.Group.EndOptional,
  RegWhy.Where.EndOfString
  
  
))
PARENTHETICAL <- RegWhy.Statement(c(
  RegWhy.Where.StartOfString,
  RegWhy.LeftParenthesis,
  RegWhy.CharacterType.AnyCharacter,
  RegWhy.Count.OneOrMore,
  RegWhy.RightParenthesis,
  RegWhy.Where.EndOfString
  
))
CUTS <- RegWhy.Statement(c(
  RegWhy.Where.StartOfString,
  RegWhy.Literal("CUT TO"),
  RegWhy.CharacterType.AnyCharacter,
  RegWhy.Count.OneOrMore,
  RegWhy.Where.EndOfString
  
))
CAMERADIRECTION <- RegWhy.Statement(c(
  RegWhy.Where.StartOfString,
  RegWhy.Literal("CROSSFADE TO"),
  RegWhy.CharacterType.AnyCharacter,
  RegWhy.Count.OneOrMore,
  RegWhy.Where.EndOfString
  
))
TRANSISTION <- RegWhy.Statement(c(
  RegWhy.Where.StartOfString,
  RegWhy.Literal("TRANSISTION "),
  RegWhy.CharacterType.AnyCharacter,
  RegWhy.Count.OneOrMore,
  RegWhy.Where.EndOfString
  
))
last_line_type=""
current_title="Big Fish"
current_scene=""
current_stage_direction=""
current_character=""
current_dialogue=""
script_df <- data.frame(title=character(),
                              scene=character(), 
                              stage_direction=character(), 
                              charactername=character(),
                              dialogue=character(),
                              stringsAsFactors=FALSE) 
#script_df <-c("","","","","")
len_of_script=length(script_lines)
for (i in 1:len_of_script){
  #print(script_lines[i])
  if (RegWhy.Do.Detect(script_lines[i], FADE_IN_SCRIPT)==TRUE){
    start_of_script=TRUE
    last_line_type="START"
    #print("Start!")
  }
  #if script is started
  if ((start_of_script==TRUE) && (RegWhy.Do.Detect(script_lines[i], FADE_IN_SCRIPT) ==FALSE)){
    current_line <-script_lines[i]
    
    #look for Blank line
    if (current_line==BLANK_LINE){
      last_line_type="BLANK_LINE"
      
    }
    else{
      
      if (RegWhy.Do.Detect(current_line,CUTS) ||
          RegWhy.Do.Detect(current_line,CAMERADIRECTION) || 
          RegWhy.Do.Detect(current_line,TRANSISTION)){
        last_line_type="STAGE_DIRECTION"
        #print("Camera")
        #print(current_line)
      }
      else{
        #look for SCENE
        if (RegWhy.Do.Detect(current_line,SCENE)){
          #print("SCENE")
          #print(current_line)
          last_line_type="SCENE"
          if (current_scene != current_line && current_scene !=""){
            current_frame <- data.frame(current_title,current_scene,current_stage_direction,current_character,current_dialogue);
            script_df <- rbind(script_df,current_frame)
            current_stage_direction=""
            current_character=""
            current_dialogue=""
          }
          current_scene <- current_line
        }
        else{
          #Look for Character
          if (RegWhy.Do.Detect(current_line,CHARACTER)){
            #print("CHARACTER")
            #print(RegWhy.Do.ExtractCapturedGroup(current_line,CHARACTER,1))
            #print(current_line)
            last_line_type="CHARACTER";

            if (current_character != RegWhy.Do.ExtractCapturedGroup(current_line,CHARACTER,1)){
              current_frame <- data.frame(current_title,current_scene,current_stage_direction,current_character,current_dialogue);
              script_df <- rbind(script_df,current_frame)
              current_stage_direction=""
              current_character=""
              current_dialogue=""
            }
            
            
            current_character=RegWhy.Do.ExtractCapturedGroup(current_line,CHARACTER,1);
          }
          else{
            
            if (RegWhy.Do.Detect(current_line,PARENTHETICAL)==TRUE){
              last_line_type="PARENTHETICAL"
            }
            else{
              if (last_line_type=="CHARACTER" || last_line_type=="PARENTHETICAL"){
                last_line_type="DIALOGUE";
                current_dialogue=current_line;
              }
              else
              {
                if (last_line_type=="DIALOGUE"){
                  last_line_type="DIALOGUE"
                  current_dialogue =paste(current_dialogue,current_line);
                  
                }
                else
                {
                  if (last_line_type=="BLANK_LINE"  ){
                    last_line_type="STAGE_DIRECTION";
                    current_stage_direction <- current_line;
                  }
                }
              }
            }
            
            #print(current_line)
          }
        }
      }
      
    }
    
    
  }
}
View(script_df)
