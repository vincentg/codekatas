class PredTextTest extends GroovyTestCase {
  
  def predText =  new PredText()
  
  void testGetDigits() {
    assert predText.getDigits('hello') == '43556'
  }
  
  void testGetSuggestions() {
    def suggestions = predText.getSuggestions('rake')
    assert suggestions.contains('pale')
    assert suggestions.contains('sake')
    assert suggestions.contains('sale')
    assert suggestions.contains('rake')
  }
}