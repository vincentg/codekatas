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
  
  // TODO Generate vocabulary automatically.
  static final def vocabulary = [
    '43556':['hello'],
    '7253':['pale','sake','sale','rake']
  ]
  
  String getDigits(String word) {
    def digits = []
    for (c in word) {
      dictionary.each { key, value ->
        if (value.contains(c))
          digits << key
      }
    }
    return digits.join('')
  }
  
  List getSuggestions(String word) {
    def digits = getDigits(word)
    return vocabulary[digits]
  }
}