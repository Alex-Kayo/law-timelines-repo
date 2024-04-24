<?php

/**
 * Клас для роботи з статистикою сторінки
 *
 */
class Statistic_Controller extends Ajax_Controller{

	private $reader;

	public function __construct(){
		$this->reader = new XMLReader();

	}

	/**
	 * Внесення статистичних даних відмов користувачів за певну дату
	 *
	 * @param int $value - процент відмов
	 * @param int $date - дата статистики
	 * 
	 * @return bool
	 */
	public function insertRefusesStatistic($value, $date){
		if(($value != '') and ($date != '')){
			$sql = "SELECT SQL_CALC_FOUND_ROWS s_refuses FROM " . PREFIX . "statistic_visits WHERE s_date = '$date';";

			if(($result = $this->connect->executeQuery($sql,__FILE__,__LINE__)) != false){

				$sql = 'SELECT FOUND_ROWS();';
				if(($result1 = $this->connect->executeQuery($sql,__FILE__,__LINE__))!=false){
					$count = intval($this->connect->resultData($result1, 0));

				} else{
					$count = 0;

				}

				if($count == 0){
					$sql = "INSERT INTO " . PREFIX . "statistic_visits SET s_refuses = $value, s_date = '$date';";
					if($this->connect->executeQuery($sql, __FILE__, __LINE__)){
						return true;

					}	else{
						return false;

					}

				}	else{
					$oldValue = intval($this->connect->resultData($result, 0));

					if($oldValue == 0){
						$sql = "UPDATE " . PREFIX . "statistic_visits SET s_refuses = $value WHERE s_date = '$date';";
						if($this->connect->executeQuery($sql, __FILE__, __LINE__)){
							return true;

						}	else{
							return false;

						}

					}	else{
						return true;

					}

				}

				return true;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}


	/**
	 * Внесення статистики відвідувань унікальних користувачів за певну дату
	 *
	 * @param int $value - кількість користувачів
	 * @param int $date - дата статистики
	 * 
	 * @return bool
	 */
	public function insertVisitorsStatistic($value, $date){
		if(($value != '') and ($date != '')){
			$sql = "SELECT SQL_CALC_FOUND_ROWS s_visitors FROM " . PREFIX . "statistic_visits WHERE s_date = '$date';";

			if(($result = $this->connect->executeQuery($sql,__FILE__,__LINE__)) != false){

				$sql = 'SELECT FOUND_ROWS();';
				if(($result1 = $this->connect->executeQuery($sql,__FILE__,__LINE__))!=false){
					$count = intval($this->connect->resultData($result1, 0));

				} else{
					$count = 0;

				}

				if($count == 0){
					$sql = "INSERT INTO " . PREFIX . "statistic_visits SET s_visitors = $value, s_date = '$date';";
					if($this->connect->executeQuery($sql, __FILE__, __LINE__)){
						return true;

					}	else{
						return false;

					}

				}	else{
					$oldValue = intval($this->connect->resultData($result, 0));

					if($oldValue == 0){
						$sql = "UPDATE " . PREFIX . "statistic_visits SET s_visitors = $value WHERE s_date = '$date';";
						if($this->connect->executeQuery($sql, __FILE__, __LINE__)){
							return true;

						}	else{
							return false;

						}

					}	else{
						return true;

					}

				}

				return true;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}


	/**
	 * Внесення статистики відвідувань за певну дату
	 *
	 * @param int $value - кількість відвідувань
	 * @param int $date - дата статистики
	 * 
	 * @return bool
	 */
	public function insertVisitsStatistic($value, $date){
		if(($value != '') and ($date != '')){
			$sql = "SELECT SQL_CALC_FOUND_ROWS s_visits FROM " . PREFIX . "statistic_visits WHERE s_date = '$date';";

			if(($result = $this->connect->executeQuery($sql,__FILE__,__LINE__)) != false){

				$sql = 'SELECT FOUND_ROWS();';
				if(($result1 = $this->connect->executeQuery($sql,__FILE__,__LINE__))!=false){
					$count = intval($this->connect->resultData($result1, 0));

				} else{
					$count = 0;

				}

				if($count == 0){
					$sql = "INSERT INTO " . PREFIX . "statistic_visits SET s_visits = $value, s_date = '$date';";
					if($this->connect->executeQuery($sql, __FILE__, __LINE__)){
						return true;

					}	else{
						return false;

					}

				}	else{
					$oldValue = intval($this->connect->resultData($result, 0));

					if($oldValue == 0){
						$sql = "UPDATE " . PREFIX . "statistic_visits SET s_visits = $value WHERE s_date = '$date';";
						if($this->connect->executeQuery($sql, __FILE__, __LINE__)){
							return true;

						}	else{
							return false;

						}

					}	else{
						return true;

					}

				}

				return true;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}


	/**
	 * Внесення статистичних відвідувань сторінок за певну дату
	 *
	 * @param float $value - кількість відвідувань
	 * @param int $date - дата статистики
	 * 
	 * @return bool
	 */
	public function insertVisitedPagesStatistic($value, $date){
		if(($value != '') and ($date != '')){
			$sql = "SELECT SQL_CALC_FOUND_ROWS s_visited_pages FROM " . PREFIX . "statistic_visits WHERE s_date = '$date';";

			if(($result = $this->connect->executeQuery($sql,__FILE__,__LINE__)) != false){

				$sql = 'SELECT FOUND_ROWS();';
				if(($result1 = $this->connect->executeQuery($sql,__FILE__,__LINE__))!=false){
					$count = intval($this->connect->resultData($result1, 0));

				} else{
					$count = 0;

				}

				if($count == 0){
					$sql = "INSERT INTO " . PREFIX . "statistic_visits SET s_visited_pages = $value, s_date = '$date';";
					if($this->connect->executeQuery($sql, __FILE__, __LINE__)){
						return true;

					}	else{
						return false;

					}

				}	else{
					$oldValue = intval($this->connect->resultData($result, 0));

					if($oldValue == 0){
						$sql = "UPDATE " . PREFIX . "statistic_visits SET s_visited_pages = $value WHERE s_date = '$date';";
						if($this->connect->executeQuery($sql, __FILE__, __LINE__)){
							return true;

						}	else{
							return false;

						}

					}	else{
						return true;

					}

				}

				return true;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}


	/**
	 * Внесення статистичних прямого заходження на сайт за певний період
	 *
	 * @param int $value - кількість заходжень
	 * @param int $date - дата статистики
	 * 
	 * @return bool
	 */
	public function insertDirectStatistic($value, $date){
		if(($value != '') and ($date != '')){
			$sql = "SELECT SQL_CALC_FOUND_ROWS s_direct FROM " . PREFIX . "statistic_visits WHERE s_date = '$date';";

			if(($result = $this->connect->executeQuery($sql,__FILE__,__LINE__)) != false){

				$sql = 'SELECT FOUND_ROWS();';
				if(($result1 = $this->connect->executeQuery($sql,__FILE__,__LINE__))!=false){
					$count = intval($this->connect->resultData($result1, 0));

				} else{
					$count = 0;

				}

				if($count == 0){
					$sql = "INSERT INTO " . PREFIX . "statistic_visits SET s_direct = $value, s_date = '$date';";
					if($this->connect->executeQuery($sql, __FILE__, __LINE__)){
						return true;

					}	else{
						return false;

					}

				}	else{
					$oldValue = intval($this->connect->resultData($result, 0));

					if($oldValue == 0){
						$sql = "UPDATE " . PREFIX . "statistic_visits SET s_direct = $value WHERE s_date = '$date';";
						if($this->connect->executeQuery($sql, __FILE__, __LINE__)){
							return true;

						}	else{
							return false;

						}

					}	else{
						return true;

					}

				}

				return true;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}


	/**
	 * Повертає загальну інформацію про статистику відвідування за певний період
	 *
	 * @param int $startDate - початковий час
	 * @param int $endDate - кінцевий час
	 * @return false | array()
	 */
	public function getVisitsStatisticByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '')){
			$sql = "SELECT * FROM " . PREFIX . "statistic_visits WHERE s_date BETWEEN $startDate AND $endDate;";
			$return = array();

			if(($result = $this->connect->executeQuery($sql, __FILE__, __LINE__))){
				$res = array();
				while(($res = $this->connect->fetchAssoc($result))){
					$return[] = array('id' => intval($res['s_id']),
					'visits' => intval($res['s_visits']),
					'visitors' => intval($res['s_visitors']),
					'visited_pages' => intval($res['s_visited_pages']),
					'refuses' => intval($res['s_refuses']),
					'direct' => intval($res['s_direct']),
					'date' => date("d.m.Y", $res['s_date']));

				}

				return $return;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}


	/**
	 *	Додає статистику про сайт з яких відбувся перехід 
	 *
	 * @param array $statisticData - масив зі статистичними даними
	 * @return bool
	 */
	public function insertPageRefererStatistic($statisticData = ''){
		$qq=$this->db->query('select sysdate as d1 from dual');
        
        foreach ($qq->result(true) as $row){
            
        echo     $row->d1;
        }
        
        die;
		
		
		foreach($statisticData as $date => $value){
			$sql = "SELECT COUNT(*) FROM statistic_trafic WHERE s_date = $date AND s_type = 'source_site'";

			$query = $this->db->query($sql);			
        
        	$result = $query->result(false);
        	
        	print_r($result);
        	die;
        	
        foreach ($qq->result(true) as $row){
            
        echo     $row->d1;
        }
			
			
			
			print_r($query);
			die;
			
			$count = intval($this->connect->resultData($result, 0));
			unset($result);

			if($count == 0){
				foreach($value as $item){
					$sql = "INSERT INTO " . PREFIX . "statistic_trafic SET s_url = '{$item['url']}', s_visits = '{$item['visits']}', s_time_on_page = {$item['time']}, s_new_visits = {$item['newVisits']}, s_refuses = {$item['refuses']}, s_type = 'source_site', s_date = $date ;";
					$this->connect->executeQuery($sql);

				}

			}	else{
				continue;

			}

		}

		return true;

	}


	/**
	 * Отримуємо статистику сторінок з яких відбувався перехід
	 *
	 * @param int $startDate - початковий час
	 * @param int $endDate - кінцевий час
	 * @return false | array
	 */
	public function getPageReferersByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '')){
			$sql = "SELECT s_url, SUM(s_visits) AS visits, SUM(s_time_on_page) AS time, SUM(s_new_visits) AS new_visits, SUM(s_refuses) AS refuses,
						(SELECT COUNT(DISTINCT s_date) FROM statistic_trafic WHERE s_date BETWEEN $startDate AND $endDate AND s_type = 'search_engine') as count
						 	FROM statistic_trafic WHERE s_date BETWEEN $startDate AND $endDate AND s_type = 'source_site' GROUP BY (s_url) ORDER BY visits DESC LIMIT 0, 10;";

			$return = array();

			if(($result = $this->connect->executeQuery($sql, __FILE__, __LINE__))){
				$res = array();
				while(($res = $this->connect->fetchAssoc($result))){
					$return[] = array('url' => trim($res['s_url']),
					'visits' => intval($res['visits']),
					'time' => intval($res['time']),
					'new_visits' => intval($res['new_visits']),
					'refuses' => intval($res['refuses']),
					'periods' => intval($res['count']));

				}

				return $return;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}


	/**
	 *	Додає статистику про пошуковики з яких відбувся перехід 
	 *
	 * @param array $statisticData - масив зі статистичними даними
	 * @return bool
	 */
	public function insertSearchEnginesStatistic($statisticData){
		foreach($statisticData as $date => $value){
			$sql = "SELECT COUNT(*) FROM " . PREFIX . "statistic_trafic WHERE s_date = '$date' AND s_type = 'search_engine';";

			if(($result = $this->connect->executeQuery($sql,__FILE__,__LINE__)) != false){
				$count = intval($this->connect->resultData($result, 0));
				unset($result);

				if($count == 0){
					foreach($value as $item){
						$sql = "INSERT INTO " . PREFIX . "statistic_trafic SET s_url = '{$item['url']}', s_visits = '{$item['visits']}', s_time_on_page = {$item['time']}, s_new_visits = {$item['newVisits']}, s_refuses = {$item['refuses']}, s_type = 'search_engine', s_date = $date ;";
						$this->connect->executeQuery($sql);

					}

				}	else{
					continue;

				}

			}	else{
				return false;

			}

		}

		return true;

	}


	/**
	 * Отримуємо статистику пошукових систем з яких відбувався перехід
	 *
	 * @param int $startDate - початковий час
	 * @param int $endDate - кінцевий час
	 * @return false | array
	 */
	public function getSearchEnginesByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '')){
			$sql = "SELECT s_url, SUM(s_visits) AS visits, SUM(s_time_on_page) AS time, SUM(s_new_visits) AS new_visits, SUM(s_refuses) AS refuses,
						(SELECT COUNT(DISTINCT s_date) FROM statistic_trafic WHERE s_date BETWEEN $startDate AND $endDate AND s_type = 'search_engine') as count
					 		FROM statistic_trafic WHERE s_date BETWEEN $startDate AND $endDate AND s_type = 'search_engine' GROUP BY (s_url) ORDER BY visits DESC LIMIT 0, 5;";

			$return = array();

			if(($result = $this->connect->executeQuery($sql, __FILE__, __LINE__))){
				$res = array();
				while(($res = $this->connect->fetchAssoc($result))){
					$return[] = array('url' => trim($res['s_url']),
					'visits' => intval($res['visits']),
					'time' => intval($res['time']),
					'new_visits' => intval($res['new_visits']),
					'refuses' => intval($res['refuses']),
					'periods' => intval($res['count']));

				}

				return $return;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}


	/**
	 *	Додає статистику найпопулярніших сторінок
	 *
	 * @param array $statisticData - масив зі статистичними даними
	 * @return bool
	 */
	public function insertTopPagesStatistic($statisticData){
		foreach($statisticData as $date => $value){
			$sql = "SELECT COUNT(*) FROM " . PREFIX . "statistic_content WHERE s_date = '$date' AND s_type = 'popular';";

			if(($result = $this->connect->executeQuery($sql,__FILE__,__LINE__)) != false){
				$count = intval($this->connect->resultData($result, 0));
				unset($result);

				if($count == 0){
					foreach($value as $item){
						$sql = "INSERT INTO " . PREFIX . "statistic_content SET s_url = '{$item['url']}', s_visits = '{$item['visits']}', s_time_on_page = {$item['time']}, s_new_visits = {$item['newVisits']}, s_refuses = {$item['refuses']}, s_type = 'popular', s_date = $date ;";
						$this->connect->executeQuery($sql);

					}

				}	else{
					continue;

				}

			}	else{
				return false;

			}

		}

		return true;

	}


	/**
	 *	Додає статистику найпопулярніших сторінок входу
	 *
	 * @param array $statisticData - масив зі статистичними даними
	 * @return bool
	 */
	public function insertEntrancePagesStatistic($statisticData){
		foreach($statisticData as $date => $value){
			$sql = "SELECT COUNT(*) FROM " . PREFIX . "statistic_content WHERE s_date = '$date' AND s_type = 'entrance';";

			if(($result = $this->connect->executeQuery($sql,__FILE__,__LINE__)) != false){
				$count = intval($this->connect->resultData($result, 0));
				unset($result);

				if($count == 0){
					foreach($value as $item){
						$sql = "INSERT INTO " . PREFIX . "statistic_content SET s_url = '{$item['url']}', s_visits = '{$item['visits']}', s_refuses = {$item['refuses']}, s_type = 'entrance', s_date = $date ;";
						$this->connect->executeQuery($sql);

					}

				}	else{
					continue;

				}

			}	else{
				return false;

			}

		}

		return true;

	}


	/**
	 * Отримуємо статистику найпопулярніших сторінок
	 *
	 * @param int $startDate - початковий час
	 * @param int $endDate - кінцевий час
	 * @return false | array
	 */
	public function getTopPagesByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '')){
			$sql = "SELECT s_url, SUM(s_visits) AS visits, SUM(s_time_on_page) AS time, SUM(s_new_visits) AS new_visits, SUM(s_refuses) AS refuses,
						(SELECT COUNT(DISTINCT s_date) FROM statistic_content WHERE s_date BETWEEN $startDate AND $endDate AND s_type = 'popular') as count
					 		FROM statistic_content WHERE s_date BETWEEN $startDate AND $endDate AND s_type = 'popular' GROUP BY (s_url) ORDER BY visits DESC LIMIT 0, 10;";

			$return = array();

			if(($result = $this->connect->executeQuery($sql, __FILE__, __LINE__))){
				$res = array();
				while(($res = $this->connect->fetchAssoc($result))){
					$return[] = array('url' => trim($res['s_url']),
					'visits' => intval($res['visits']),
					'time' => intval($res['time']),
					'new_visits' => intval($res['new_visits']),
					'refuses' => intval($res['refuses']),
					'periods' => intval($res['count']));

				}

				return $return;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}


	/**
	 * Отримуємо статистику найпопулярніших сторінок входу
	 *
	 * @param int $startDate - початковий час
	 * @param int $endDate - кінцевий час
	 * @return false | array
	 */
	public function getEntrancePagesByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '')){
			$sql = "SELECT s_url, SUM(s_visits) AS visits, SUM(s_refuses) AS refuses,
						(SELECT COUNT(DISTINCT s_date) FROM statistic_content WHERE s_date BETWEEN $startDate AND $endDate AND s_type = 'entrance') as count
					 		FROM statistic_content WHERE s_date BETWEEN $startDate AND $endDate AND s_type = 'entrance' GROUP BY (s_url) ORDER BY visits DESC LIMIT 0, 10;";

			$return = array();

			if(($result = $this->connect->executeQuery($sql, __FILE__, __LINE__))){
				$res = array();
				while(($res = $this->connect->fetchAssoc($result))){
					$return[] = array('url' => trim($res['s_url']),
					'visits' => intval($res['visits']),
					'refuses' => intval($res['refuses']),
					'periods' => intval($res['count']));

				}

				return $return;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}


	public function startReadElement($fileName, $startItem = 'Report', $informationItem = 'HorizontalBar'){
		$this->reader->open($fileName . '.xml');

		while($this->reader->read()){
			if($this->reader->name == $startItem and $this->reader->nodeType == XMLReader::ELEMENT){
				if($this->reader->nodeType == XMLReader::END_ELEMENT and $this->reader->name == $startItem){
					break;

				}

				while($this->reader->read()){
					if($this->reader->name == $informationItem and $this->reader->nodeType == XMLReader::ELEMENT){
						$item = array();

						while($this->reader->read()){
							if($this->reader->nodeType == XMLReader::END_ELEMENT and $this->reader->name == $informationItem){
								break;

							}	else{
								switch($this->reader->nodeType){
									case XMLReader::ELEMENT:
										$name = $this->reader->name;
										$text = '';
										if(!$this->reader->isEmptyElement){
											$el = $this->readSubElements($name);
											if(is_array($el)){
												if(!isset($item[trim($name)])){
													$item[trim($name)] = array();

												}

												$item[trim($name)][] = $el;

											}	else{
												$item[trim($name)] = $el;

											}

										}

										break;

									case XMLReader::TEXT:
										$text .= $this->reader->value;
										break;

								}

							}

						}

					}

				}

			}

		}

		return $item;

	}


	public function readSubElements($name){
		while($this->reader->read()){
			if($this->reader->nodeType == XMLReader::END_ELEMENT and $this->reader->name == trim($name)){
				break;

			}	else{
				switch($this->reader->nodeType){
					case XMLReader::ELEMENT:
						$subName = $this->reader->name;

						if(!$this->reader->isEmptyElement){
							$el = $this->readSubElements($subName);
							if(is_array($el)){
								if(!isset($mas[trim($subName)])){
									$mas[trim($subName)] = array();

								}

								$mas[trim($subName)][] = $el;

							}	else{
								$mas[trim($subName)] = $el;

							}

						}

						break;

					case XMLReader::TEXT:
						$mas = trim($this->reader->value);
						break;

					case XMLReader::END_ELEMENT:
						break;

				}

			}

		}

		if(!isset($mas)){
			$mas = '';

		}

		return $mas;

	}

	public function timeToSeconds($time){
		$el = explode(':', $time);
		$seconds = 3600 * intval($el[0]) + 60 * intval($el[1]) + $el[2];
		return $seconds;

	}

}
?>