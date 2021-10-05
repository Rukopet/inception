#!/usr/bin/env bash

# Выясняем путь до скрипта
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Берем путь до файла конфига по умолчанию
PATH_TO_DEFAULT=$SCRIPTPATH/.default/.env

# Берем путь до пользовательского конфига
PATH_ENV="$(cd -P "$SCRIPTPATH"/../../ && pwd -P)"/.env

# Весь вывод дублируется в файл для логов
LOG_LOCATION=$SCRIPTPATH/logs.txt
exec > >(tee $LOG_LOCATION) 2>&1

# Путь до докер компоуз ямла
COMPOSE_YML="srcs/docker-compose.yml"

# Подгружаем настройки переменных
unamestr=$(uname)
if [ "$unamestr" = "Linux" ]; then

  export $(grep -v '^#' $SCRIPTPATH/.default/.env | xargs -d '\n')
  export $(grep -v '^#' $SCRIPTPATH/.env | xargs -d '\n')


elif [ "$unamestr" = "Darwin" ]; then

  export $(grep -v '^#' $SCRIPTPATH/.default/.env | xargs -I '\n')
  export $(grep -v '^#' $SCRIPTPATH/.env | xargs -I '\n')

elif [ "$unamestr" = "FreeBSD" ]; then

  export $(grep -v '^#' $SCRIPTPATH/.default/.env | xargs -0)
  export $(grep -v '^#' $SCRIPTPATH/.env | xargs -0)

fi

compose_start() {
  docker-compose -f $COMPOSE_YML up
}

code_reload() {
  docker-compose up --detach --build
}


if [ $1 = 'reload' ]; then
  code_reload
elif [ $1 = 'start' ]; then
  compose_start
fi