all: test

clean:

test: clean
	@echo "Testing..."
	@find test/*Test.js -exec v8 $1 '{}' \;