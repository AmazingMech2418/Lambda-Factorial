def toChurch(num):
    res = lambda f : lambda x : x
    for i in range(num):
        res = (lambda n : lambda f : lambda x : f(n(f)(x)))(res)
    return res

factLambda = (lambda g : (lambda x : g(lambda v : x(x)(v)))(lambda x : g(lambda v : x(x)(v))))(lambda f : lambda n : (lambda c : c(lambda x : lambda a : lambda b: b)(lambda a : lambda b : a))(n)(lambda v : (lambda a : lambda x : a(x)))(lambda v : (lambda m : lambda a : lambda b : lambda x : m(a(b))(x))(n)(v((lambda a : lambda b : lambda x : a(lambda g : lambda h : h(g(b)))(lambda u : x)(lambda u : u))(n))))(f))
factNums = lambda n : factLambda(toChurch(n))(lambda v : v + 1)(0)


print(factNums(5))
