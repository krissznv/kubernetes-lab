# Используем базовый образ
FROM python:3.12-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Создаем пользователя с uid 10001 / Добавляем файл с текстом "Hello world"
RUN adduser -D -u 10001 appuser && \
    echo "Hello world" > hello.html && \
    chown -R 10001:10001 /app

USER 10001
# Указываем команду запуска web-сервера
CMD ["python", "-m", "http.server", "8000"]
