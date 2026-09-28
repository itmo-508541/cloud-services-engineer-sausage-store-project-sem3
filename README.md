# Интернет-магазин «[Сосисочная](https://front-amindubaev.2sem.students-projects.ru/)»

![image](https://user-images.githubusercontent.com/9394918/121517767-69db8a80-c9f8-11eb-835a-e98ca07fd995.png)

## Ссылки на ресурсы для ревью

* [Работающее приложение](https://front-amindubaev.2sem.students-projects.ru/)
  * Это продолжение работы второго семестра.
* [Репозиторий в GitLab](https://cloud-services-engineer.gitlab.yandexcloud.net/s18468137/sausage-store)
  * Пайплайн [terraform](https://cloud-services-engineer.gitlab.yandexcloud.net/s18468137/sausage-store/-/pipelines/22850): plan, apply и terratest
  * Пайплайн [ansible](https://cloud-services-engineer.gitlab.yandexcloud.net/s18468137/sausage-store/-/pipelines/22796)
  * Пайплайн [k8s](https://cloud-services-engineer.gitlab.yandexcloud.net/s18468137/sausage-store/-/pipelines/22851): build-and-push-images и package-helm-chart
* [Приложение в Argo CD](https://argocd.infra.students-projects.ru/applications/argocd/sausage-store-amindubaev).
  * APP HEALTH: `Healthy`, LAST SYNC: `Sync OK to 1.0.1`
* [UI для Vault](http://158.160.228.2:8200/ui/)
  * [Инструкция по настройке](VAULT.md)

## Требования к локальному окружению разработчика

* **OS**: Linux
* **Docker**: 20.10+
* **Docker Compose**

## Запуск приложения

Для локальной разработки скопируйте файл `docker-compose.override.yml.dist` в `docker-compose.override.yml`. Этот файл подключается автоматически и переопределяет образы сервисов на сборку из исходников в каталогах `frontend` и `backend`. Без копирования контейнеры поднимаются с готовыми образами из реестра.

Для сборки и запуска приложения нужно выполнить `docker compose up -d --build`

После запуска приложение доступно по адресу http://localhost/.

## Запуск приложения из собранных образов

После первого успешного деплоя файл `docker-compose.override.yml` можно удалить, при отсутсвии этого файла, приложение будет запускаться из собранных образов из Docker Hub.

Для запуска приложения нужно выполнить `docker compose up -d`
