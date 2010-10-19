all: tesths

cleanhs:
	rm -rf tesths

tesths: cleanhs
	@echo "launching Haskell implementation tests" 
	mkdir tesths
	cp src/*.hs tesths
	cp test/*.hs tesths
	cd tesths && ghc --make -O2 PrerequisitesTest.hs 
	tesths/PrerequisitesTest
   
  
