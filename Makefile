
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

SRCS=src/news.html \
	  src/keybindings.html \
	  src/faq.html

index.html: template.index.html ${SRCS}
	cpp -E -CC -P -w template.index.html $@

mans: $(MANS)

deploy:
	git push

wserve:
	python -m SimpleHTTPServer

$(MANS):
	man2web $@ > $@.html
