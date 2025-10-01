# Copyright 2025 jrrom

EAPI=8

inherit font

DESCRIPTION="Maple Mono with ligatures"
HOMEPAGE="https://github.com/subframe7536/maple-font/"
LOC="https://github.com/subframe7536/maple-font/releases/download"

SRC_URI="
ttf? ( ${LOC}/v${PV}/MapleMono-TTF.zip )
ttf-hinted? ( ${LOC}/v${PV}/MapleMono-TTF-AutoHint.zip )

nf? ( ${LOC}/v${PV}/MapleMono-NF-unhinted.zip )
nf-hinted? ( ${LOC}/v${PV}/MapleMono-NF.zip )

nf-cn? ( ${LOC}/v${PV}/MapleMono-NF-CN.zip )
nf-cn-hinted? ( ${LOC}/v${PV}/MapleMono-NF-CN-unhinted.zip )
"

# Contains font files directly so no need to specify package directory
S="${WORKDIR}"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~loong ~ppc ~ppc64 ~s390 ~sparc ~x86"
IUSE="+ttf nf nf-cn ttf-hinted nf-hinted nf-cn-hinted"
REQUIRED_USE="^^ ( ttf nf nf-cn ttf-hinted nf-hinted nf-cn-hinted )"
RESTRICT="binchecks strip mirror"
BDEPEND="app-arch/unzip"

FONT_SUFFIX="ttf"
