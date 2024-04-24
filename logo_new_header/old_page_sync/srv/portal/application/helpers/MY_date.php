<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * Date helper class.
 *
 * $Id: url.php 3769 2008-12-15 00:48:56Z zombor $
 *
 * @package    Core
 * @author     Kohana Team
 * @copyright  (c) 2007-2008 Kohana Team
 * @license    http://kohanaphp.com/license.html
 */
class date extends date_Core {

	/**
	 * Повертає останній день місяця
	 *
	 * @param int $year - рік
	 * @param int $month - місяць
	 * 
	 * @return int 
	 */
	public static function getLastMonthDay($year, $month){	
		
		$year = ($month == 12 ? $year+1 : $year);
		$month= ($month == 12 ? 1 : $month+1);
		return (int)date('d', mktime(0, 0, 0, $month, 0, $year));
		
	}


} // End date