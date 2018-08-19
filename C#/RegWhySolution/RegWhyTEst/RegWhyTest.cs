using System;
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
            var period = RegWhy.period;
            Assert.AreEqual("\\.",period);
            var result=RegWhy.Do.Detect("test", "T", RegexOptions.IgnoreCase);
            Assert.AreEqual(true,result);
            result = RegWhy.Do.Detect("test", "T" );
            Assert.AreEqual(false, result);
            result = RegWhy.Do.Detect("test", "T", true);
            Assert.AreEqual(true, result);
            var match = RegWhy.Do.ExtractFirst("test", "t");
            Assert.AreEqual("t",match);
            match = RegWhy.Do.ExtractFirst("test", "T",true);
            Assert.AreEqual("t", match);
            var matches = RegWhy.Do.ExtractAll("test", ".");
            Assert.AreEqual("t", matches[0]);
            Assert.AreEqual("e", matches[1]);
            var literal = RegWhy.Literal(@".");
            //Assert.AreEqual(@"\.",literal);
            result = RegWhy.Do.Detect("test?", @"\?", true);
            Assert.AreEqual(true, result);
            var replacement = RegWhy.Do.ReplaceFirst("test", "t", "j");
            Assert.AreEqual("jest",replacement);
            replacement = RegWhy.Do.ReplaceAll("test", "t", "j");
            Assert.AreEqual("jesj", replacement);

        }
    }
}
