# latex ゼミ 2


---

# 本日のスライド

HTML 形式(https://github.com/tono-chan/tex_slide/blob/master/draft.md)

![markdown](./figures/markdown_url.png)

SLIDE 形式(https://tono-chan.github.io/tex_slide/)

![slide](./figures/slide_url.png)

---

# 目次
- LaTeX ってなに？
- LaTeXのコンパイルの仕方
- タイトルの作成
- 概要の作成
- 箇条書き
- 表
- 図
- LaTeX を作るうえでの注意点

---

# LaTeX って何？
TeX とは理系でよく使われる組版言語です．

LaTeX はTeXに対して機能拡張をして使いやすくしたものです．

LaTeX を利用することで整った体裁の文書を作成できます．

---

# 組版って？

組版・・・・印刷を作るときに、どんなサイズの紙に、紙のどのあたりに、どんな文字で、どんな並べ方で、

文字や図版をレイアウトするかといったレイアウト作業

---

# TeX ができた由来
ドナルド・クヌース(Donald Ervin Knuth) って人が自分の本を出版するときに、業者に依頼した組版の出来に不満。

あまりの汚さにブチ切れたクヌース先生が自前で組版するために作ったソフト。

なければ自分で作るってところがプログラマー気質ですよね。

---

# LATEXのコンパイルの仕方
GUIの操作は使用するソフトによって異なるので省略。

コマンドライン操作のみで説明します。

tex ファイルから pdfファイル作成までを記述

---

## platex

使用している文字コードがshift_jisの場合(使用ソフトがL'ecrivain)

```bash
$ platex sample.tex     #dviファイルを作成
$ dvipdfmx sample.dvi   #pdfファイルを作成
```

---

## uplatex
使用している文字コードがutf8の場合(使用ソフトがTexWorks)

```bash
$ uplatex sample.tex     #dviファイルを作成
$ dvipdfmx sample.dvi    #pdfファイルを作成
```

---

## 2回もコンパイルがめんどくさい人向け

shift_jis の場合
```bash
$ ptex2pdf -l sample.tex
```

utf8の場合
```
$ ptex2pdf -u -l sample.tex
```

---

## いちいちコンパイルコマンドを打つのが面倒くさい人向け：下準備
下準備

以下のファイルをユーザーフォルダ直下(compフォルダ)に [.latexmkrc](/distribute/.latexmkrc) という名前で保存

```perl
#!/usr/bin/env perl
$latex            = 'platex -synctex=1 -halt-on-error';
$latex_silent     = 'platex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex           = 'pbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode	  = 3; # generates pdf via dvipdfmx

$ pvc_view_file_via_temporary = 0;
$ pdf_previewer = 'SumatraPDF -reuse-instance'
```

---

## いちいちコンパイルコマンドを打つのが面倒くさい人向け(続き)

tex ファイルを作成した時に以下のコマンドを実行
```bash
$ latexmk -pvc sample.tex
```

latexのコンパイル方法は何通りかあるので興味があれば調べてください。

---

# タイトル

```latex
\documentclass{...}
\title{...}  -+
\author{...}  |プリアンブルに記述
\date{...}   -+
\begin{document}
\maketitle → 本文領域内に記述
```


![タイトル](./figures/title.png)

---

# 概要
論文内容を短くまとめて書いたもの

```latex
\begin{abstract}
この文書ではLaTeXの書き方について説明する。ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ
\noindent
見出し用語:AdaBoost 分類器，網膜画像, 血管分割
\end{abstract}
```

![abstract](./figures/abstract.png)

---

# 数式

```latex
\begin{align}
x^2 + 2x + 1 &= 0
(x + 1)^2 &= 0
\end{align}

文中に数式$x^2 + 2x + 1 = 0$を挿入することもできる．
```

![align](./figures/align.png)

\begin{eqnarray} や \begin{eqnarray*} を使用しているサイトが多いのですが，現在は非推奨です．

---

## 複雑な数式

```latex
\begin{align}
\int_{1}^{4}x dx = \left[ \frac{1}{2}x^2 \right]_1^4
x = \frac{2k + 1}{ \frac{2k}{k^2+5}}\right|
\end{align}
```

![align2](./figures/align2.png)

---

## 数式を書くときの注意点
数式内で英単語を入れたいときはローマン体になるように！(イタリックは基本的に変数扱い)
\mathrm{ローマン体にしたい部分}

```latex
\begin{align}
\times precision &=
\displaystyle \frac{true\ positive}{true\ positive + false\ positive} \nonumber\\
\bigcirc \mathrm{recall} &=
\displaystyle \frac{ \mathrm{true\ positive}}{\mathrm{true\ positive} + \mathrm{false\ negative}} \nonumber
\end{align}
```

![mathrm](./figures/mathrm.png)

---

---

# 表の貼り方

```latex
\section{表の作成}
\begin{table}
  \caption{table sample}
  \label{tb:sample}
  \centering
  \begin{tabular}{lcr}
    \hline
    番号 & 名前 & 点数 \\
    \hline \hline
    1 & 一郎 & 100 \\
    2 & 次郎 & 95 \\
    3 & 三郎 & 60 \\
    \hline
  \end{tabular}
\end{table}
```

---

![table](./figures/table.png)


# 図の貼り方

プリアンブル部(begin{document}の手前)に以下のパッケージを指定
```latex
\usepackage[dvipdfmx]{graphicx}
```

latex を貼りたい場所に書く
``` latex
\section{図の貼り方}
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.5\hsize]{./figures/kendai_a22.jpg}
  \caption{figure sample}
  \label{fig:sample}
\end{figure}
```

![figure](./figures/figure.png)

---

## 図を並べる

```latex
\begin{figure}[htbp]
  \centering
  \begin{minipage}{0.48\hsize}
    \includegraphics[width=\hsize]{./figures/kendai_a22.jpg}
  \end{minipage}
  \begin{minipage}{0.48\hsize}
    \includegraphics[width=\hsize]{./figures/kendai_a22.jpg}
  \end{minipage}
  \caption{2 figures sample}
\end{figure}
```

![figure](./figures/figure2.png)

---

## eps 画像の扱いについて
古いlatexの使い方紹介サイトでは画像を貼るときは，「eps画像に変換して画像を貼りなさい」と書いてあることがある．

最近のlatexは png や jpg 形式の画像でも直接貼れるので，変換する必要はなくなっている(dvipdfmxを使う場合)


---

# latex のエラー修正

---

## よくあるエラー

- Please type another input file name :
ファイル名間違い

- ! Missing $ inserted....? :
$の数の不整合。数式は$$ではさむ。単独の$出力は \$と入れる。

- ! Emergency stop.....l.19 :
19行目が怪しい

- ! Undefined control sequence. l.30 \fotnotetext :
footnotetextの間違い

[LaTeX Manual](http://ribf.riken.jp/apr/guide-jp/LaTeX_Manual-jp.html)

---

## 文字コードのエラー
日本語でlatex を書いているときに問題になるのが文字コードの違い。利用するOSやソフトによってデフォルトの文字コードが異なる。

- Windows : Shift-Jis
- Mac : UTF8
- Linux : UTF8 ( 古いバージョンだと EUC )

---

## ソフトウェアのデフォルトエンコード

ソフトウェアの設定によってデフォルトの文字コードを変更可能だが、ソフトによっても初期設定が異なる。

- L'ecrivain : Shift-Jis
- TeXworks : UTF8

---

### 文字コードの違いで困ること

文字化けする！

L'crivain で作成した tex ファイルを TeXworks で開くと文字化けします。逆もしかり。

適切な文字コードを指定してからファイルを開きなおしてください。

---

## 画像がないとき
デモ

---

# 余白を調節したい
ドキュメントクラスやドキュメントクラスオプションを変更する

簡単な方法
\documentclass[11pt,a4paper]{jarticle}
↓
\documentclass[11pt,a4j]{jsarticle}

自前で細かい単位まで調節したい場合
setlength で調節する．辛い．

---

````
¥documentclass[11pt,a4paper]{jsarticle}

¥setlength{¥textheight}{¥paperheight}   % 紙面縦幅を本文領域にする（BOTTOM=-TOP）
¥setlength{¥topmargin}{4.6truemm}       % 上の余白を30mm（=1inch+4.6mm）に
¥addtolength{¥topmargin}{-¥headheight}  %
¥addtolength{¥topmargin}{-¥headsep}     % ヘッダの分だけ本文領域を移動させる
¥addtolength{¥textheight}{-60truemm}    % 下の余白も30mm（BOTTOM=-TOPだから+TOP+30mm）
¥setlength{¥textwidth}{¥paperwidth}     % 紙面横幅を本文領域にする（RIGHT=-LEFT）
¥setlength{¥oddsidemargin}{-0.4truemm}  % 左の余白を25mm(=1inch-0.4mm)に
¥setlength{¥evensidemargin}{-0.4truemm} %
¥addtolength{¥textwidth}{-50truemm}     % 右の余白も25mm（RIGHT=-LEFT）
¥begin{document}
¥section{セクション}
セクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクションセクション
¥subsection{サブセクション}
サブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクションサブセクション
¥end{document}
````

---

# 課題

- 数式を挿入した文書を作成せよ
- 表を挿入した文書を作成せよ
- 任意の画像を挿入した文書を作成せよ

---

## 参考元

- [latex 入門](https://texwiki.texjp.org/?LaTeX入門)

- [日本人のための LaTeX タブー集 ～画像読込編～](http://qiita.com/zr_tex8r/items/5413a29d5276acac3771)

- [使ってはいけない LaTeX のコマンド・パッケージ・作法](ichiro-maruta.blogspot.jp/2013/03/latex.html)

