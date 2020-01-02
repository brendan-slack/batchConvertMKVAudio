These scripts help automate ffmpeg to do audio codec conversion for mkv files. Please be sure you have ffmpeg installed. I prefer installing ffmpeg via Homebrew for Mac.

Script Placement: Place these scripts in your user home folder (~).

Both scripts will attempt to maintain any/all subtitle tracks that are found within the .mkv file.

There are two files intended for separate scenarios....

Scenario (1)
You have an existing file with compressed video, but only the Surround 5.1 track (Audio 2) needs to be converted to AC3 for compatibility.

For this, use convert_surround_to_AC3.sh, which results in:
>>>Video (COPY)
>>>Audio 1 - Stereo 2.0 AAC (COPY)
>>>Audio 2 - Surround 5.1 AC3


--OR--

Scenario (2)
You have an exisiting file with compressed video, and you need the main audio track to mixdown to Stereo 2.0 while maintaining an alternate Surround 5.1 Audio track.

For this, use mixdown_audio.sh, which results in:
>>>Video (COPY)
>>>Audio 1 - Stereo 2.0 AAC
>>>Audio 2 - Surround 5.1 AC3


USAGE:

From terminal, type the following

~./script_name.sh /Path/To/Target/Folder/ /Path/To/Output/Folder/