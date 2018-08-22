install.packages("devtools")
library("devtools")
install_github("dmerson/RegWhyMultiLanguage/R/RegWhy")
library(RegWhy)
library(stringr)
phone <- RegWhy.Statement(c(
  RegWhy.Where.StartOfString,
  RegWhy.LeftParenthesis,
  RegWhy.Count.Optional,
  RegWhy.Group.StartCapturing,
  RegWhy.CharacterType.Digit,
  RegWhy.Count.ExactNumber(3),
  RegWhy.Group.End,
  RegWhy.Count.Optional,
  RegWhy.RightParenthesis,
  RegWhy.Count.Optional,
  RegWhy.Group.StartCapturing,
  RegWhy.CharacterType.Digit,
  RegWhy.Count.ExactNumber(3),
  RegWhy.Group.End,
  RegWhy.CharacterType.CharacterRange("-."),
  RegWhy.Count.Optional,
  RegWhy.Group.StartCapturing,
  RegWhy.CharacterType.Digit,
  RegWhy.Count.ExactNumber(4),
  RegWhy.Group.End,
  RegWhy.Where.EndOfString
  
))
RegWhy.Do.Detect("282-1188",phone)
RegWhy.Do.ExtractCapturedGroup("282-1188",phone, 1)
RegWhy.Do.ExtractCapturedGroup("282-1188",phone, 2)
RegWhy.Do.ExtractCapturedGroup("282-1188",phone, 3)
RegWhy.Do.Extract("282-1188",phone)
