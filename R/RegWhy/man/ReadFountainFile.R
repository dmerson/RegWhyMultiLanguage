#install.packages("RegWhy")
library(RegWhy)
script_lines <-readLines("../Documents/Screenplays/Big-Fish.fountain.txt")     
start_of_script=FALSE
HAS_A_TAB =RegWhy.statement(c(
  RegWhy.Where.startOfString(),
  RegWhy.tab(),
  RegWhy.count.oneOrMore(),
  RegWhy.characterType.alphaNumeric(),
  RegWhy.count.oneOrMore(),
  RegWhy.Where.endOfString()
))
SIX_SPACES =RegWhy.statement(c(
  RegWhy.Where.startOfString(),
  RegWhy.characterType.space(),
  RegWhy.count.exactNumber(6),
  RegWhy.characterType.anyCharacter(),
  RegWhy.count.oneOrMore(),
  RegWhy.Where.endOfString()
  
))
#RegWhy.do.detect("      WILL",SIX_SPACES)

FADE_IN_SCRIPT =RegWhy.statement(c(
  RegWhy.characterType.anyCharacter(),
  RegWhy.count.zeroOrMore(),
  RegWhy.literal("FADE IN"),
  RegWhy.characterType.anyCharacter(),
  RegWhy.count.zeroOrMore())
)

SCENE =RegWhy.statement(c(
  Regwhy.group.startNonCapturing(),
  RegWhy.literal("INT"),
  RegWhy.orMarker(),
  RegWhy.literal("EXT"),
  RegWhy.group.end(),
  RegWhy.period(),
  RegWhy.count.zeroOrMore(),
  RegWhy.characterType.space(),
  RegWhy.count.oneOrMore(),
  Regwhy.group.startCapturing(),
  RegWhy.characterType.alphaNumeric(),
  RegWhy.count.oneOrMore(),
  RegWhy.group.end()
  
))
# SCENE
BLANK_LINE=""
CHARACTER <- RegWhy.statement(c(
  RegWhy.Where.startOfString(),
  Regwhy.group.startCapturing(),
  RegWhy.characterType.characterRange("A-Z0-9 ."),
  RegWhy.group.end(),
  RegWhy.count.oneOrMore(),
  Regwhy.group.startNonCapturing(),
  RegWhy.literal("(V.O.)"),
  RegWhy.group.endOptional(),
  Regwhy.group.startNonCapturing(),
  RegWhy.literal("(O.S.)"),
  RegWhy.group.endOptional(),
  Regwhy.group.startNonCapturing(),
  RegWhy.literal("(CONT'D)"),
  RegWhy.group.endOptional(),
  RegWhy.Where.endOfString()
  
  
))
PARENTHETICAL <- RegWhy.statement(c(
  RegWhy.Where.startOfString(),
  RegWhy.leftParenthesis(),
  RegWhy.characterType.anyCharacter(),
  RegWhy.count.oneOrMore(),
  RegWhy.rightParenthesis(),
  RegWhy.Where.endOfString()
  
))
CUTS <- RegWhy.statement(c(
  RegWhy.Where.startOfString(),
  RegWhy.literal("CUT TO"),
  RegWhy.characterType.anyCharacter(),
  RegWhy.count.oneOrMore(),
  RegWhy.Where.endOfString()
  
))
CAMERADIRECTION <- RegWhy.statement(c(
  RegWhy.Where.startOfString(),
  RegWhy.literal("CROSSFADE TO"),
  RegWhy.characterType.anyCharacter(),
  RegWhy.count.oneOrMore(),
  RegWhy.Where.endOfString()
  
))
TRANSISTION <- RegWhy.statement(c(
  RegWhy.Where.startOfString(),
  RegWhy.literal("TRANSISTION "),
  RegWhy.characterTanyCharacter(),
  RegWhy.count.oneOrMore(),
  RegWhy.Where.endOfString()
  
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
script_df <-c("","","","","")
len_of_script=length(script_lines)
for (i in 1:len_of_script){
  #print(script_lines[i])
  if (RegWhy.do.detect(script_lines[i], FADE_IN_SCRIPT)==TRUE){
    start_of_script=TRUE
    last_line_type="START"
    #print("Start!")
  }
  #if script is started
  if ((start_of_script==TRUE) && (RegWhy.do.detect(script_lines[i], FADE_IN_SCRIPT) ==FALSE)){
    current_line <-script_lines[i]
    
    #look for Blank line
    if (current_line==BLANK_LINE){
      last_line_type="BLANK_LINE"
      
    }
    else{
      
      if (RegWhy.do.detect(current_line,CUTS) ||
          RegWhy.do.detect(current_line,CAMERADIRECTION) || 
          RegWhy.do.detect(current_line,TRANSISTION)){
        #print("Camera")
        #print(current_line)
      }
      else{
        #look for SCENE
        if (RegWhy.do.detect(current_line,SCENE)){
          #print("SCENE")
          #print(current_line)
          last_line_type="SCENE"
          if (current_scene != current_line && current_scene !=""){
            current_frame <- c(current_title,current_scene,current_stage_direction,current_character,current_dialogue);
            #print(current_frame)
            script_df <- rbind(script_df,current_frame)
            current_stage_direction=""
            current_character=""
            current_dialogue=""
          }
          current_scene <- current_line
        }
        else{
          #Look for Character
          if (RegWhy.do.detect(current_line,CHARACTER)){
            #print("CHARACTER")
            #print(RegWhy.do.extractCapturedGroup(current_line,CHARACTER,1))
            last_line_type="CHARACTER";

            if (current_character != RegWhy.do.extractCapturedGroup(current_line,CHARACTER,1)){
              current_frame <- c(current_title,current_scene,current_stage_direction,current_character,current_dialogue);
              #print(current_frame)
              script_df <- rbind(script_df,current_frame)
              current_stage_direction=""
              current_character=""
              current_dialogue=""
            }
            
            
            current_character=RegWhy.do.extractCapturedGroup(current_line,CHARACTER,1);
          }
          else{
            
            if (RegWhy.do.detect(current_line,PARENTHETICAL)==TRUE){
              #print("PARENTHETICAL")
              last_line_type="PARENTHETICAL"
            }
            else{
              if (last_line_type=="CHARACTER" || last_line_type=="PARENTHETICAL"){
                #print("DIALOGUE")
                last_line_type="DIALOGUE";
                current_dialogue=current_line;
              }
              else
              {
                if (last_line_type=="DIALOGUE"){
                  #print("MORE DIALOGUE")
                  last_line_type="DIALOGUE"
                  current_dialogue =paste(current_dialogue,current_line);
                  
                }
                else
                {
                  if (last_line_type=="BLANK_LINE"){
                   # print("STAGE DIRECTION");
                    #last_line_type="STAGE_DIRECTION";
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
