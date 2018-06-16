SHELL = /bin/bash

PY := $(shell which python3)
PYV := $(shell $(PY) --version 2>&1)
PYV_MAJOR := $(word 2,$(subst ., ,$(PYV)))
PYV_MINOR := $(word 3,$(subst ., ,$(PYV)))

SC := ./geojson2java.py

TEST_IN  := test/testInput.geojson
TEST_OUT := test/testOutput.java
GROUND_TRUTH := $(TEST_OUT:=.bak)


.PHONY: pyvchk
pyvchk:
	@echo "Using python in $(shell which $(PY))"
	@test $(PYV_MAJOR) -eq 3 -a $(PYV_MINOR) -ge 6 || \
	  ( echo "Bad Python version, need >= 3.6" && \
	    exit 1 \
	  )


.PHONY: test
test: clean pyvchk
	@$(PY) $(SC) -o $(TEST_OUT) $(TEST_IN)
	@diff $(GROUND_TRUTH) $(TEST_OUT) && \
		echo "Test passed with input $(TEST_IN)."


.PHONY: clean
clean:
	@$(RM) -f $(TEST_OUT)
