install: install-vim install-ui

clean: clean-vim

install-vim:
	@cd editors; \
	git submodule update --init; \
	make install

clean-vim:
	@cd editors/vim; \
	make clean

install-ui:
	@cd ui; \
	git submodule update --init; \
	make install;
