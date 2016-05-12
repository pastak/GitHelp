# GitHelp

**Gitのコマンドの使いこなしを支援**

### 解決したい問題

* Gitの使い方や引数指定方法がさっぱりわからないこと
* コマンドをどう組み合せれば良いのかわからないこと

たとえば以下のような処理をGitでどう実行するか知りたい

* README.mdは3日前からどう変わった?
* 3日前のREADME.mdを見たい
* package.jsonからcoffeeという名前が消えたのはいつ?
* ここ1週間ぐらい変更されてないファイルは?
* 最近最も大量に修正したファイルはどれだっけ?

### 利用例

* ```README``` ```8``` ```比較``` のような引数を指定して```githelp```コマンドを起動すると以下のような候補リストが提示される

```
$ githelp README 8 比較
[0] 「README.md」ファイルを8分前のものと比較する
   % git diff HEAD "@{8 minutes ago}" README.md
[1] 「README.md」ファイルを8時間前のものと比較する
   % git diff HEAD "@{8 hours ago}" README.md
[2] 「README.md」ファイルを8日前のものと比較する
   % git diff HEAD "@{8 days ago}" README.md
$
```

* ```-x``` オプションで```2```のような数字を指定すると実行できる


```
$ githelp README 8 比較 -x2
diff --git a/README.md b/README.md
index 862f185..34c8907 100644
--- a/README.md
+++ b/README.md
@@ -1,90 +1,3 @@
 # GitHelp
 
-**Gitのコマンドの使いこなしを支援する**
-
-### 解決したい問題
...
```

* ```-i``` オプションを指定すると対話的に選択できる

### インストール

```
% gem install githelp
```

### 実装

* [re_expand](https://github.com/masui/expand_ruby)
という正規表現展開ライブラリを利用
* [```data```](https://github.com/masui/GitHelp/tree/master/data)ディレクトリの下に**問題パタン**と**解決コマンド**を書く
* ワンライナーでは難しい場合は [```exe```](https://github.com/masui/GitHelp/tree/master/exe) の下にヘルパーコマンドを用意する (e.g. [```exe/githelp-changed```](https://github.com/masui/GitHelp/tree/master/exe/githelp-changed) )

### 議論

* オンラインヘルプは役にたたないものと思われているが、本方式ならなんとかなるかもしれないと思っている。
* オンラインヘルプは以下のような問題がある。
 1. **ヘルプエントリがみつからない**
 1. ヘルプでやり方がわかったとしても**パラメタを指定して実行しなおす必要がある**
* どのようなキーワードで検索してもみつかるように**正規表現でいろんな表現を用意**しておき、やり方がわかれば**すぐ実行**できるというのが
本方式の良いところである。
* 「README.mdを消す方法」はマニュアルには書いてない。
「ファイルを消す方法」しか書いてない。
ファイルを消す方法を知った後で「README.md」を指定して実行する必要がある。
* そういえば先日「らくらくホン」画面上の鬱陶しい「羊」を消す方法が全くわからなかったのだが、あれは「マチキャラ」と呼ばれるものなので「マチキャラ」を消すという操作が必要だった。「羊 消す」とか「消す」とかで消せるべきだろう。githelpでは ```$ githelp 削除``` と入力すれば削除関連で何ができるのかわかる。
* ヘルプといえば人工知能的なアプローチの方がトレンドかもしれないが、
本方式だと
自分が何をやりたいのかはっきりわかってない場合でも使えるし、
正しいセンテンスを正確に入力したり発声したりする必要がないから楽だと思う。
予測入力に近いといえるかもしれない。
* 昔[ExpandHelp](http://www.interaction-ipsj.org/archives/paper2012/data/Interaction2012/oral/data/pdf/12INT012.pdf)というシステムを試作してみたが使い勝手がいまひとつだった。
githelpはコマンドラインから使えるし、
実際のGit操作に役にたつので
毎日使えるかもしれない。
* **Gitは単なる適用例であり、広い範囲で使いたいと思っている。**


### お願い

* [データ](https://github.com/masui/GitHelp/tree/master/data)が全然足りないので、足すべきデータを教えて下さい

