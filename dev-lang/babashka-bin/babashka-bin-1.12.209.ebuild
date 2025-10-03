# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Native, fast starting Clojure interpreter for scripting"
HOMEPAGE="https://babashka.org/"
LOC="https://github.com/babashka/babashka/releases/download"
SRC_URI="
	amd64? ( ${LOC}/v${PV}/babashka-${PV}-linux-amd64-static.tar.gz )
	arm64? ( ${LOC}/v${PV}/babashka-${PV}-linux-aarch64-static.tar.gz )
"
S="${WORKDIR}"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE=""
RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""

QA_PREBUILT="/usr/bin/bb"

src_install() {
	dobin bb
}
