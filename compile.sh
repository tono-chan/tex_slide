#!/usr/bin/env bash
pandoc \
-t revealjs \
-V theme:white \
-V transition:fade \
-V parallaxBackgroundImage:images/books_light.jpg \
draft.md -s -o slide2.html
