@echo off

python -m venv .venv
.\.venv\Scripts\activate
pip install setuptools -r requirements.txt

python setup.py install
python -m glad %*

.\.venv\Scripts\deactivate
