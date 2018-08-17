using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RegWhyClassLibarary
{
    class Worksheet
    {
        public Worksheet()
        {
            var statement = RegWhy.Statement(new List<string>
            {
                RegWhy.CharacterType.anyCharacter,

                RegWhy.leftParenthesis,

            });
        }
    }
}
