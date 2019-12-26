help:
	@printf "Make targets:\\n"
	@printf "\tinstall   - adds dotfiles to system and inits vim\\n"
	@printf "\tuninstall - removes dotfiles from system\\n"

install:
	for x in * .*; do \
		if [ "$$x" != ".git" ] && [ "$$x" != "." ] && [ "$$x" != ".." ]; then \
			ln -s "${CURDIR}${.CURDIR}/$$x" "$$HOME/$$x"; \
			printf "Linking: %s%s/%s\\n" "${CURDIR}" "${.CURDIR}" "$$x"; \
		fi; \
	done
	curl -sfLo "$$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	curl -sfLo "$$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@printf "Launch nvim and vim, then run :PlugInstall\n"

uninstall:
	for x in * .*; do \
		if [ "$$x" != ".git" ] && [ "$$x" != "." ] && [ "$$x" != ".." ]; then \
			rm "$$HOME/$$x"; \
		fi; \
	done