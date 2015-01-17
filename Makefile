
# raw man page names
MANS=vitunes \
	  vitunes-add \
	  vitunes-addurl \
	  vitunes-check \
	  vitunes-flush \
	  vitunes-init \
	  vitunes-rm \
	  vitunes-tag \
	  vitunes-update

# regenerate all html for man pages
all: $(MANS)

wserve:
	python -m SimpleHTTPServer

$(MANS):
	man2web $@ > $@.html
