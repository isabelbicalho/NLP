import sys
from gensim.models import Word2Vec
from gensim.models import KeyedVectors
from random import shuffle
from sklearn.decomposition import PCA
from matplotlib import pyplot

print 'loading'
model = KeyedVectors.load_word2vec_format(sys.argv[1], binary=True)
print 'loaded'

#plot wword embedding
def plot(vocab, X):
  vocab_size = len(vocab)
  # fit a 2d PCA model to the vectors 
  pca = PCA(n_components=2)
  result = pca.fit_transform(X[:2000])
  # create a scatter plot of the projection
  pyplot.scatter(result[:, 0], result[:, 1])
  words = list(vocab)
  for i, word in enumerate(words[:2000]):
    pyplot.annotate(word, xy=(result[i, 0], result[i, 1]))
  pyplot.rcParams['figure.figsize'] = [100,50]
  pyplot.show()

plot(model.wv.vocab, model[model.wv.vocab])
