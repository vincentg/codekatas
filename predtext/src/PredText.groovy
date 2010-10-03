class PredText {
  
  static final def dictionary =
    [
      2 : ['a', 'b', 'c'],
      3 : ['d', 'e', 'f'],
      4 : ['g', 'h', 'i'],
      5 : ['j', 'k', 'l'],
      6 : ['m', 'n', 'o'],
      7 : ['p', 'q', 'r', 's'],
      8 : ['t', 'u', 'v'],
      9 : ['w', 'x', 'y', 'z']
    ]
  
  // TODO Generate the vocabulary automatically.
  static final def vocabulary = [
    '7253'  : ['pale', 'sake', 'sale', 'rake'],
    '43556' : ['hello'],
  ]
  
  String getDigits(String word) {
    def digits = []
    for (letter in word) {
      dictionary.each { digit, letters ->
        if (letters.contains(letter))
          digits << digit
      }
    }
    return digits.join('')
  }
  
  List getSuggestions(String word) {
    def digits = getDigits(word)
    return vocabulary[digits]
  }
}