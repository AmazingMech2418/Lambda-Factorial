import Unsafe.Coerce

toChurch n = church 0 (\f -> (\x -> x))
    where
    church i res
        | i == n = res
        | otherwise = church (i + 1)
            ((\n -> (\f -> (\x -> f(n f x)))) res)

zzz = \g -> (\x -> g(\v -> unsafeCoerce x x v))(\x -> g(\v -> unsafeCoerce x x v))

isZero = \n -> n(\x -> \a -> \b -> b)(\a -> \b -> a)

_1 = \f -> \x -> f x

_pred = \n -> \f -> \x -> n(\g -> \h -> h(g f))(\u -> x)(\u -> u)

mult = \m -> \n -> \f -> \x -> m(n f) x

fff = \f -> \n -> (isZero n (\v -> _1) (unsafeCoerce (\v -> mult n (v (_pred n))))) f

factLambda = unsafeCoerce zzz fff

main = do
    let churchNum = toChurch 5
    let res = factLambda churchNum
    print $ (res (+ 1) 0 :: Int)
