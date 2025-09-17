Fork from VD42

添加了一个过滤功能

当使用
.\UE4TextExtractor content game.locres -raw-text-signatures=Package

在后面添加 -Filter

.\UE4TextExtractor content game.locres -raw-text-signatures=Package -Filter

可过滤部分垃圾文本 默认过滤纯数字。纯符号，{}圈住的部分文本，一些符号+单个字母的文本，伪拉丁文，带“_“的文本。

防止误删文本，可以在 protect_words.csv 内添加不删除的文本 支持正则搜索

不导出的文本例子

/01972C5C4BB6CAD4A5272F99CC4913F1 {HH}:{MM}
/02086D7F4E204799257EAAB07DCD1BD6 MissionName
/12C057654C88533F52266D8D318FA1CF LostItem
/12ED557745EEB4B0C86536ADDB29824F 200
/1931FA0D45D292CECB6FF381C1645B04 {name} : {value}
/1984F6194DA94BACE332C3BD44F8827A 1
/F8908B9D4E2351ECF67648B419D293E4 --
EnglishSource/1B441C5B44CEB557A32DEE9BE9162A98 UNPSC Lorem ipsum dolor sit amet....
EnglishSource/C87FB08D4B446D871EF5048168D81F2E +P
/2A0539A2450033DB8A22ED9DAFABE590 Title_SpecialColor_04



# UE4TextExtractor

Extract localizable text from .uasset, .uexp and .umap files and convert locres to txt and backward.
  
#### Usage  

Extract localizable texts to locres or txt file:  
`UE4TextExtractor.exe <path to folder with extracted from pak files> <path to texts.locres file> [-old] [-raw-text-signatures=<signature1>,<signature2>,...] [-all-uexps]`  
`UE4TextExtractor.exe <path to folder with extracted from pak files> <path to texts.txt file> [-raw-text-signatures=<signature1>,<signature2>,...] [-all-uexps] [-src]`  
Example: `UE4TextExtractor.exe "C:\MyGame\Content\Paks\unpacked" "C:\MyGame\Content\Paks\texts.locres"`  
  
Use `-raw-text-signatures=<signature1>,<signature2>,...` (or `-raw-text-signatures=all` if you don't want to go into detail, but it's not recommended) modifier for parsing localizable text by custom signatures. See also: [here](https://github.com/VD42/UE4TextExtractor/blob/master/RAW_TEXT_SIGNATURES.md).  
Use `-all-uexps` modifier for additionaly parsing uexp files without matching uasset or umap files.  
Use `-src` modifier to add string source information (filenames) to the txt file.  
  
Convert locres to txt or backward:  
`UE4TextExtractor.exe <path to texts.txt file> <path to texts.locres file> [-old]`  
`UE4TextExtractor.exe <path to texts.locres file> <path to texts.txt file>`  
Example: `UE4TextExtractor.exe "C:\MyGame\Content\Paks\texts.txt" "C:\MyGame\Content\Paks\texts.locres" -old`  
  
Use `-old` modifier for old-version locres file generation.  
  
Add or replace all texts from one txt to another:  
`UE4TextExtractor.exe <path to source_texts.txt file> <path to destination_texts.txt file>`  
Example: `UE4TextExtractor.exe "C:\MyGame\Content\Paks\en_texts.txt" "C:\MyGame\Content\Paks\cn_texts.txt"`
