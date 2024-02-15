ffmpeg `
-hide_banner -loglevel error `
-filter_complex "[0]channelsplit=channel_layout=5.0[org][rus][eng][frn][esp]" `
-f dshow `
-video_size 1920x1080 `
-pixel_format  uyvy422 `
-framerate 25 `
-rtbufsize 1000M `
-channels 8 `
-i video="Decklink Video Capture (2)":audio="Decklink Audio Capture (2)" `
-c:v libx264 `
-b:v 5M `
-c:a aac -ac 1 `
-b:a 128k `
-metadata:s:a:0 language=org `
-metadata:s:a:1 language=rus `
-metadata:s:a:2 language=eng `
-metadata:s:a:3 language=frn `
-metadata:s:a:4 language=eps `
-map 0:v `
-map [org] `
-map [rus] `
-map [eng] `
-map [frn] `
-map [esp] `
-f mpegts `
'srt://pub1.rtmp.s01.l.mid.cdnvideo.ru:10340?passphrase=160121g9Ym43XDjE&metadata="������ ������"' `



-------------------------------------------


ffmpeg `
-f dshow `
-video_size 1920x1080 `
-pixel_format  uyvy422 `
-framerate 25 `
-rtbufsize 1000M `
-channels 5 `
-i video="Decklink Video Capture (2)":audio="Decklink Audio Capture (2)" `
-filter_complex "[0:a]channelsplit=channel_layout=5.0[org][rus][eng][frn][esp]" `
-f mpegts `
-c:v libx264 `
-c:a aac `
-map 0:v `
-map [org] `
-map [rus] `
-map [eng] `
-map [frn] `
-map [esp] `
'srt://localhost:10340'

-------------------------------------------


ffmpeg `
-f dshow `
-video_size 1920x1080 `
-pixel_format  uyvy422 `
-framerate 25 `
-rtbufsize 100M `
-channels 8 `
-c:a pcm_s16le `
-sample_fmt s16 `
-ar 48000 `
-i video="Decklink Video Capture (2)":audio="Decklink Audio Capture (2)" `
-filter_complex "[0:a]channelsplit=channel_layout=5.0[FL][FR][FC][BL][BR]" `
-f mpegts `
-map 0:v `
-c:a copy `
-map [FL] `
-map [FR] `
-map [FC] `
-map [BL] `
-map [BR] `
'srt://localhost:10340'