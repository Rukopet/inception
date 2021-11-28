<?php

/** Имя базы данных для WordPress */
define('DB_NAME', $DB_NAME);

/** Имя пользователя MySQL */
define('DB_USER', $DB_USER);

/** Пароль к базе данных MySQL */
define('DB_PASSWORD', $DB_PASSWORD);

/** Имя сервера MySQL */
define('DB_HOST', 'mysql-service');
/**
* Префикс таблиц в базе данных WordPress.
*
* Можно установить несколько сайтов в одну базу данных, если использовать
* разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
*/
$table_prefix = 'wp_';
	
/** Инициализирует переменные WordPress и подключает файлы. */
require_once ABSPATH . 'wp-settings.php';
