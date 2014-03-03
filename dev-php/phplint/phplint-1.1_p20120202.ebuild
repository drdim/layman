# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="PHPLint is a validator and documentator for PHP 4 and PHP 5
programs."
HOMEPAGE="http://www.icosaedro.it/phplint/"
SRC_URI="http://www.icosaedro.it/${PN}/${PN}-pure-c-${PV/p/}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/boehm-gc"
RDEPEND="${DEPEND}"

S="${WORKDIR}/phplint-pure-c-${PV/p/}"

src_configure() {
	#Stub, to prevent double configuration, as the compile step will do
	#configuration.
	echo -n;
}

src_compile() {
	./compile
}

src_install() {
	PL_INSTALLPATH=/usr/share/phplint
	rm -rf modules/CVS

	# Overwrite the phpl file with one that has our modules location.
	echo "#!/bin/bash
/usr/share/phplint/phplint --modules-path ${PL_INSTALLPATH}/modules \"\$@\"
" > phpl

	exeinto ${PL_INSTALLPATH}
	insinto ${PL_INSTALLPATH}
	doexe src/phplint
	doins -r modules

	exeinto /usr/bin
	doexe phpl
}
