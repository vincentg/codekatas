module Prerequisites (
  orderClasses
) where

import Data.Char (String,isSpace)
import Text.Regex
import Data.Maybe (fromJust)


data Class a = NoPrereq a 
             | Prereqs a [a]
     deriving (Show)

type Clazz = Class (String,Int)

rInt:: String -> Int
rInt = read	

removeSp x = filter (not.isSpace) x 

extractClass :: String -> Clazz
extractClass clazz = buildPrereq $ splitRegex (mkRegex ":") clazz
  where
  intRegex = mkRegex "([0-9]+)"
  splitNameNumber cl = (removeSp cl, rInt.head.fromJust $ matchRegex intRegex cl)
  splitPrereqs x = filter ((>4).length) $ splitRegex (mkRegex " ") x 
  buildPrereq (cl:[]) = NoPrereq $ splitNameNumber cl
  buildPrereq (cl:prereqs) = Prereqs (splitNameNumber cl) $ map splitNameNumber $ splitPrereqs $ head prereqs
     

nextClass :: [Clazz] -> [Clazz] -> Clazz
nextClass ::

orderClasses :: [String] -> [String]
orderClasses str = str 
   where
   classes = map extractClass str
