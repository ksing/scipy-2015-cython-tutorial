cdef extern from "levenshtein.h":
    int levenshtein_dist(char *s, char *t)


def levenshtein_distance(bytes s, bytes t):
    cdef int ld = levenshtein_dist(s, t)
    if ld > 0:
        return ld
    else:
        raise RuntimeError('Meh')
