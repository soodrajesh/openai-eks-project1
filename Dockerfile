FROM python:3.9-slim

WORKDIR /app

COPY app/src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/src/app.py .

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
