class Polar_vector:
    theta: int
    r: int

    def __init__(self, r, theta, range_begin=0):
        assert range_begin in [0, -180], f"range_begin must be 0 or -180 not {range_begin}"
        self.range_begin = range_begin
        self.theta = theta
        self.r = r

    @property
    def r(self):
        return self.__r

    @property
    def theta(self):
        return self.__theta

    @theta.setter
    def theta(self, val):
        if self.range_begin == 0:
            self.__theta = val % 360
        else:
            val %= 360
            if val < 180:
                self.__theta = val
            else:
                self.__theta = -(val - 180)

    @r.setter
    def r(self, val):
        self.__r = abs(val)

    def __str__(self):
        return f"POLAR_VECTOR(r:{self.__r}, theta:{self.__theta})"

    def __repr__(self):
        return str(self)


if __name__ == '__main__':
    v1 = Polar_vector(-3, 365)
    print(f"{v1=}")
    v1.theta = 10
    print("changing theta")
    print(f"{v1=}")
    v2 = Polar_vector(4, 270, range_begin=-180)
    print(f"{v2=}")
