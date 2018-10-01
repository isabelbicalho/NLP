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

file = open('questions-words.txt', 'r')
lines = file.read().splitlines()
lines = [line for line in lines if not line.startswith(':')]
i = 0
total = 0
better_distance = (999999.0, None, None, None, None, None)
worst_distance  = (0.0, None, None, None, None, None)
random_list = []
distancia_media = []
for line in lines:
    a, b, c, d = line.split()
    try:
        top1 = model.wv.most_similar(positive=[b, c], negative=[a], topn=1)
        allScores = model.wv.most_similar(positive=[b, c], negative=[a], topn=False)
        scoreTop1 = top1[0][1]
        correctScore = allScores[model.wv.vocab[d].index]
        distance = scoreTop1 - correctScore
        # print "{} {} {} expected {} / {} output {} / {} distance {}".format(a,b,c,d,correctScore, top1[0][0], scoreTop1, distance)
        random_list.append((a,b,c,d,top1[0][0], round(distance,2)))
        if distance > worst_distance[0]:
            worst_distance = (round(distance,2), a,b,c,d,top1[0][0])
        if distance < better_distance[0]:
            better_distance = (round(distance,2), a,b,c,d,top1[0][0])
        if distance < 0.01:
            i = i + 1
        total = total + 1
        distancia_media.append(distance)
    except KeyError:
        pass

distancia_media = sum(distancia_media)/len(distancia_media)
print sys.argv[1]
print float(i)/float(total)
print 'better_distance = {}'.format(better_distance)
print 'worst_distance = {}'.format(worst_distance)
print 'distancia media = {}'.format(round(distancia_media, 2))
ret = model.accuracy('questions-words.txt')
total1 = ret[len(ret)-1]
assert total1['section'] == 'total'
total2 = len(total1['incorrect']) + len(total1['correct'])
acc = 1.0 * len(total1['correct'])/total2
print 'acuracia = {}'.format(round(acc,2))

#shuffle(random_list)
#random_list = random_list[:5]
#print ' & '.join(map(str, random_list))
#for tup in random_list:
#    print '\hline\n&&\\\\[-2ex]\n' + ' & '.join(map(str, tup)) + '\\\\[0.5ex]'
#import pdb; pdb.set_trace()
#plot(model.wv.vocab, model[model.wv.vocab])
