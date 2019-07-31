

[ ! -d audio ] && mkdir audio;

speakers=(Alex Daniel Karen Samantha Moira Veena Victoria);

for speaker in ${speakers[@]}; do
	[ ! -d audio/$speaker ] && mkdir audio/$speaker;
	for word1 in {0..9}; do
		for word2 in {0..9}; do
			for word3 in {0..9}; do
				say --voice=$speaker --output-file=audio/$speaker/${word1}_${word2}_${word3} "$word1, $word2, $word3";
			done
		done
	done
done
exit 0;



