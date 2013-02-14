DESCRIPTION="Boost Logging Lib"
HOMEPAGE="http://torjo.com/log2/"
SLOT=0

#SRC_URI="http://torjo.com/code/log2.zip"
#original lib don't compatible with qmule
SRC_URI="https://dl.dropbox.com/s/nycodgwto75j07g/boost-logging.zip"
LICENSE="Boost-1.0"
KEYWORDS="amd64 x86"

DEPEND="dev-libs/boost"
RDEPEND="${DEPEND}"

src_install(){
	insinto /usr/include/boost
#	doins -r logging/boost/*
	doins -r *
}