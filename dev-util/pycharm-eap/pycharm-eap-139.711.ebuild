# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit eutils
#PVERSION="4.0.1"
#EAP=${PV}
LICENSE="Apache-2.0"
DESCRIPTION="PyCharm Community Edition RC. Preview Build 4 version. I't Free."
HOMEPAGE="www.jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/python/pycharm-community-${PV}.tar.gz"

KEYWORDS="~x86 ~amd64"
#KEYWORDS="x86 amd64"

DEPEND=">=virtual/jre-1.6"
RDEPEND="${DEPEND}"
RESTRICT="strip mirror"
SLOT="0"
S=${WORKDIR}
src_install() {
	dodir /opt/${PN}

	insinto /opt/${PN}
	cd pycharm-community*
	doins -r *
	fperms a+x /opt/${PN}/bin/pycharm.sh || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier64 || die "fperms failed"
	fperms a+x /opt/${PN}/bin/inspect.sh || die "fperms failed"
	dosym /opt/${PN}/bin/pycharm.sh /usr/bin/${PN}

	mv "bin/pycharm.png" "bin/${PN}.png"
	doicon "bin/${PN}.png"

	make_desktop_entry ${PN} "${PN}" "${PN}"
}
pkg_postinst() {
	elog "Run /usr/bin/${PN}"
}
