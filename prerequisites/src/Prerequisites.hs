module Prerequisites (
  orderClasses
) where

import Data.Char (String,isSpace)
import Text.Regex
import Data.Maybe (fromJust)
import Data.List (delete) 

data Class a = NoPrereq a | Prereqs a [a] deriving (Eq,Show)
type Clazz = Class (Int,String)

-- Parse String to extract structured class data, example:
-- from "CSE444:" returns NoPrereq (444,"CSE444")
-- from "CSE444: CSE333" returns Prereqs (444, "CSE444") [(333,CSE333)]
extractClass :: String -> Clazz
extractClass clazz = buildPrereq $ filterEmpty $ splitRegex (mkRegex ":") clazz
  where
  extractNum cl = (read.head.fromJust $ matchRegex (mkRegex "([0-9]+)") cl, cl)
  splitPrereqs x = filterEmpty $ splitRegex (mkRegex " ") x 
  buildPrereq (cl:[]) = NoPrereq $ extractNum cl
  buildPrereq (cl:pr) = Prereqs (extractNum cl) $ map extractNum.splitPrereqs $ head pr
  filterEmpty x = filter ((>4).length) x
     
-- delete the prerequisite, example:
-- (333,"CSE333") (Prereqs (444, "CSE444") [(333,"CSE333"))] returns NoPrereq (444,"CSE444")
delPrereq :: (Int,String) -> Clazz -> Clazz
delPrereq a (Prereqs x as)   
  | a `elem` as = if length as == 1
                     then NoPrereq x              -- last prerequisite deleted, now NoPrereq
                     else Prereqs x $ delete a as -- drop the prereq
  | otherwise = Prereqs x as 
delPrereq _ x = x

-- Find the Minimum class (first by number, then by string) which has no prerequisites,
-- then delete it from the list of classes and recurse
-- Thus, this function returns the list of classes to be taken in correct order, yay !
extractMin :: [Clazz] -> [String] 
extractMin [] = []
extractMin cls = snd bestClass:extractMin (map (delPrereq bestClass) $ delete (NoPrereq bestClass) cls)
  where
  bestClass = minimum $ map getPrereq $ filter hasNoPrereq cls 
  getPrereq (NoPrereq x) = x
  hasNoPrereq (NoPrereq _) = True
  hasNoPrereq _ = False 

-- Extract the [String] to [Clazz] then pass the [Clazz] to extractMin to get the ordered classes
orderClasses :: [String] -> [String]
orderClasses str = extractMin $ map extractClass str 

