import unittest

from howeasy.howeasy import HowEasy

class HowEasyTest(unittest.TestCase):
  
  def test_point_val(self):
    howeasy = HowEasy()
    assert howeasy.point_val('This is a problem statement') == 500
    assert howeasy.point_val('523hi.') == 250
    assert howeasy.point_val('Implement a class H5 which contains some method.') == 500
    assert howeasy.point_val('Searching') == 1000
    assert howeasy.point_val(' no9 . wor7ds he8re. hj..') == 250