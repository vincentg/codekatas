module SquareDigits ( 
  smallestResult
) where

import Data.Char (digitToInt)
import Data.Maybe (fromJust)
import Data.List (findIndex)

t n = decycle [] (iterate s $ s n)
  where
     digits n  = map digitToInt $ show n
     s x = sum $ map (^2) $ digits x
     decycle xh (x : xs) = if x `elem` xh then [] else x : decycle (x : xh) xs

smallestResult :: Int -> Int 
smallestResult n = fromJust $ findIndex (\x -> n `elem` t x) [0..]
