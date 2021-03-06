# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5} )

inherit distutils-r1

DESCRIPTION="DevedeNG is a program to create video DVDs and CDs (VCD, sVCD or CVD)"
HOMEPAGE="http://www.rastersoft.com/programas/devede.html"
SRC_URI="https://github.com/rastersoft/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libav"

RDEPEND="dev-python/pycairo[${PYTHON_USEDEP}]
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	x11-libs/gtk+:3
	|| ( media-video/vlc media-video/mpv media-video/mplayer )
	!libav? ( media-video/ffmpeg )
	libav? ( media-video/libav )
	media-video/dvdauthor
	media-video/vcdimager
	virtual/cdrtools
	|| ( app-cdr/brasero app-cdr/k3b )"

DEPEND="${PYTHON_DEPS}"
