#!/usr/bin/env python

class RegWhy:

    def __init__(self):
        self.name = 'Guido'
        self.Make = self.Make()

    class Make:
        def __init__(self):
            self.Group=self.Group()
        def talk(self):
            return 'talking...'
        def Statement(self,listOfRegWhy):
            final_string=""
            for str in listOfRegWhy:
                final_string +=str
            return final_string
        class Group:
            def range(self):
                return "["




if __name__ == '__main__':
    regWhy = RegWhy()
    print(regWhy.Make.talk())
    print(regWhy.Make.Group.range())
    print(regWhy.Make.Statement(["test","test2"]))
