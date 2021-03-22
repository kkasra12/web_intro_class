class human(object):
    def __init__(self, name):
        self.name = name

    @classmethod
    def create_child(cls, child_name):
        return cls(child_name)

    def __call__(self,a):
        print(a)


myInt = 5
myHuman = human("kasra")
myStr = "kasra"

kasras_child = human.create_child("mamad")

# print(isinstance(myHuman, (human, int)))
# print(type(myHuman.name))

print(type(kasras_child))
