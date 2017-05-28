all : revealjs

revealjs: draft.md
    bash -c 'pandoc -t revealjs -V transition:fade draft.md -s -o slide2.html'
