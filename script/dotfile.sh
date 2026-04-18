if [ -z "$UHOME" ]; then
	exit
fi

run_clone() {
	REPO_URL="$1"
	TARGET_DIR="${UHOME}/$2"
	BRANCH="${3:-master}"

	echo "$REPO_URL"

	if [ ! -d "$TARGET_DIR" ]; then
		"$SUDO" -u "$USER" GIT_CONFIG_GLOBAL=/dev/null "$GIT" clone \
		--depth=1 \
		--branch="$BRANCH" \
		"$REPO_URL" \
		"$TARGET_DIR" &>/dev/null || :
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
	"https://github.com/folke/lazy.nvim.git" \
	".local/share/nvim/lazy/lazy.nvim" \
	"main"

link() {
	SRC="${UHOME}/$1"
	DST="${UHOME}/$2"
	if [ -f "$SRC" ] && [ ! -e "$DST" ]; then
		ln -sf "$SRC" "$DST"
	fi
}

link "conf/dotfiles/gitconfig" ".gitconfig"
