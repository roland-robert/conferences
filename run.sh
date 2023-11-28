#!/bin/bash

python executor.py create_and_populate_all

uvicorn app.main:app --host 0.0.0.0 --port 80
