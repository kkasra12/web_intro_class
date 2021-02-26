class DuplicatedHumanError(BaseException):
    pass


class Human:
    all_human_names = set()

    def __init__(self, name):
        if name in Human.all_human_names:
            raise DuplicatedHumanError
        self.name = name
        Human.all_human_names.add(name)

    def __del__(self):
        Human.all_human_names.remove(self.name)


if __name__ == "__main__":
    kasra = Human("kasra")
    kasra1 = Human("kasra")

