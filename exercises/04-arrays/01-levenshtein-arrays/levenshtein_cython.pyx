"""
def levenshtein_distance(s[1..m], char t[1..n]):
  // for all i and j, d[i,j] will hold the Levenshtein distance between
  // the first i characters of s and the first j characters of t;
  // note that d has (m+1)*(n+1) values
  declare int d[0..m, 0..n]

  set each element in d to zero

  // source prefixes can be transformed into empty string by
  // dropping all characters
  for i from 1 to m:
      d[i, 0] := i

  // target prefixes can be reached from empty source prefix
  // by inserting every character
  for j from 1 to n:
      d[0, j] := j

  for j from 1 to n:
      for i from 1 to m:
          if s[i] = t[j]:
            d[i, j] := d[i-1, j-1]              // no operation required
          else:
            d[i, j] := minimum(d[i-1, j] + 1,   // a deletion
                               d[i, j-1] + 1,   // an insertion
                               d[i-1, j-1] + 1) // a substitution

  return d[m, n]
"""
import cython
import numpy as np


@cython.boundscheck(False)
@cython.wraparound(False)
cpdef int levenshtein_distance(char *s, char *t):
    # for all i and j, d[i,j] will hold the Levenshtein distance between
    # the first i characters of s and the first j characters of t;
    # note that d has (m+1)*(n+1) values
    cdef:
        int i, j
        int m = len(s)
        int n = len(t)
        int[:, ::1] d = np.zeros((m+1, n+1), dtype=np.int32)

    # source prefixes can be transformed into empty string by
    # dropping all characters
    for i in range(1, m+1):
        d[i, 0] = i

    for j in range(1, n+1):
        d[0, j] = j

    for j in range(1, n+1):
        for i in range(1, m+1):
            if s[i-1] == t[j-1]:
                d[i, j] = d[i-1, j-1]
            else:
                d[i, j] = min(d[i-1, j], d[i, j-1], d[i-1, j-1]) + 1
    return d[m, n]
