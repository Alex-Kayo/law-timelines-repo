<?php

defined('SYSPATH') OR die('No direct access allowed.');



/*
  Джерело ресурсів

  'назва обробника ресурсу' => array('table' => 'назва таблиці ресурсів',
  'field_id' => 'унікальне поле по якому проводиться пошук ресурсу',
  'field_lob' => 'поле , я кому зберігаютьмя данні ресурсу',
  'field_type' => 'поле, яке визначає тип фала ресурсу '
  'post_function => 'Функція обробки (параметр необов"язковий'):
  1. Викликається після створення файл ресурсу
  2. Як переметр функції передається шлях до створеного файла ресурсу
 */
$config['source'] = array('news' => array('table' => 'items_attachments',
        'field_id' => 'ia_id',
        'field_lob' => 'ia_original',
        'field_type' => 'ia_type'),
    'news_prev' => array('table' => 'items_attachments',
        'field_id' => 'ia_id',
        'field_lob' => 'ia_previev',
        'field_type' => "'jpeg'"),
    'gallery' => array('table' => 'items_attachments',
        'field_id' => 'ia_id',
        'field_lob' => 'ia_original',
        'field_type' => 'ia_type')
    , 'gallery_prev' => array('table' => 'items_attachments',
        'field_id' => 'ia_id',
        //'field_lob' 		=> 'ia_previev',
        //'field_type'		=> "'jpeg'")

        'field_lob' => 'ia_original',
        'field_type' => "'jpeg'",
        'post_function' => 'resize::resize_logo_middle'
    )
    , 'video' => array('table' => 'items_attachments',
        'field_id' => 'ia_id',
        'field_lob' => 'ia_original',
        'field_type' => 'ia_type')
    , 'video_prev' => array('table' => 'items_attachments',
        'field_id' => 'ia_id',
        'field_lob' => 'ia_previev',
        'field_type' => "'jpeg'")
    , 'audio' => array('table' => 'items_attachments',
        'field_id' => 'ia_id',
        'field_lob' => 'ia_original',
        'field_type' => 'ia_type')
    , 'documents' => array('table' => 'items_attachments',
        'field_id' => 'ia_id',
        'field_lob' => 'ia_original',
        'field_type' => "ia_type")
    , 'logos' => array('table' => 'items_full',
        'field_id' => 'i_logoname',
        'field_lob' => 'i_logo',
        'field_type' => "'jpeg'",
        'post_function' => 'resize::resize_logo_big')
    , 'logos_middle' => array('table' => 'items_full',
        'field_id' => 'i_logoname',
        'field_lob' => 'i_logo',
        'field_type' => "'jpeg'",
        'post_function' => 'resize::resize_logo_middle')
    , 'logos_small' => array('table' => 'items_full',
        'field_id' => 'i_logoname',
        'field_lob' => 'i_logo',
        'field_type' => "'jpeg'",
        'post_function' => 'resize::resize_logo_small')
);



/**
  Максимальний час блокування при створенні кешу ресурса (в секундах)
 * */
$config['max_lock_time'] = 10800;

/**
  Коренева директорія ресурсів
 * */
$config['res_directory'] = DOCROOT . 'uploads';

/**
  Директорія файлів блокування
 * */
$config['lock_directory'] = APPPATH . 'cache/lock_file';


/**
  Коренева директорія IM ресурсів (таблиця IM)
 * */
$config['im_root_dir'] = 'images';
?>