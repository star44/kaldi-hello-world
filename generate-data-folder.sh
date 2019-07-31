


if [ $# != 2 ]; then
	echo "You must give your desired data folder and the audio folder you have previously generated";
	echo "For example: bash generate-data-folder.sh digits/data digits/digits_audio";
	exit 1;
fi

data_folder=$1;
audio_folder=$2;

if [ ! -d $data_folder ]; then
	mkdir $data_folder;
fi

if [ ! -d $data_folder/test ]; then
	mkdir $data_folder/test;
fi

if [ ! -d $data_folder/train ]; then
	mkdir $data_folder/train;
fi

if [ ! -f $data_folder/test/spk2gender ]; then
	echo $(ls ${audio_folder}/test) > $data_folder/test/spk2gender;
fi

if [ ! -f $data_folder/train/spk2gender ]; then
	echo $(ls ${audio_folder}/train) > $data_folder/train/spk2gender;
fi

echo "generate-data-folder: You will need to manually annotate the genders in spk2gender";

bash generate-wav-scp-file.sh $data_folder $audio_folder;






