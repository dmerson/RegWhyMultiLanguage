using System.Collections.Generic;

namespace RegWhyClassLibarary
{
    public static class RegWhy
    {

        public static class Make
        {
            public static  string Statement(List<string> regWhyStatements)
            {
                string endResult = "";
                foreach (var value in regWhyStatements)
                {
                    endResult = endResult + value;
                }
                return endResult;
            }

            public static string Literal(string value)
            {
                return value;
            }
            public static class Group
            {
                public static class Start
                {
                    public static string Capturing => "(";
                }

                 

            }
        }
    }
}