

if [ $# != 3 ]; then
	echo "You must give your desired data folder and the audio folder you have previously generated";
	echo "For example: bash generate-text-file.sh digits/data digits/digits_audio test";
	exit 1;
fi

data_folder=$1;
audio_folder=$2;
subfolder=$3;

if [ -f $data_folder/$subfolder/text ]; then
	echo "NOTE: $data_folder/$subfolder/text already exists.";
	echo "Make sure that it has the correct content!";
	exit 0;
fi

speakers=$(ls ${audio_folder}/${subfolder});

for speaker in $speakers; do
	for audio_file in $(ls ${audio_folder}/${subfolder}/${speaker}); do
		utterance_id=${speaker}_$(echo $audio_file | cut -d '.' -f 1);
		echo "$utterance_id $audio_file" >> $data_folder/$subfolder/text;
	done
done

exit 0;



