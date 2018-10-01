#! /bin/bash

set -o xtrace

time python test.py vectors_text8S_cbow_window4_size200.bin
time python test.py vectors_text8S_cbow_window8_size200.bin
time python test.py vectors_text8S_cbow_window16_size200.bin
time python test.py vectors_text8M_cbow_window4_size200.bin
time python test.py vectors_text8M_cbow_window8_size200.bin
time python test.py vectors_text8M_cbow_window16_size200.bin
time python test.py vectors_text8_cbow_window4_size200.bin
time python test.py vectors_text8_cbow_window8_size200.bin
time python test.py vectors_text8_cbow_window16_size200.bin
time python test.py vectors_text8S_skip-gram_window4_size200.bin
time python test.py vectors_text8S_skip-gram_window8_size200.bin
time python test.py vectors_text8S_skip-gram_window16_size200.bin
time python test.py vectors_text8M_skip-gram_window4_size200.bin
time python test.py vectors_text8M_skip-gram_window8_size200.bin
time python test.py vectors_text8M_skip-gram_window16_size200.bin
time python test.py vectors_text8_skip-gram_window4_size200.bin
time python test.py vectors_text8_skip-gram_window8_size200.bin
time python test.py vectors_text8_skip-gram_window16_size200.bin
