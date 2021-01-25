######################################################################
# GNU Makefile
######################################################################
VERSION = 1.1.6
PYTHON_VERSION ?= 3.8
TOX_ENV ?= py38
VENV = ./venv

######################################################################
# full test
######################################################################
test: tox robot

######################################################################
# create the virtualenv
######################################################################
$(VENV):
	virtualenv --python=python$(PYTHON_VERSION) $(VENV)
	$(VENV)/bin/python setup.py install

######################################################################
# test with robot
######################################################################
$(VENV)/bin/robot:
	$(VENV)/bin/pip install robotframework

.PHONY += robot
robot: $(VENV) $(VENV)/bin/robot
	export PATH=$${PATH}:$(VENV)/bin; \
	       	$(VENV)/bin/robot tests

######################################################################
# test with tox
######################################################################
$(VENV)/bin/tox:
	$(VENV)/bin/pip install tox

.PHONY += tox
tox: $(VENV) $(VENV)/bin/tox
	$(VENV)/bin/tox -e $(TOX_ENV)

######################################################################
# clean everything
######################################################################
.PHONY += clean
clean:
	git clean -dfx

.PHONY += pypi-test
pypi-test:
	python3 -m build
	python3 -m twine upload --repository testpypi dist/*

.PHONY += pypi
pypi:
	python3 -m build
	python3 -m twine upload --repository pypi dist/*
