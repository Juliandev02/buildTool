# Build - A tool to Build something else
=> English

=> Germany

Mit diesen Tool könnt ihr wie bei make, etwas bauen-/kompilieren.
Dazu braucht ihr in der Regel nicht mehr als ein paar Kommandos. Wichtig ist:

- Das der Build File Name (Makefile bei make) make.sh heißen MUSS. Ansonsten geht das nicht. Ihr müsstet dann `build makefile` verwenden.
- Die Shell - Wie immer bei meinen Projekten Bash sein muss. Sonst wirst du das nicht ausführen können

Nun, wie das System funktioniert:
Du brauchst:
- Eine make.sh
- build auf deinen System installiert

In der make.sh muss der Ablauf des Buildens rein.
Anschießend musst du nur `build do` ausführen. Wenn du fertig bist, und willst die builddir löschen, tippe `build clean` ein.

(Achja, ein Xad Package kommt auch noch dafür)
