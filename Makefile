SESS=14-15

new: next

#UGONLY=-u
UGONLY=

next: reps

DDIR=$(SESS)/teaching-data
RDIR=$(SESS)/reps
DATA=$(DDIR)/cu-staff.csv $(DDIR)/cu-title.csv $(DDIR)/staff.csv $(DDIR)/cu-issues.csv	$(DDIR)/notes.tex $(DDIR)/cu-alias.csv

reps: $(RDIR)/cu-staff.pdf 
	open $(RDIR)/cu-staff.pdf 

$(RDIR)/%.pdf: $(DATA) sum-teach
	@./sum-teach $(UGONLY) $(SESS)

print:	reps
	@lpr $(RDIR)/cu-staff.pdf
	@lpr $(RDIR)/staff-by-name.pdf
	@lpr $(RDIR)/staff-by-tot.pdf

comp:
	@./cmp-alloc

issues:	reps
	@cat $(SESS)/reps/cu-issues.txt

clean:
	rm -f $(RDIR)/*.pdf $(RDIR)/*.tex

zip: 
	zip -j reps.zip $(RDIR)/cu-staff.pdf $(RDIR)/staff-by-name.pdf $(RDIR)/staff-by-tot.pdf

