VERSION := $(shell cat ./docs/VERSION)
ARCHIVE := yayfzf-$(VERSION).tar.gz
.PHONY: install clean release archive
.ONESHELL: aur-release

yayfzf: VERSION
	sed -i -e "s/^YAYFZF_VERSION=.*/YAYFZF_VERSION=$(VERSION)/" ./bin/yayfzf

$(ARCHIVE): bin/yayfzf docs/README.md
	git archive --format=tar.gz -o $(ARCHIVE) --prefix yayfzf-$(VERSION)/ $(VERSION)

archive: $(ARCHIVE)

PKGBUILD: VERSION $(ARCHIVE)
	sed -i -e "s/^pkgver=.*/pkgver=$(VERSION)/" PKGBUILD
	sed -i -e "s/^sha256sums=.*/sha256sums=('`sha256sum $(ARCHIVE) | cut -d' ' -f1`')/" PKGBUILD
	makepkg -f

aur-release: PKGBUILD
	git commit -am 'Update PKGBUILD'
	git push origin main
	cp PKGBUILD ~/MYPROJECTS/ConnerWill/yayfzf/PKGBUILD
	cd ~/MYPROJECTS/ConnerWill/yayfzf/
	makepkg -ci
	git commit -am "Release $(VERSION)"
	git push origin main

github-release: ./docs/VERSION ./bin/yayfzf ./docs/README.md
	git commit -am 'Release $(VERSION)'
	git tag $(VERSION)
	git push origin $(VERSION)

release: yayfzf ./docs/README.md github-release

install:
	install -m755 yayfzf /usr/local/bin/

uninstall:
	rm /usr/local/bin/yayfzf
