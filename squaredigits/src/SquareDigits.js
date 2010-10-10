function SquareDigits() {

  Array.prototype.contains = function(obj) {
    var i = this.length
    while (i--) {
      if (this[i] === obj)
        return true
    }
    return false
  }
  
  this.smallestResult = function(n) {
    var x = -1
    while (true) {
      x++
      if (t(x).contains(n))
        return x
    }
  }
  
  var s = function(x) {
    var sum = 0
    var digits = getDigits(x)
    for (var i = 0; i < digits.length; i++) {
      var digit = digits[i]
      sum += Math.pow(digit, 2)
    }
    return sum
  }
  
  var t = function(x) {
    var list = new Array()
    var result = s(x)
    while (!list.contains(result)) {
      list.push(result)
      result = s(result)
    }
    return list
  }
  
  var getDigits = function(x) {
    var digits = new Array(3)
    var xMod100 = mod(x, 100)
    digits[0] = div(x, 100)
    digits[1] = div(xMod100, 10)
    digits[2] = mod(xMod100, 10)
    return digits
  }
  
  var div = function(x, divisor) {
    return Math.floor(x / divisor)
  }
  
  var mod = function(x, divisor) {
    return Math.floor(x % divisor)
  }
}