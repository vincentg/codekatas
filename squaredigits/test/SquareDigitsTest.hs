import Test.HUnit
import Data.List
import SquareDigits

-- Test typical cases (from the js test)
test1 = TestCase $ assertEqual "Unexpected result"
             [0,1,11,7,133,5] (map smallestResult [0,1,2,10,19,85])

-- Test more heavy computation
test2 = TestCase $ assertEqual "HeavyLoad Unexpected result" 
             99999 (smallestResult 405)

tests = TestList [TestLabel "ResultSet" test1, TestLabel "HeavyLoad" test2]

main = runTestTT tests
