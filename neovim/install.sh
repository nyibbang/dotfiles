xdg_config="${XDG_CONFIG_HOME:-${HOME}/.config}"

src="${HOME}/.nvim"
dst="${xdg_config}/nvim"
echo "Creating link ${dst} to ${src}"
ln -sf "${src}" "${dst}"

