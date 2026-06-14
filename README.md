 # ДЗ №3. Docker. Bash

  ## Описание
  Проект из двух Docker-контейнеров:
  - generator (Python) — генерирует CSV с данными
  - reporter (Node.js) — читает CSV и строит HTML-отчёт
  Файлы создаются в папке data/. Контейнеры работают с ней через volume mount.

  ## Инструкция

  ### Шаг 1. Откройте проект
  Откройте репозиторий в Codespaces:
  кнопка Code -> вкладка Codespaces -> Create a codespace on main.

  ### Шаг 2. Сгенерируйте данные
      cd HW
      ./run.sh build_generator
      ./run.sh run_generator
  В папке data/ появится data.csv.

  ### Шаг 3. Постройте отчёт
      cd HW
      ./run.sh build_reporter
      ./run.sh run_reporter
  В папке data/ появится report.html.

  ### Шаг 4. Запустите сервер
      cd HW
      ./run.sh report_server
  Контейнер nginx запускается в фоне и раздаёт data/ на порту 8080.

  ### Шаг 5. Пробросьте порт и откройте отчёт

  1. В нижней панели Codespaces откройте вкладку PORTS
  2. Нажмите Add port, введите 8080, нажмите Enter
  3. Наведите курсор на строку порта 8080 - появится значок глобуса
  4. Нажмите на него - откроется вкладка браузера с report.html

  ## Принцип работы
  Браузер -> порт 8080 Codespaces -> порт 80 внутри контейнера nginx -> /usr/share/nginx/html/report.html

  ## Команды run.sh
  1. build_generator - собрать образ генератора
  2. run_generator - запустить генератор -> data/data.csv
  3. create_local_data -локальный запуск -> local_data/data.csv
  4. build_reporter - собрать образ аналитика
  5. run_reporter - запустить аналитика -> data/report.html
  6. structure - показать структуру проекта
  7. clear_data - удалить .csv и .html из data/
  8. inside_generator - показать /data изнутри контейнера генератора
  9. inside_reporter - показать /data изнутри контейнера аналитика
  10. report_server - запустить nginx на порту 8080

Черепахин Михаил Павлович, УЦП251