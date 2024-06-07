#!/bin/bash

{
  python3 -m venv .venv
  source .venv/bin/activate
  pip install -r requirements.txt

  python setup.py install
  python -m glad $1

  deactivate

} &> generate-$(date +'%Y%m%d%H%M%S').log
