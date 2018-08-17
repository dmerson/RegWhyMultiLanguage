using System;
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
        }
    }
}
