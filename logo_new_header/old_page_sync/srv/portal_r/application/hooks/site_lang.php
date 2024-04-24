<?php

/**
 * Визначення мови сайту
 *
 */
Event::add_after('system.routing', array('Router', 'find_uri'), array('Language','applyLang'));


?>