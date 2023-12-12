#!/bin/bash

cd /conference_app

#python executor.py create_and_populate_all

uvicorn main:app --host 0.0.0.0 --port 8000 --reload
