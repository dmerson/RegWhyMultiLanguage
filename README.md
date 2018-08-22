# RegWhy
## Introduction
RegWhy is a multilanguage API which is designed to make the power of RegEx easier to user.

RegEx in its current implementation has the following issues:
1. It is difficult to understand in your code
2. You can't use intellisense
3. It is implemented differently in different languages
4. Certain characters mean different things depending on their context

With these issues, RegWhy looks to fixes these issues while retaining the power of RegEx
1. It is human readable
2. It uses intellisense
3. The implementation is the same in every language (currently R, Python, TypeScript, JavaScript, and C#)
4. No character means different things in different contexts

## A Quick Example

Quick--what does this RegEx do?

^\\(?(\\d{3})?\\)?(\\d{3})[-.]?(\\d{4})$

Let's look at the R Implmentation of this code.

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


In C#, the only thing you need to change is:

var phone =new List(){

SAME REGWHY

}

In Python is it:

phone =[

SAME REGWHY

]

In JavaScript and TypeScript it is:

var phone =[

SAME REGWHY

]


