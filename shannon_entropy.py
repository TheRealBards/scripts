import math
def getEntropy(somestring):
  baseent=0.0
  lettersinthing=set(somestring)
  for eachletter in lettersinthing:
    letent = somestring.count(eachletter)/float(len(somestring))
    letent=letent*math.log(letent, 2)
    baseent+=letent
  return -1*baseent
