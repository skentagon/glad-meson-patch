@REM @echo off

if exist .venv/Scripts/python.exe python (echo "" > generate.log;) else (-m venv .venv > generate.log;)

pip install setuptools -r requirements.txt >> generate.log
python setup.py install >> generate.log

python -m glad %* >> generate.log
