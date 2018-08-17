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

        }
    }
}
