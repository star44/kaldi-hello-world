

if [ $# != 1 ]; then
	echo "You must give your desired data folder";
	echo "For example: bash generate-corpus-file.sh digits/data";
	exit 1;
fi


data_folder=$1;

[ ! -d $data_folder/local ] && mkdir $data_folder/local;

utterances=( zero one two three four five six seven eight nine );

for utterance1 in "${utterances[@]}"; do
	for utterance2 in "${utterances[@]}"; do
		for utterance3 in "${utterances[@]}"; do
			echo $utterance1 $utterance2 $utterance3 >> $data_folder/local/corpus.txt;
		done
	done
done

exit 0;
