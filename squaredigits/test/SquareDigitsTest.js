load("lib/jsunity-0.6.js")
load("src/SquareDigits.js")

var squareDigitsTests = {
  
  setUp: function() {
    smallestResult = new SquareDigits().smallestResult
  },

  testSmallestResult: function() {
    assertEquals(0, smallestResult(0))
    assertEquals(1, smallestResult(1))
    assertEquals(11, smallestResult(2))
    assertEquals(7, smallestResult(10))
    assertEquals(133, smallestResult(19))
    assertEquals(5, smallestResult(85))
  }
}

jsUnity.attachAssertions()
jsUnity.run(squareDigitsTests)