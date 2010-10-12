class PredTextTest extends GroovyTestCase {
  
  def predText =  new PredText()
  
  void testGetDigits() {
    assert predText.getDigits('hello') == '43556'
    assert predText.getDigits('sale') == '7253'
  }
  
  void testGetSuggestions() {
    def suggestions = predText.getSuggestions('43556')
    assert suggestions.contains('hello')
    assert suggestions.contains('geklo')
    assert suggestions.contains('gekko')
    
    suggestions = predText.getSuggestions('7253')
    assert suggestions.contains('sale')
    assert suggestions.contains('rake')
    assert suggestions.contains('pale')
    assert suggestions.contains('ralf')
  }
}