from timeit import timeit

import levenshtein
import levenshtein_cython
import levenshtein_cython_solution

def test(func):
    assert func(b"kitten", b"sitting") == 3
    assert func(b"sitting", b"kitten") == 3
    assert func(b"", b"asdf") == 4
    assert func(b"jkl;", b"") == 4
    assert func(b"", b"") == 0
    assert func(b"qwerty", b"qwerty") == 0

test(levenshtein.levenshtein_distance)
test(levenshtein_cython.levenshtein_distance)
test(levenshtein_cython_solution.levenshtein_distance)

N = 20000

print("*" * 80)
print("python levenstein(): %.3f" % timeit("levenshtein_distance(b'kitten', b'sitting')",
                                           "from levenshtein import levenshtein_distance",
                                           number=N))
print("cython levenstein(): %.3f" % timeit("levenshtein_distance(b'kitten', b'sitting')",
                                           "from levenshtein_cython import levenshtein_distance",
                                           number=N))
print("optimized levenstein(): %.3f" % timeit("levenshtein_distance(b'kitten', b'sitting')",
                                           "from levenshtein_cython_solution import levenshtein_distance",
                                           number=N))
print("*" * 80)

