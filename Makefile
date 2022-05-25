# This is a Makefile for Inform 10.x project, on Mac.
# INFORM_HOME is where you clone inform, intest and inweb.
INFORM_HOME=~/Documents/private/inform10

# OUTPUT is how you want to name your output file, minus extension.
OUTPUT="My Project"

.DEFAULT_GOAL := blorb

uuid:
	uuidgen | tr -d '\n'> uuid.txt

inform6: 
	${INFORM_HOME}/inform/inform7/Tangled/inform7 -no-progress -project .

glulx: inform6
	${INFORM_HOME}/inform/inform6/Tangled/inform6 -E2wSDG ./Build/auto.inf ./Build/output.ulx

blorb: glulx
	${INFORM_HOME}/inform/inblorb/Tangled/inblorb ./Release.blurb ./Build/output.gblorb
	cp ./Build/output.gblorb ./Release/${OUTPUT}.gblorb

play: blorb
	glulxe ./Release/${OUTPUT}.gblorb

clean:
	@rm -rf Release
	@rm -rf Build
	@rm -rf Index
	@rm -f Metadata.iFiction
	@rm -f Release.blurb
	@rm -f manifest.plist
