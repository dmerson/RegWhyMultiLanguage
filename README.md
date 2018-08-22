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

## Design Principles

RegWhy is designed with the following in mind.

1. The API should be the same in every language. This means that the API doesn't conform to commmon languages standards for the various different languages. For example, in JavaScript it is common to use camelCase or in R short tense language is used. But to have the language be copy-paste importable from another language, I choose to implement the language to always use Capitals such as RegWhy.Do.ExtractAll.

2. There are a few basic principals to finiding RegWhy Expressions. All special characters that need escaping are found in the RegWhy root such as RegWhy.Backslash. Grouping expressions are found in RegWhy.Group such as RegEx.Group.StartCapturingGroup. Items dealing with position are found in RegWhy.Where such as RegWhy.Where.StartOfString. Items such as how many as found in RegWhy.Count such as RegWhy.ZeroOrMore. All work is done in the RegWhy.Do namespace such as RegWhy.Do.Detect. Two of the most important functions are RegWhy.Literal which allows the user not to have to think about escaping characters if they exist and RegWhy.Statement which is basically a wrapper around RegWhy.Expressions.

3. RegWhy expressions are just string and thus allow power users to implement them still within RegEx operations in the case that a RegWhy statement is not implemented. 

4. RegWhy is designed to have the same API but also as a wrapper to help the user understand speical RegEx operations for a given language. These features of course are not cross compatiable but they give the user a way to sniff out special features in a language.

3. 
