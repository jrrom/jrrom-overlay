# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER="1.74.0"

inherit cargo git-r3

DESCRIPTION="Elkowars Wacky Widgets is a standalone widget system made in Rust"
HOMEPAGE="https://elkowar.github.io/eww/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/elkowar/eww.git"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD CC0-1.0 ISC LGPL-3
	Unicode-DFS-2016
"
SLOT="0"
IUSE="X wayland"
REQUIRED_USE="|| ( X wayland )"

RDEPEND="
	dev-libs/glib:2
	dev-libs/libdbusmenu[gtk3]
	x11-libs/cairo[glib]
	x11-libs/gdk-pixbuf:2[jpeg]
	x11-libs/gtk+:3[X?,wayland?]
	x11-libs/pango
	gnome-base/librsvg
	wayland? ( gui-libs/gtk-layer-shell )
"
# transitively hard-depend on xorg-proto due to gdk-3.0.pc
DEPEND="${RDEPEND}
	x11-base/xorg-proto
"
BDEPEND="
	virtual/pkgconfig
"

QA_FLAGS_IGNORED="usr/bin/.*"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	local myfeatures=(
		$(usev X x11)
		$(usev wayland wayland)
	)
	cargo_src_configure --no-default-features
}

src_install() {
	dodoc README.md CHANGELOG.md
	cargo_src_install --path crates/eww
}

pkg_postinst() {
	elog "Eww wont run without a config file (usually in ~/.config/eww)."
	elog "For example configs visit https://github.com/elkowar/eww#examples"
}
