using System.Collections.Generic;

namespace RegWhyClassLibarary
{
    class Worksheet
    {
        public Worksheet()
        {
            var statement = RegWhy.Statement(new List<string>
            {
                RegWhy.CharacterType.AnyCharacter,

                RegWhy.LeftParenthesis

            });
        }
    }
}
