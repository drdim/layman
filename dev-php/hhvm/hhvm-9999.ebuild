# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils cmake-utils
if [ ${PV} = "9999" ]; then
	inherit git-2
fi

DESCRIPTION="HHVM, fast PHP JIT runtime"
HOMEPAGE="https://github.com/facebook/hhvm"
if [ ${PV} = "9999" ]; then
	EGIT_REPO_URI="https://github.com/facebook/hhvm.git"
	EGIT_HAS_SUBMODULES="true"
else
	SRC_URI="https://codeload.github.com/facebook/${PN}/tar.gz/HHVM-${PV} -> ${P}.tar.gz"
fi

LICENSE="PHP-3.01"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

DEPEND="app-arch/bzip2
dev-cpp/glog
dev-cpp/tbb
virtual/mysql
>=dev-libs/boost-1.49
dev-libs/cloog-ppl
dev-libs/elfutils
dev-libs/icu
dev-libs/jemalloc[stats]
dev-libs/libdwarf
dev-libs/libmcrypt
dev-libs/libmemcached
dev-libs/libpcre
dev-libs/libxml2
dev-libs/oniguruma
dev-libs/openssl
dev-util/google-perftools
media-gfx/imagemagick
media-libs/gd[jpeg,png]
net-libs/c-client[kerberos]
net-nds/openldap
sys-devel/gcc[cxx]
sys-devel/binutils
sys-libs/libcap
sys-libs/libunwind
sys-libs/ncurses
sys-libs/readline
sys-libs/zlib"

RDEPEND="${DEPEND}"
CMAKE_IN_SOURCE_BUILD="true"

if [ ${PV} = "9999" ]; then
	S="${WORKDIR}/hhvm-${PV}"
else
	S="${WORKDIR}/hhvm-HHVM-${PV}"
fi

src_prepare() {
	epatch "${FILESDIR}"/libdwarf_location.patch

	# https://github.com/facebook/hhvm/issues/1897
	epatch "${FILESDIR}"/1897_find_imagemagick.patch

	# https://github.com/facebook/hhvm/issues/1236
	epatch "${FILESDIR}"/64bit_mysqlclient.patch
}

src_configure() {
	export HPHP_HOME=$(pwd)

	mkdir customs

	export CMAKE_PREFIX_PATH=$(pwd)
	export LIBRARY_PATH="/usr/include/libdwarf/"

	cd customs
	git clone git://github.com/libevent/libevent.git
	cd libevent
	git checkout release-1.4.14b-stable
	cat ../../hphp/third_party/libevent-1.4.14.fb-changes.diff | patch -p1
	./autogen.sh
	./configure --prefix=$CMAKE_PREFIX_PATH
	make
	make install
	cd ../..

	if [ ! ${PV} = "9999" ]; then
		# Get folly. Move folly to a separate package later.
		cd hphp/submodules || die
		git clone https://github.com/facebook/folly.git
		cd folly
		git checkout a247c8d
		cd ../../..
	fi

	if use debug; then
		CMAKE_BUILD_TYPE="Debug"
	else
		CMAKE_BUILD_TYPE="Release"
	fi

	cmake-utils_src_configure
}

src_install() {
	dobin "${FILESDIR}"/hhvm
	exeinto /usr/share/hhvm
	doexe hphp/hhvm/hhvm

	insinto /usr/share/hhvm
	doins lib/libevent-1.4.so.2*
}
