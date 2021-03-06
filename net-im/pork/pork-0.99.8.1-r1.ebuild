# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit autotools

DESCRIPTION="Console based AIM client that looks like ircII"
HOMEPAGE="http://dev.ojnk.net/"
SRC_URI="mirror://sourceforge/ojnk/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~mips ~ppc ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE="perl"

RDEPEND="
	perl? ( dev-lang/perl )
	sys-libs/ncurses:0=
"
DEPEND="${RDEPEND}"
PATCHES=(
	"${FILESDIR}/${P}-fix-buildsystem.patch"
)

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf $(use_enable perl)
}

src_install() {
	default

	doman doc/pork.1
	insinto /usr/share/pork/examples
	doins examples/blist.txt

	dodoc AUTHORS ChangeLog INSTALL NEWS README STYLE TODO QUICK_START
}
