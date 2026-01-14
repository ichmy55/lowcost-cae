#
# 動画を生成する環境 Makefile
#
.ONESHELL:
#
# ターゲット一覧
#
.PHONY: help boot download clean distclean
.DEFAULT_GOAL := help
#
# Makefileのファイル名
HELPFILE := $(MAKEFILE_LIST)
#
# プロジェクト毎設定の読み込み
#
include ../../variables.mk
include ./variables.mk
#
# Makefile内で使用するshellを定義
SHELL=/bin/bash
#
help: ## ヘルプを表示する
	@echo "Command list:"
	@echo $(HELPFILE)
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(HELPFILE) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
#
boot: ## sandboxの起動
	@echo "Sandbox boot!:"
	@make clean
	cd $(ROOT_DIR)
	cmd.exe /c "sandbox.wsb"
	cd $(DOWNLOAD_DEST)
	sleep 3
	./uwscr.exe ../script/change_size.uws
#
download: ## uwscrをネットからダウンロードする
	@echo "Donwnload!:"
	cd $(DOWNLOAD_DEST)
	@if [ ! -e ./uwscr.exe ]; then
		wget -N $(UWSCR_URL)
		unzip UWSCRx64.zip
	fi

clean: ## ローカル環境のファイルを掃除し、再度持ち上げ
	@echo "clean!:"
	rm -rf $(SCRIPT_DEST)/*
	rm -rf $(OUTPUT_DEST)/*
	rm -rf $(ROOT_DIR)/*.wsb
	@make download
	cp sandbox.wsb $(ROOT_DIR)
	cp sandstart.cmd $(SCRIPT_DEST)
	cp uwscr/* $(SCRIPT_DEST)
	mkdir $(SCRIPT_DEST)/keyimage
	cp -L keyimage/* $(SCRIPT_DEST)/keyimage/
#nkf -Lw -s uwscr/down_prepo.uws > $(ROOT_DIR)/script/down_prepo.uws
#
distclean: ## ローカル環境のファイルをいったん全消し
	@echo "Dist clean!:"
	rm -rf $(ROOT_DIR)/*
	mkdir  $(DOWNLOAD_DEST)
	mkdir  $(SCRIPT_DEST)
	mkdir  $(OUTPUT_DEST)
