@echo off

>generate.log {
  python3 -m venv .venv
  .\.venv\Scripts\activate
  pip install -r requirements.txt

  python setup.py install
  python -m glad %* --out-path glad.build c

  deactivate
}

