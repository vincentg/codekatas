import Prerequisites
import Test.HUnit

-- Hardest example from program description
input = ["CSE258: CSE244 CSE243 INTR100","CSE221: CSE254 INTR100","CSE254: CSE111 MATH210 INTR100","CSE244: CSE243 MATH210 INTR100","MATH210: INTR100","CSE101: INTR100","CSE111: INTR100","ECE201: CSE111 INTR100","ECE111: INTR100","CSE243: CSE254","INTR100:"]

result = ["INTR100","CSE101","CSE111","ECE111","ECE201","MATH210","CSE254","CSE221","CSE243","CSE244","CSE258"]
  
test1 = TestCase $ assertEqual "Wrongly sorted classes" result (orderClasses input)

main = runTestTT test1
