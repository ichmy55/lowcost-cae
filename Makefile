#
# 動画を生成する環境 Makefile
#
.ONESHELL:
#
# ターゲット一覧
#
.PHONY: help download
#.PHONY: help up up-package stop down ps bash build lint clean remotebuild remotelint remoteclean localbuild local-lint localclean distclean name localup diff
.DEFAULT_GOAL := help
#
# Docker コマンドマクロ
#
#DOCKER := docker
#
# Latex エンジン
#
#LATEXENG := lualatex
#BIBTEXENG := pbibtex
# 
# Makefileのファイル名
HELPFILE := $(MAKEFILE_LIST)
#
# プロジェクト毎設定の読み込み
#
include variables.mk
#
# ソースファイル一覧
#
#SRCDIR := src/$(DEST_PDF)
#SRCS   := $(wildcard  $(SRCDIR)/*.tex)  $(wildcard  $(SRCDIR)/*.bst)  $(wildcard  $(SRCDIR)/*.bib)
#SRCS2  := $(wildcard  $(SRCDIR)/images/*)
#SRCS3  := $(SRCS) $(SRCS2)
#DOCS   := $(wildcard  docs/*.md)
#
# Makefile内で使用するshellを定義
SHELL=/bin/bash
#
help: ## ヘルプを表示する
	@echo "Command list:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(HELPFILE) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
#
distclean: ## ローカル環境の不要ファイルを全て消す
	cd task/sandbox
	@make distclean
