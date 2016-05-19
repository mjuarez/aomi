all: test package

package:
	python setup.py sdist

test:
	test -d .ci-env || ( mkdir .ci-env && virtualenv .ci-env )
	.ci-env/bin/pip install -r requirements.txt -r requirements-dev.txt
	.ci-env/bin/pep8 aomi

clean:
	rm -rf aomi.egg-info dist
