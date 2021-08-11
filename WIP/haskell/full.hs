import Unsafe.Coerce

toChurch n = church 0 (\f -> (\x -> x))
    where
    church i res
        | i == n = res
        | otherwise = church (i + 1)
            ((\n -> (\f -> (\x -> f(n f x)))) res)

factLambda = unsafeCoerce (\g -> (\x -> g(\v -> unsafeCoerce x x v))(\x -> g(\v -> unsafeCoerce x x v))) (\f -> \n -> ((\n -> n(\x -> \a -> \b -> b)(\a -> \b -> a)) n (\v -> (\f -> \x -> f x)) (unsafeCoerce (\v -> (\m -> \n -> \f -> \x -> m(n f) x) n (v ((\n -> \f -> \x -> n(\g -> \h -> h(g f))(\u -> x)(\u -> u)) n))))) f)
factNums n = factLambda (toChurch 5) (+ 1) 0 :: Int

main = do
    print $ factNums 5
