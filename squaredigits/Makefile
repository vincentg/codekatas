all: test

clean:
	@rm -rf build

test_js: clean
	@echo "Testing JavaScript..."
	@find test/*Test.js -exec v8 $1 '{}' \;
	
test_hs: clean
	@echo "Testing Haskell..." 
	@mkdir build && cp **/*.hs build
	@cd build && find *Test.hs -exec ghc --make -O2 $1 '{}' \;
	@find **/*Test -exec $1 '{}' \;

test: clean test_js test_hs