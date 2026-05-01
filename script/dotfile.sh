if [ -z "$UHOME" ]; then
	exit
fi

md() {
	"$SUDO" -u "$USER" mkdir -p "${UHOME}/$1"
}

run_clone() {
	REPO_URL="$1"
	TARGET_DIR="${UHOME}/$2"
	BRANCH="${3:-master}"

	if [ ! -d "$TARGET_DIR" ]; then
		echo "git clone ${REPO_URL}[$BRANCH] -> $TARGET_DIR"
		"$SUDO" -u "$USER" GIT_CONFIG_GLOBAL=/dev/null "$GIT" clone \
		--depth=1 \
		--branch="$BRANCH" \
		"$REPO_URL" \
		"$TARGET_DIR" &>/dev/null || :
	fi
}

link() {

	SRC="${UHOME}/$1"
	DST="${UHOME}/$2"
	if [ ! -e "$SRC" ]; then
		>&2 echo "source file $SRC not found"
		exit
	fi
	if [ ! -e "$DST" ]; then
		echo "link file $SRC -> $DST"
		md "$(dirname "$2")"
		"$SUDO" -u "$USER" ln -sf "$SRC" "$DST"
	fi
}

run_clone \
	"https://github.com/zhengkai/conf.git" \
	"conf" \
	"nix"

run_clone \
	"https://github.com/zhengkai/nvim.git" \
	".config/nvim"

run_clone \
	"https://github.com/zhengkai/build.git" \
	"build" \
	"nix"

run_clone \
	"https://github.com/folke/lazy.nvim.git" \
	".local/share/nvim/lazy/lazy.nvim" \
	"main"

link "conf/dotfiles/other/wezterm.lua" ".config/wezterm/wezterm.lua"
link "conf/dotfiles/gitconfig" ".gitconfig"
link "conf/dotfiles/other/tigrc" ".config/tig/config"
link "conf/waybar" ".config/waybar"

md "dev/curl"
link "conf/dotfiles/curlrc" ".curlrc"

VENV="dev/venvs/default"
HVENV="${UHOME}/$VEHV"
if [ ! -e "$HVENV" ]; then
	md "$VENV"
	"$SUDO" -u "$USER" python -m venv
fi

if [ -e "/run/current-system/sw/bin/hyprland" ]; then
	link "conf/hypr/other/hyprland.conf" ".config/hypr/hyprland.conf"
	link "conf/hypr/other/hypridle.conf" ".config/hypr/hypridle.conf"
fi
