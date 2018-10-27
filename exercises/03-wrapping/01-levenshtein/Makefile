all:
	python setup.py build_ext -if
	mv levenshtein_cython.cpython-36m-x86_64-linux-gnu.so levenshtein_cython.so
	mv levenshtein_solution.cpython-36m-x86_64-linux-gnu.so levenshtein_solution.so
	python test_levenshtein.py

clean:
	-rm -rf build *.so build *.pyc levenshtein_cython.c levenshtein_solution.c
