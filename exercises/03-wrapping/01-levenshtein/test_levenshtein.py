from timeit import timeit

N = 200000

print("*" * 80)
print("wrapped levenshtein(): %.4f" % timeit("levenshtein_distance(b'kitten', b'sitting')",
                                        "from levenshtein_cython import levenshtein_distance",
                                         number=N))
print("solution levenshtein(): %.4f" % timeit("levenshtein_distance(b'kitten', b'sitting')",
                                        "from levenshtein_solution import levenshtein_distance",
                                        number=N))
print("*" * 80)
