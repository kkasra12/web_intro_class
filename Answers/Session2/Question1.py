def abs_lt_one(func):
    def wrapper(x, N=None):
        # NOTE: `def wrapper(x, N=50)` is not good
        if not 0 < abs(x) < 1:
            x = 1 / x
        if x == 1:
            raise ValueError
        if N is None:
            return func(x)
        else:
            return func(x, N)

    return wrapper


@abs_lt_one
def simple_geometry(x, N=10):
    return sum([x ** i for i in range(N)])


@abs_lt_one
def ln1_x(x, N=50):
    return sum([x ** i / i for i in range(N)])


print(simple_geometry(30, N=30))
