# Лабораторная работа: Деплой Docker-контейнера и Kubernetes

## Описание
Цель лабораторной работы — развернуть простое веб-приложение на основе Python с использованием Docker и Kubernetes. 
Работа выполнялась в среде OrbStack. https://orbstack.dev/

---

## Ход выполнения

### 1. Написание и сборка Dockerfile
Был написан и собран Dockerfile. Образ создан с помощью команды:
```shell
docker build -t web:1.0.0 .
```

### 2. Запуск и проверка Docker-образа
Контейнер запущен и проверен:
```shell
docker run --name web -d -p 8000:8000 web:1.0.0
```

Приложение успешно отвечает на запросы.

---

### 3. Запуск Kubernetes в OrbStack
Kubernetes-кластер запущен в OrbStack для дальнейшего развертывания манифестов.

---

### 4. Написание манифестов Deployment и Service
Созданы манифесты Deployment и Service для развертывания веб-приложения и публикации сервиса.
Deplyment.yaml
Service.yaml

---

### 5. Создание namespace и развертывание манифестов
Создан namespace web, после чего выполнено развертывание:
```shell
kubectl create ns web
kubectl apply -f Deployment.yaml -n web
kubectl apply -f Service.yaml -n web
```

---

### 6. Проверка работы приложения через curl
Выполнен запрос для проверки доступности приложения через Service:

```shell
curl http://localhost:30118/hello.html
Hello world
```

---

### 7. Получение информации о развертывании
Для анализа были выполнены команды kubectl describe, результаты сохранены в файлы:
```shell
kubectl describe deployment web -n web > deployment_describe.txt
kubectl describe service web -n web > service_describe.txt
```

---

## Итог
Лабораторная работа успешно выполнена. Веб-приложение развернуто и доступно по адресу:
http://localhost:30118/hello.html

Результаты kubectl describe сохранены в файлы:
- deployment_describe.txt (информация о Deployment)
- service_describe.txt (информация о Service)
