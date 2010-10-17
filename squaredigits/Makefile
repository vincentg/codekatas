all: test

clean:

test: clean
	@echo "Testing..."
	@find test/*Test.js -exec v8 $1 '{}' \;

cleanhs:
	rm -rf tesths

tesths: cleanhs
	@echo "launching Haskell implementation tests" 
	mkdir tesths
	cp src/*.hs tesths
	cp test/*.hs tesths
	cd tesths && ghc --make -O2 SquareDigitsTest.hs 
	tesths/SquareDigitsTest
   
  
