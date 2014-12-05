EAPI=5
inherit eutils
#EAP='-EAP'
#PVERSION='1'
HOMEPAGE="http://www.syntevo.com/smartgit/"
DESCRIPTION="SmartGit is a Git client with support for GitHub Pull Requests+Comments, SVN and Mercurial."
SRC_URI="http://www.syntevo.com/download/smartgit/smartgit-generic-6_5_1.tar.gz"
PROGNAME="Smartgit"
RESTRICT="strip mirror"
DEPEND=">=virtual/jre-1.6"
SLOT="0"
S=${WORKDIR}
src_install() {
	dodir /opt/${PN}

	cd smartgit*
	insinto /opt/${PN}
	doins -r *

	fperms a+x /opt/${PN}/bin/smartgit.sh || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/add-menuitem.sh || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/remove-menuitem.sh || die "Chmod failed"
	dosym /opt/${PN}/bin/smartgit.sh /usr/bin/${PN}

	mv "bin/smartgit-256.png" "bin/${PN}.png"
	doicon "bin/${PN}.png"
	make_desktop_entry ${PN} "${PN}" "${PN}"
}

pkg_postinst() {
	elog "${PN} installed, run it by icon or /usr/bin/${PN}"
}


