# Commands.
PROLOG := swipl --quiet
RM     := rm -rf
DIFF   := diff -y --suppress-common-lines

# Files.
DATA_01_FILE   := data_08_01.txt
RESULT_01_FILE := result_08_01.txt
ANS_01_FILE    := answer_08_01.txt
SRC_01_FILE    := prog_08_01.pl
PROG_01        := $(PROLOG) $(SRC_01_FILE)
DATA_02_FILE   := data_08_02.txt
RESULT_02_FILE := result_08_02.txt
ANS_02_FILE    := answer_08_02.txt
SRC_02_FILE    := prog_08_02.pl
PROG_02        := $(PROLOG) $(SRC_02_FILE)


.PHONY: run_01 result_01 run_02 result_02 test


run_01: $(SRC_01_FILE) $(DATA_01_FILE)
	$(PROG_01) < $(DATA_01_FILE)

run_02: $(SRC_02_FILE) $(DATA_02_FILE)
	$(PROG_02) < $(DATA_02_FILE)

result_01: $(RESULT_01_FILE)

result_02: $(RESULT_02_FILE)

test: $(ANS_01_FILE) $(RESULT_01_FILE) $(ANS_02_FILE) $(RESULT_02_FILE)
	$(DIFF) $(ANS_01_FILE) $(RESULT_01_FILE)
	$(DIFF) $(ANS_02_FILE) $(RESULT_02_FILE)


$(RESULT_01_FILE): $(SRC_01_FILE) $(DATA_01_FILE)
	$(PROG_01) < $(DATA_01_FILE) > $@

$(RESULT_02_FILE): $(SRC_02_FILE) $(DATA_02_FILE)
	$(PROG_02) < $(DATA_02_FILE) > $@
