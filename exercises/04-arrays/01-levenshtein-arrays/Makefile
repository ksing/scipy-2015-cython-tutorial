all:
	python setup.py build_ext -if
	mv levenshtein_cython.cpython-36m-x86_64-linux-gnu.so levenshtein_cython.so
	mv levenshtein_cython_solution.cpython-36m-x86_64-linux-gnu.so  levenshtein_cython_solution.so
	python test_levenshtein.py

clean:
	-rm -rf *.c *.so *.pyc build
