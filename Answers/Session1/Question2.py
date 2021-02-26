class Human:
    all_humans = dict()

    def __init__(self, name):
        self.name = name
        self.id = len(Human.all_humans) + 1

        class Human_(Human):
            def __init__(self, human: Human):
                self.name = human.name
                self.id = human.id

        Human.all_humans.update({self.id: [Human_(self), 1]})

    def __del__(self):
        Human.all_humans[self.id][1] = 0

    def __iter__(self):
        self.__iter_humans = [h for h, i in Human.all_humans.values() if i]
        return self

    def __next__(self):
        if self.__iter_humans:
            return self.__iter_humans.pop()
        raise StopIteration

    def __str__(self):
        return f"human<{self.name}>"

    def __repr__(self):
        return str(self)


h1 = Human("kasra")
h2 = Human("kasra - clone")
h3 = Human("main kasra")
del h3
h4 = Human("last kasra")
for h in h1:
    print(h)

print(Human.all_humans)
