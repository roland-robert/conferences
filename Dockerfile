FROM python:3.11

RUN mkdir conference_app

COPY requirements.txt /conference_app/
COPY main.py executor.py run.sh settings.py /conference_app/
COPY orm_sqlalchemy /conference_app/orm_sqlalchemy
COPY api  /conference_app/api
COPY pydantic_models  /conference_app/pydantic_models

RUN pip install -r /conference_app/requirements.txt

CMD ["bash", "/conference_app/run.sh"]
