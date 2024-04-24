<?php

defined('SYSPATH') OR die('No direct access allowed.');
/**
 * @package  Core
 *
 * Sets the default route to "welcome"
 */
//$config['_default'] = 'news';

$config['_default'] = 'main_page';

$config['admin'] = 'admin/index/index';

//$config['sitemap.xml'] = 'yandex/map';
//$config['Sitemap.xml'] = 'yandex/map';

$config['search/page/([0-9]+)'] = 'search/index/page/$1';

$config['news/((.*)/)*page/([0-9]+)'] = 'news/index/page/$1';
$config['news/((.*)/)*([0-9]+).html'] = 'news/show/$1';
$config['memory/((.*)/)*([0-9]+).html'] = 'memorial/show/$1';


$config['selpreview/([0-9]*)'] = 'preview/itemlist/$1';
//$config['selevents/([0-9]*)'] = 'preview/eventlist/$1';
$config['selevents/([0-9]*)'] = 'feedbackakred/eventlist/$1';
//$config['en_selevents/([0-9]*)'] = 'feedbackakred/eventlist/$1';
$config['preview/((.*)/)*page/([0-9]+)'] = 'preview/index/page/$1';
$config['preview/((.*)/)*([0-9]+).html'] = 'preview/show/$1';


$config['gallery/((.*)/)*page/([0-9]+)'] = 'gallery/index/page/$1';
$config['gallery/((.*)/)*([0-9]+).html'] = 'gallery/show/$1';
$config['gallery/((.*)/)*([0-9]+)_([0-9]+).html'] = 'gallery/show/$1_$2';

$config['documents/((.*)/)*page/([0-9]+)'] = 'documents/index/page/$1';
$config['documents/((.*)/)*([0-9]+).html'] = 'documents/show/$1';

$config['audio/((.*)/)*page/([0-9]+)'] = 'audio/index/page/$1';
$config['audio/((.*)/)*([0-9]+).html'] = 'audio/show/$1';

$config['video/((.*)/)*page/([0-9]+)'] = 'video/index/page/$1';
$config['video/((.*)/)*([0-9]+).html'] = 'video/show/$1';

$config['recycler/((.*)/)*([0-9]+).html'] = 'recycler/show/$1';


$config['infocenter/page/([0-9]+)'] = 'infocenter/index/page/$1';
$config['infocenter/([0-9]+)'] = 'infocenter/show/$1';

$config['json/(.*)'] = 'json/show/$1';



// для повноекранного виводу
//
$config['fsview/((.*)/)*page/([0-9]+)'] = 'fsview/index/page/$1';
$config['fsview/((.*)/)*([0-9]+).html'] = 'fsview/show/$1';


$config['meeting/stenogr'] = 'meeting/callendar/1';
$config['meeting/awt'] = 'meeting/callendar/2';
$config['meeting/faxiv'] = 'meeting/callendar/3';
$config['meeting/stenpog'] = 'meeting/callendar/4';

$config['meeting/stenogr/([0-9]+)'] = 'meeting/callendar/1/$1';
$config['meeting/awt/([0-9]+)'] = 'meeting/callendar/2/$1';
$config['meeting/faxiv/([0-9]+)'] = 'meeting/callendar/3/$1';
$config['meeting/stenpog/([0-9]+)'] = 'meeting/callendar/4/$1';

$config['meeting/stenogr/show/([0-9]+).html'] = 'meeting/show/1/$1';
$config['meeting/awt/show/([0-9]+).html'] = 'meeting/show/2/$1';
$config['meeting/faxiv/show/([0-9]+).html'] = 'meeting/show/3/$1';
$config['meeting/stenpog/show/([0-9]+).html'] = 'meeting/show/4/$1';
// Вивід прінт сторінки для meeting
$config['/meeting/stenogr/print/([0-9]+).html'] = 'meeting/show/5/$1';
$config['/meeting/awt/print/([0-9]+).html'] = 'meeting/show/5/$1';
$config['/meeting/faxiv/print/([0-9]+).html'] = 'meeting/show/5/$1';
$config['/meeting/stenpog/print/([0-9]+).html'] = 'meeting/show/5/$1';

$config['fba'] = 'feedbackakred';


// сторінка пошуку анонсів
$config['searchanons'] = 'preview/searchanonslist';

