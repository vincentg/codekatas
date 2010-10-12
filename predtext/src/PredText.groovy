class PredText {
  
  static final def dictionary =
    [
      '2' : ['a', 'b', 'c'],
      '3' : ['d', 'e', 'f'],
      '4' : ['g', 'h', 'i'],
      '5' : ['j', 'k', 'l'],
      '6' : ['m', 'n', 'o'],
      '7' : ['p', 'q', 'r', 's'],
      '8' : ['t', 'u', 'v'],
      '9' : ['w', 'x', 'y', 'z']
    ]
  
  String getDigits(String word) {
    def digits = ''
    for (letter in word) {
      dictionary.each { digit, letters ->
        if (letters.contains(letter))
          digits += digit
      }
    }
    return digits
  }
  
  List getSuggestions(String digits) {
    def (letters, startIndexes, endIndexes) = initSuggestions(digits)
    def suggestions = [], formatter = new java.text.DecimalFormat(startIndexes)
    0.upto(endIndexes.toInteger()) {
      def word = '', indexes = formatter.format("$it".toInteger())
      for (int i = 0; i < indexes.length(); i++) {
        def index = "${indexes[i]}".toInteger()
        def letter = letters[i][index]
        if (letter != null) word += letter
      }
      if (word.length() == indexes.length())
        suggestions << word
    }
    return suggestions
  }

  private def initSuggestions(digits) {
    def letters = [], startIndexes = '', endIndexes = ''
    for (digit in digits) {
      def options = dictionary[digit]
      letters << options
      startIndexes += 0
      endIndexes += options.size() - 1
    }
    [letters, startIndexes, endIndexes]
  }
}