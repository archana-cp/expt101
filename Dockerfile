FROM python:3.10
WORKDIR /app
COPY . .
CMD  ["PYTHON","exp10.py"]