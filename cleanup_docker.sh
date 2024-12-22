#!/bin/bash

# Опрятная функция для вывода в консоль
print_message() {
    echo "====================="
    echo "$1"
    echo "====================="
}

# Список запущенных контейнеров
print_message "Running containers:"
docker ps

# Список всех контейнеров
print_message "All containers:"
docker ps -a

# Список образов
print_message "Images:"
docker images

# Удаление остановленных контейнеров
print_message "Deleting stopped containers..."
docker container prune -f

# Удаление ненужных образов
print_message "Pruning unused images..."
docker image prune -f

# Удаление ненужных томов
print_message "Pruning unused volumes..."
docker volume prune -f

# Удаление ненужных сетей
print_message "Pruning unused networks..."
docker network prune -f

# Показать статистику использования диска
print_message "Disk usage:"
docker system df

# Системная очистка
print_message "Cleaning up the system..."
docker system prune -a -f

# Удаление висячих контейнеров
print_message "Removing dangling images..."
docker rmi $(docker images -f "dangling=true" -q)

echo "Docker cleanup completed."