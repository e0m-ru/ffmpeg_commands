ffmpeg `
-stream_loop -1 `
-i  "C:\Users\e0m\Downloads\test.mov" `
-filter_complex `
'channelsplit=channel_layout=5.0[org][rus][eng][fra][spa]' `
-f mpegts `
-c:v libx264 `
-b:v 5M `
-map 0:v `
-ac 1 `
-c:a aac `
-map '[org]' `
-map '[rus]' `
-map '[eng]' `
-map '[fra]' `
-map '[spa]' `
-metadata:s:a:0 language=org `
-metadata:s:a:1 language=rus `
-metadata:s:a:2 language=eng `
-metadata:s:a:3 language=fra `
-metadata:s:a:4 language=spa `
'srt://localhost:10340'