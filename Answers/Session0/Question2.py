from typing import List


class Vector:
    x: List[int]

    def __init__(self, *x):
        self.x = list(x)

    def __abs__(self):
        # sum_ = 0
        # for i in self.x:
        #     sum_ += i**2
        # return sum_**0.5
        return sum(i ** 2 for i in self.x) ** 0.5

    def __str__(self):
        dimensions = []
        for index, value in enumerate(self.x):
            dimensions.append(f"X{index}:{value}")
        return f"{len(self.x)}D-Vector({', '.join(dimensions)})"

    def __neg__(self):
        return Vector(*[-i for i in self.x])


if __name__ == '__main__':
    v1 = Vector(2, 3, 4, 6, 1, 4, 7)
    print(v1)
    print(f"{abs(v1)=}")

