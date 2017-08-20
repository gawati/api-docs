#
# WARNING this script expects python 3
# if system has python 2.7 change the script below to have: 
#
#  PY=python
#  PIP=pip
#
#

PY=python
PIP=pip
VENV_PY=venv
APIPY=./$VENV_PY/bin/$PY
APIPIP=./$VENV_PY/bin/$PIP

# install pip
curl -z  -"get-pip.py"  "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
sudo $PY get-pip.py && rm -rf get-pip.py

# install virtualenv
sudo $PIP install virtualenv

# setup virtualenv
virtualenv $VENV_PY

# setup sphinx
$APIPIP install sphinx
$APIPIP install sphinx_rtd_theme

git clone https://github.com/gawati/setup-scripts setup-scripts

cd docs && ../venv/bin/sphinx-apidoc -o source/
