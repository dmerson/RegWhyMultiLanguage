using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using RegWhyClassLibarary;

namespace RegWhyTEst
{
    [TestClass]
    public class RegWhyTest
    {
        [TestMethod]
        public void TestMethod1()
        {
            var period = RegWhy.Period;
            Assert.AreEqual("\\.", period);
            var result = RegWhy.Do.Detect("test", "T", true);
            Assert.AreEqual(true, result);
            result = RegWhy.Do.Detect("test", "T");
            Assert.AreEqual(false, result);
            result = RegWhy.Do.Detect("test", "T", true);
            Assert.AreEqual(true, result);
            var match = RegWhy.Do.ExtractFirst("test", "t");
            Assert.AreEqual("t", match);
            match = RegWhy.Do.ExtractFirst("test", "T", true);
            Assert.AreEqual("t", match);
            var matches = RegWhy.Do.ExtractAll("test", ".");
            Assert.AreEqual("t", matches[0]);
            Assert.AreEqual("e", matches[1]);
            var literal = RegWhy.Literal(@".");
            //Assert.AreEqual(@"\.",literal);
            result = RegWhy.Do.Detect("test?", @"\?", true);
            Assert.AreEqual(true, result);
            var replacement = RegWhy.Do.ReplaceFirst("test", "t", "j");
            Assert.AreEqual("jest", replacement);
            replacement = RegWhy.Do.ReplaceAll("test", "t", "j");
            Assert.AreEqual("jesj", replacement);
            var validEmail = RegWhy.Statement(new List<string>()
            {
                RegWhy.Where.StartOfString,
                //RegWhy.CharacterType.characterRange("A-Za-z0-9._%+-"),
                RegWhy.CharacterType.AlphaNumericCharacterRangePlus("._%+-"),
                RegWhy.Count.OneOrMore,
                RegWhy.Literal("@"),
                //RegWhy.CharacterType.characterRange("A-Za-z0-9.-"),
                RegWhy.CharacterType.AlphaNumericCharacterRangePlus(".-"),
                RegWhy.Count.OneOrMore,
                RegWhy.Period,
                RegWhy.CharacterType.CharacterRange("A-Za-z"),
                RegWhy.Count.RangeOfTimes(2, 4),
                RegWhy.Where.EndOfString


            });
            Assert.AreEqual(@"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$", validEmail);
        }


        [TestMethod]
        public void CharacterTest()
        {
            var CHARACTER = RegWhy.Statement(new List<string>()
            {
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
            });
            var firstGroup = RegWhy.Do.ExtractCapturedGroup("WILL (V.O.)", CHARACTER, 1);
            var matcher = Regex.Match("WILL (V.O.)", CHARACTER);
            Assert.AreEqual("",firstGroup);
            Assert.AreEqual(1,0);
        }
    }
}
