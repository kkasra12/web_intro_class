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
    wrapper.__doc__ = func.__doc__
    wrapper.__name__ = func.__name__
    return wrapper


@abs_lt_one
def simple_geometry(x, N=50):
    '''

    :param x: the input value
    :param N: number of terms in teylor expansion
    :return: 1/(1-x)
    '''
    return sum([x ** i for i in range(N)])


@abs_lt_one
def ln1_x(x, N=50):
    '''

    :param x: the input value
    :param N: number of terms in teylor expansion
    :return: ln(1-x)
    '''
    return sum([x ** i / i for i in range(N)])


print(simple_geometry.__doc__)
