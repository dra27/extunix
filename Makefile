build:
	dune build @install

clean:
	dune clean

doc:
	dune build @doc

test:
	dune runtest

VERSION=0.2.0
NAME=ocaml-extunix-$(VERSION)

release:
	git tag -a -m $(VERSION) v$(VERSION)
	git archive --prefix=$(NAME)/ v$(VERSION) | gzip > $(NAME).tar.gz
	gpg -a -b $(NAME).tar.gz

dune-release:
	dune-release tag
	dune-release

.PHONY: build clean doc release dune-release test
