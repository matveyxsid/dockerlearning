from flask import Flask, jsonify
import psycopg2
import socket
import os

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify({"message": "API работает!"})

@app.route('/status')
def status():
    # Получаем имя хоста для идентификации контейнера
    hostname = socket.gethostname()
    
    # Проверяем соединение с базой данных
    db_status = "недоступна"
    try:
        # Попытка подключения к базе данных
        conn = psycopg2.connect(
            host=os.environ.get("DB_HOST", "db"),
            database=os.environ.get("DB_NAME", "postgres"),
            user=os.environ.get("DB_USER", "postgres"),
            password=os.environ.get("DB_PASSWORD", "postgres")
        )
        conn.close()
        db_status = "доступна"
    except Exception as e:
        db_status = f"недоступна: {str(e)}"
    
    return jsonify({
        "status": "ok",
        "container": hostname,
        "db_status": db_status
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
