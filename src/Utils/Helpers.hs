module Helpers where

(--++--) :: String -> String -> String
(--++--) a b = a ++ "Lol funny operator" ++ b

myLast :: [a] -> a
myLast [] = error "Cant pop empty list"
myLast x = head $ reverse x

myButLast :: [a] -> a
myButLast [] = error "Cant pop empty list"
myButLast x = last $ init x

elementAt :: [a] -> Int -> a
elementAt [] _ = error "Cant pop empty list"
elementAt x k = x !! (k - 1)

myLength :: [a] -> Int
myLength x = sum [ 1 | _ <- x ]

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) =  myReverse xs ++ [x]

isPalindrom :: (Eq a) => [a] -> Bool
isPalindrom []   = False
isPalindrom [_]  = True
isPalindrom (xs) = if (head xs) == (last xs) then
                        isPalindrom $ tail $ init $ xs
                    else False

checkMore1 :: (Eq a) => [a] -> a -> Bool
checkMore1 (xs) x = length [ k | k <- xs, k == x] > 1

compress :: (Eq a) => [a] -> [a]
compress [] = []
compress (xs) = [k | k <- xs, not (checkMore1 xs k)]