
python3 -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt

python setup.py install
python -m glad --api gl:core=4.6 --out-path glad.build c

deactivate
