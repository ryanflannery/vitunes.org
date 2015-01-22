# includes for generating index.html
SRCS=src/news.html \
	  src/keybindings.html \
	  src/faq.html

# Man page names, file locations, and html output locations.
# This is all highly specific to my build machine.
MANS=vitunes \
	  vitunes-add \
	  vitunes-addurl \
	  vitunes-check \
	  vitunes-flush \
	  vitunes-init \
	  vitunes-rm \
	  vitunes-tag \
	  vitunes-update
MAN_PAGES=$(addprefix /usr/local/man/man1/, $(addsuffix .1,$(MANS)))
MAN_HTML=$(addprefix man/, $(addsuffix .html,$(MANS)))

# options to html5 tidy (to quiet inappropriate warnings)
TIDY_OPTIONS=--drop-empty-elements no


.DEFAULT: index.html

# build main site
index.html: template.index.html ${SRCS}
	cpp -E -CC -P -w template.index.html $@

# build all man page output files
man: $(MAN_HTML)

$(MAN_HTML): $(MAN_PAGES)
	man2web $(subst man/,,$(basename $@)) > $@

# ensure index.html is tidy
# @requires: https://htacg.github.io/tidy-html5
tidy: index.html
	tidy -eq $(TIDY_OPTIONS) $<

# deploy website
deploy: index.html man tidy
	git diff-index --quiet HEAD
	git push

# launch local webserver for testing
# requires npm install [-g] local-web-server
wserve:
	ws
	#python -m SimpleHTTPServer

