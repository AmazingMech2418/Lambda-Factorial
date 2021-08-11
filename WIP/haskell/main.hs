toChurch n = church 0 (\f -> (\x -> x))
    where
    church i res
        | i == n = res
        | otherwise = church (i + 1)
            ((\n -> (\f -> (\x -> f(n f x)))) res)

zzz = \g -> (\x -> g(\v -> x x v))(\x -> g(\v -> x x v))

isZero = \n -> n(\x -> \a -> \b -> b)(\a -> \b -> a)

_1 = \f -> \x -> f x

_pred = \n -> \f -> \x -> n(\g -> \h -> h(g f))(\u -> x)(\u -> u)

mult = \m -> \n -> \f -> \x -> m(n f) x

fff = \f -> \n -> (isZero n (\v -> _1) (\v -> mult n (v (_pred n)))) f

factLambda = zzz fff

main = do
    putStrLn "Hello world!"
    let churchNum = toChurch 5
    let converted = churchNum (+ 1) 0
    print converted
    let res = factLambda churchNum
    print $ res (+ 1) 0
