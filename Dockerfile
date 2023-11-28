FROM python:3.11

COPY . .

RUN pip install -r requirements.txt

RUN echo lol
RUN ls -la

CMD ["bash", "run.sh"]
