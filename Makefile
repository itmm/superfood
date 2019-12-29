SRCs:=$(filter-out template/PAGE.html,$(wildcard template/*))
SRCs+=$(wildcard data/*)
DSTs:=$(addprefix build/,$(notdir $(SRCs)))

.PHONY: all clean

all: $(DSTs)

clean:
	rm -f $(DSTs)

build/%: template/%
	cp "$^" "$@"

build/%.html: navigation.html

build/%: data/%
	./expand.sh "$^" <template/PAGE.html >"$@"

