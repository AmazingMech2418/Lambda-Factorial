def toChurch(num):
    res = lambda f : lambda x : x
    for i in range(num):
        res = (lambda n : lambda f : lambda x : f(n(f)(x)))(res)
    return res


Z = (lambda g : (lambda x : g(lambda v : x(x)(v)))(lambda x : g(lambda v : x(x)(v))))

isZero = lambda n : n(lambda x : lambda a : lambda b: b)(lambda a : lambda b : a)

_1 = lambda f : lambda x : f(x)
_2 = lambda f : lambda x : f(f(x))
_0 = lambda f : lambda x : x

pred = lambda n : lambda f : lambda x : n(lambda g : lambda h : h(g(f)))(lambda u : x)(lambda u : u)

mult = lambda m : lambda n : lambda f : lambda x : m(n(f))(x)

F = lambda f : lambda n : isZero(n)(lambda v : _1)(lambda v : mult(n)(v(pred(n))))(f)



factLambda = Z(F)

print(factLambda(toChurch(5))(lambda n : n + 1)(0))
