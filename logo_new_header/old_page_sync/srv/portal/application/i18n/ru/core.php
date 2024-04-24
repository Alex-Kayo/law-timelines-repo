<?php defined('SYSPATH') OR die('No direct access allowed.');

$lang = array
(
	'there_can_be_only_one' => 'Наличие более, чем одного экземпляра Kohana, в пределах одного запроса страницы, невозможно',
	'uncaught_exception'    => 'Не пойманное %s: %s в файле %s, на строке %s',
	'invalid_method'        => 'Вызов метода %s из файла %s невозможен',
	'invalid_property'      => 'Свойство %s не входит в состав класса %s.',
	'log_dir_unwritable'    => 'Директория для хранения журналов, %s, не доступна для записи',
	'resource_not_found'    => 'Запрошенный %s, %s, не найден',
	'invalid_filetype'      => 'Запрошенный тип файла, .%s, не разрешён конфигурацией видов',
	'view_set_filename'     => 'Необходимо задать файл вида перед вызовом render()',
	'no_default_route'      => 'Установите путь по умолчанию в файле config/routes.php.',
	'no_controller'         => 'Kohana не удалось найти контроллер для обработки этого запроса: %s',
	'page_not_found'        => 'Запрошенная страница, %s, не найдена.',
	'stats_footer'          => 'Загружено за {execution_time} секунд, используя {memory_usage} памяти. Сгенерировано Kohana v{kohana_version}.',
	'error_file_line'       => '<tt>%s <strong>[%s]:</strong></tt>',
	'stack_trace'           => 'Стек вызовов',
	'generic_error'         => 'Не удалось обработать запрос',	

	// Drivers
	'driver_implements'     => 'Драйвер %s библиотеки %s не реализует интерфейс %s',
	'driver_not_found'      => 'Драйвер %s библиотеки %s не найден',

	// Resource names
	'config'                => 'конфигурация',
	'controller'            => 'контроллер',
	'helper'                => 'помощник',
	'library'               => 'библиотека',
	'driver'                => 'драйвер',
	'model'                 => 'модель',
	'view'                  => 'вид',



	'errors_disabled'       => array(
		'title' => 'Официальный портал Верховной Рады Украины',
		'header1' => 'Верховная Рада Украины',
		'header2' => 'Официальный веб-портал',
		'msg1' => 'Ошибка 404',
		'msg2' => 'Cтраница, которую вы искали, не найдена',
        'msg3' => 'Возможные причины',
        'list' => array('- неправильно набран адрес', '- такой страницы никогда  не было на этом сайте', '- страница была удалена'),
        'link' => 'Вы можете перейти на <a href="/ru">главную страницу</a>, посмотреть <a href="/ru/map">карту сайта</a>, или воспользоваться  поиском по сайту',
        'searched' => 'Найти',
		'extended' => 'расширенный поиск',
		'search_url' => '/ru/search'




   ),
);
