def hamming_sum(char* s0, char* s1):
    cdef:
        int len_s0 = len(s0)
        int len_s1 = len(s1)
    if len_s0 != len_s1:
        raise ValueError()
    return sum(get_count(c0, c1) for (c0, c1) in zip(s0, s1))


cdef int get_count(char c0, char c1):
    cdef int inequality = c0 != c1
    return inequality


cpdef int hamming_loop(char* s0, char* s1):
    cdef:
        int len_s0 = len(s0)
        int len_s1 = len(s1)
    if len_s0 != len_s1:
        raise ValueError()
    cdef:
        int count = 0
        int i
        char s0_i
        char s1_i
    for i in range(len_s0):
        s0_i = s0[i]
        s1_i = s1[i]
        count += s0_i != s1_i
    return count
