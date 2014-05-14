##### Colon separated to JSON
Transform colon separated values to JSON:

name: val
mane: lav

To:

"name": "val",
"mane": "lav",

    :'<,'>s/\(.\{-}\):\(.*\)/"\1": "\2",/

#### Delete empty lines
