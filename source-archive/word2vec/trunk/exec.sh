set -o xtrace
echo "================ vectors_text8S_cbow_window8_size200.bin ==================="
time ./word2vec -train text8S -output vectors_text8S_cbow_window8_size200.bin -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
echo "================ vectors_text8S_cbow_window16_size200.bin ==================="
time ./word2vec -train text8S -output vectors_text8S_cbow_window16_size200.bin -cbow 1 -size 200 -window 16 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
echo "================ vectors_text8M_cbow_window4_size200.bin ==================="
time ./word2vec -train text8S -output vectors_text8M_cbow_window4_size200.bin -cbow 1 -size 200 -window 4 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
echo "================ vectors_text8M_cbow_window8_size200.bin ==================="
time ./word2vec -train text8S -output vectors_text8M_cbow_window8_size200.bin -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
echo "================ vectors_text8M_cbow_window16_size200.bin ==================="
time ./word2vec -train text8S -output vectors_text8M_cbow_window16_size200.bin -cbow 1 -size 200 -window 16 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
echo "================ vectors_text8S_skip-gram_window8_size200.bin ==================="
time ./word2vec -train text8S -output vectors_text8S_skip-gram_window8_size200.bin -cbow 0 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
echo "================ vectors_text8S_skip-gram_window16_size200.bin ==================="
time ./word2vec -train text8S -output vectors_text8S_skip-gram_window16_size200.bin -cbow 0 -size 200 -window 16 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
echo "================ vectors_text8M_skip-gram_window4_size200.bin ==================="
time ./word2vec -train text8S -output vectors_text8M_skip-gram_window4_size200.bin -cbow 0 -size 200 -window 4 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
echo "================ vectors_text8M_skip-gram_window8_size200.bin ==================="
time ./word2vec -train text8S -output vectors_text8M_skip-gram_window8_size200.bin -cbow 0 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
echo "================ vectors_text8M_skip-gram_window16_size200.bin ==================="
time ./word2vec -train text8S -output vectors_text8M_skip-gram_window16_size200.bin -cbow 0 -size 200 -window 16 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
