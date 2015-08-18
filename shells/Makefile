install: symlink-bash symlink-fasd symlink-zsh

symlink-bash:
	@[ ! -h ${HOME}/.bashrc ] && \
		ln -s $(realpath bash/bashrc) ${HOME}/.bashrc \
		|| echo "Link .bashrc exists";
	@[ ! -h ${HOME}/.bash_profile ] && \
		ln -s $(realpath bash/bash_profile) ${HOME}/.bash_profile \
		|| echo "Link .bash_profile exists";

symlink-zsh: symlink-oh-my-zsh
	@[ ! -h ${HOME}/.zshrc ] && \
		ln -s $(realpath zsh/zshrc) ${HOME}/.zshrc \
		|| echo "Link .zshrc exists";
	@[ ! -h ${HOME}/.zsh_profile ] && \
		ln -s $(realpath zsh/zsh_profile) ${HOME}/.zsh_profile\
		|| echo "Link .zsh_profile exists";

symlink-oh-my-zsh:
	@[ ! -h ${HOME}/.oh-my-zsh] && \
		ln -s $(realpath zsh/oh-my-zsh) ${HOME}/.oh-my-zsh \
		|| echo "Link .oh-my-zsh exists";

