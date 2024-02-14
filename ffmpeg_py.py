from ffmpeg import FFmpeg


def main():
    ffmpeg = (
        FFmpeg()
        .option("y")
        .input("0",
               video_device_index=1,
               framerate='30',
               f="avfoundation",
               pixel_format="yuv420p",
               to="00:00:05",
        )
        .output(
            "test.mp4",
            {"codec:v": "libx264", 
             "to":"00:00:05",
            },
        )
    )

    ffmpeg.execute()
    # print(' '.join(ffmpeg.arguments))

if __name__ == "__main__":
    main()
