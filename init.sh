#!/usr/bin/env bash
DOT_DIRECTORY=${HOME}/git/dotfiles
cd ${DOT_DIRECTORY}

for f in .??*
do
    # 無視したいファイルやディレクトリはこんな風に追加してね
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done
echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
