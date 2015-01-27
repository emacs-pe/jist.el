CASK    ?= cask
WGET    ?= wget
EMACS   ?= emacs
BATCH    = $(EMACS) --batch -Q -L .
BATCHC   = $(BATCH) -f batch-byte-compile
TESTARGS =

ELS  = jist.el
ELCS = $(ELS:.el=.elc)

.PHONY: all
all: compile README.md

.PHONY: compile
compile: elpa $(ELCS)

elpa: Cask
	$(CASK) install
	touch $@

%.elc: %.el
	$(CASK) exec $(BATCHC) $<

README.md: make-readme-markdown.el $(ELS)
	$(CASK) exec $(BATCH) --script $< <$(ELS) >$@ 2>/dev/null

make-readme-markdown.el:
	$(WGET) -q -O $@ "https://raw.github.com/mgalgs/make-readme-markdown/master/make-readme-markdown.el"

.INTERMEDIATE: make-readme-markdown.el

clean:
	$(RM) $(ELCS)
