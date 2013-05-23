UTIL_FILES = Prime.hs Math.hs
SOLUTIONS = $(filter-out $(UTIL_FILES), $(wildcard *.hs))
PROBLEMS_SOLVED = $(SOLUTIONS:%.hs=%)
EXECUTABLES = $(PROBLEMS_SOLVED:%=%.exe)
TESTS       = $(PROBLEMS_SOLVED:%=%.test)
TIMED       = $(PROBLEMS_SOLVED:%=%.timed)

exes:  $(EXECUTABLES)
tests: $(EXECUTABLES) $(TESTS)
timed: $(EXECUTABLES) $(TIMED)

clean:
	rm -f *.o *.hi *.exe

%.test: %.exe
	@printf "%s %s\n" $* $(shell ./$<)

%.timed: %.exe
	@printf "%s %s\n" $* "$(shell /usr/bin/time ./$<)"

%.exe: %.hs
	ghc -O3 -o $@ -i.. $<