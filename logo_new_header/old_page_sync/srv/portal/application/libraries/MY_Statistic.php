<?php

/**
 * Клас для роботи з статистикою сторінки
 *
 */
class MY_Statistic extends Ajax_Controller{

	/**
	 * Об'єкт класу XMLReader
	 *
	 * @var XMLReader
	 */
	private $reader;


	/**
	 * Конструктор
	 *
	 */
	public function __construct(){
		parent::__construct();
		$this->reader = new XMLReader();

	}


	/**
	 * Внесення статистичних даних відмов користувачів за певну дату
	 *
	 * @param int $value - процент відмов
	 * @param int $date - дата статистики
	 * 
	 * @return boolean
	 */
	public function insertRefusesStatistic($value, $date){
		if(($value != '') and ($date != '')){
			$sql = "SELECT s_id, s_refuses FROM statistic_visits WHERE s_date = $date";

			$query = $this->db->query($sql);

			foreach ($query->result(true) as $row){
				$s_id = intval($row->s_id);
				$refuses = intval($row->s_refuses);

			}

			unset($query);

			if(!isset($s_id)){
				$insertData = array('s_refuses' => $value,
				's_date'   => $date);

				$this->db->insert('statistic_visits', $insertData);

				return true;

			}	elseif($refuses != $value){
				$updateData = array('s_refuses' => $value);

				$this->db->update('statistic_visits', $updateData, 's_date = ' . $date);

				return true;

			}

			return true;

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
	 * @return boolean
	 */
	public function insertVisitorsStatistic($value, $date){
		if(($value != '') and ($date != '')){
			$sql = "SELECT s_id, s_visitors FROM statistic_visits WHERE s_date = $date";

			$query = $this->db->query($sql);

			foreach ($query->result(true) as $row){
				$s_id = intval($row->s_id);
				$visitors = intval($row->s_visitors);

			}

			unset($query);

			if(!isset($s_id)){
				$insertData = array('s_visitors' => $value,
				's_date'   => $date);

				$this->db->insert('statistic_visits', $insertData);

				return true;

			}	elseif($visitors != $value){
				$updateData = array('s_visitors' => $value);

				$this->db->update('statistic_visits', $updateData, 's_date = ' . $date);

				return true;

			}

			return true;

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
	 * @return boolean
	 */
	public function insertVisitsStatistic($value, $date){
		if(($value != '') and ($date != '')){
			$sql = "SELECT s_id, s_visits FROM statistic_visits WHERE s_date = $date";
			$query = $this->db->query($sql);

			foreach ($query->result(true) as $row){
				$s_id = intval($row->s_id);
				$visits = intval($row->s_visits);

			}

			unset($query);

			if(!isset($s_id)){
				$insertData = array('s_visits' => $value,
				's_date'   => $date);

				$this->db->insert('statistic_visits', $insertData);

				return true;

			}	elseif($visits != $value){
				$updateData = array('s_visits' => $value);

				$this->db->update('statistic_visits', $updateData, 's_date = ' . $date);

				return true;

			}

			return true;

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
	 * @return boolean
	 */
	public function insertVisitedPagesStatistic($value, $date){
		if(($value != '') and ($date != '')){
			$sql = "SELECT s_id, s_visited_pages FROM statistic_visits WHERE s_date = $date";
			$query = $this->db->query($sql);

			foreach ($query->result(true) as $row){
				$s_id = intval($row->s_id);
				$visitedPages = intval($row->s_visited_pages);

			}

			unset($query);

			if(!isset($s_id)){
				$insertData = array('s_visited_pages' => $value,
				's_date'   		  => $date);

				$this->db->insert('statistic_visits', $insertData);

				return true;

			}	elseif($visitedPages != $value){
				$updateData = array('s_visited_pages' => $value);

				$this->db->update('statistic_visits', $updateData, 's_date = ' . $date);

				return true;

			}

			return true;

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
	 * @return boolean
	 */
	public function insertDirectStatistic($value, $date){
		if(($value != '') and ($date != '')){
			$sql = "SELECT s_id, s_direct FROM statistic_visits WHERE s_date = $date";

			$query = $this->db->query($sql);

			foreach ($query->result(true) as $row){
				$s_id = intval($row->s_id);
				$directPages = intval($row->s_direct);

			}

			unset($query);

			if(!isset($s_id)){
				$insertData = array('s_direct' => $value,
				's_date'   => $date);

				$this->db->insert('statistic_visits', $insertData);

				return true;

			}	elseif($directPages != $value){
				$updateData = array('s_direct' => $value);

				$this->db->update('statistic_visits', $updateData, 's_date = ' . $date);

				return true;

			}

			return true;

		}	else{
			return false;

		}

	}


	/**
	 * Повертає загальну інформацію про статистику відвідування за певний період
	 *
	 * @param int $startDate - початковий час
	 * @param int $endDate - кінцевий час
	 * @return false|array
	 */
	public function getVisitsStatisticByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '')){
			$query = $this->db->select("*")
			->from('statistic_visits')
			->where("s_date BETWEEN $startDate AND $endDate")													->orderby('s_date')
			->get();

			$return = array();

			foreach ($query->result(false) as $row){
				$row['s_id'] = intval($row['s_id']);
				$row['s_visits'] = intval($row['s_visits']);
				$row['s_visitors'] = intval($row['s_visitors']);
				$row['s_visited_pages'] = intval($row['s_visited_pages']);
				$row['s_refuses'] = floatval($row['s_refuses']);
				$row['s_direct'] = intval($row['s_direct']);
				$row['s_date'] = date("d.m.Y", $row['s_date']);
				$return[] = $row;

			}

			return $return;

		}	else{
			return false;

		}

	}

	/**
	 * Повертає загальну інформацію про статистику прямого переходу на сайт за певний період
	 *
	 * @param int $startDate - початковий час
	 * @param int $endDate - кінцевий час
	 * @return false|array
	 */
	public function getDirectStatisticByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '')){
			$query = $this->db->select("s_direct, s_date")
			->from('statistic_visits')
			->where("s_date BETWEEN $startDate AND $endDate")													->orderby('s_date')
			->get();

			$return = array();

			foreach ($query->result(false) as $row){
				$row['s_date'] = date("d.m.Y", $row['s_date']);
				$return[] = $row;

			}

			return $return;

		}	else{
			return false;

		}

	}


	/**
	 *	Додає статистику про сайт з яких відбувся перехід 
	 *
	 * @param array $statisticData - масив зі статистичними даними
	 * @return boolean
	 */
	public function insertPageRefererStatistic($statisticData){

		foreach($statisticData as $date => $value){
			$sql = "SELECT COUNT(*) as count FROM statistic_trafic WHERE s_date = $date AND s_type = 'source_site'";
			$query = $this->db->query($sql);

			foreach ($query->result(true) as $row){
				$count = $row->count;

			}

			unset($query);

			if($count != 0){
				$this->db->delete('statistic_trafic', 's_type = \'source_site\' AND s_date = '. $date);

			}

			foreach($value as $item){
				$insertData = array('s_url' 		  => $item['url'],
				's_visits' 	  	=> $item['visits'],
				's_time_on_page' => $item['time'],
				's_new_visits'   => $item['newVisits'],
				's_refuses' 	  => $item['refuses'],
				's_type' 		  => 'source_site',
				's_date' 		  => $date);

				$this->db->insert('statistic_trafic', $insertData);

			}

		}

		return true;

	}


	/**
	 * Отримуємо статистику сторінок з яких відбувався перехід
	 *
	 * @param int $startDate - початковий час
	 * @param int $endDate - кінцевий час
	 * @return false|array
	 */
	public function getSitesReferersByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '')){
			$query = $this->db->select("s_url, SUM(s_visits) AS visits, SUM(s_time_on_page) AS time, SUM(s_new_visits) AS new_visits, SUM(s_refuses) AS refuses,
						(SELECT COUNT(DISTINCT s_date) FROM statistic_trafic WHERE s_date BETWEEN $startDate AND $endDate AND s_type = 'search_engine') as count")
			->from('statistic_trafic')
			->where("s_date BETWEEN $startDate AND $endDate AND s_type = 'source_site'")
			->groupby('s_url')
			->orderby('visits', 'DESC')
			->limit(10, 0)->get();

			$return = array();

			foreach ($query->result(false) as $row){
				$row['visits'] = intval($row['visits']);
				$row['new_visits'] = floatval($row['new_visits']);
				$row['refuses'] = floatval($row['refuses']);
				$return[] = $row;

			}

			return $return;

		}	else{
			return false;

		}

	}


	/**
	 *	Додає статистику про пошуковики з яких відбувся перехід 
	 *
	 * @param array $statisticData - масив зі статистичними даними
	 * @return boolean
	 */
	public function insertSearchEnginesStatistic($statisticData){
		foreach($statisticData as $date => $value){
			$sql = "SELECT COUNT(*) as count FROM statistic_trafic WHERE s_date = $date AND s_type = 'search_engine'";
			$query = $this->db->query($sql);

			foreach ($query->result(true) as $row){
				$count = $row->count;

			}

			unset($query);

			if($count == 0){
				$this->db->delete('statistic_trafic', 's_type = \'search_engine\' AND s_date = '. $date);

			}

			foreach($value as $item){
				$insertData = array('s_url' 		  => $item['url'],
				's_visits' 	  => $item['visits'],
				's_time_on_page' => $item['time'],
				's_new_visits'   => $item['newVisits'],
				's_refuses' 	  => $item['refuses'],
				's_type' 		  => 'search_engine',
				's_date' 		  => $date);

				$this->db->insert('statistic_trafic', $insertData);

			}

		}

		return true;

	}


	/**
	 * Отримуємо статистику пошукових систем з яких відбувався перехід
	 *
	 * @param int $startDate - початковий час
	 * @param int $endDate - кінцевий час
	 * @return false|array
	 */
	public function getSearchEnginesByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '')){
			$query = $this->db->select("s_url, SUM(s_visits) AS visits, SUM(s_time_on_page) AS time, SUM(s_new_visits) AS new_visits, SUM(s_refuses) AS refuses,
						(SELECT COUNT(DISTINCT s_date) FROM statistic_trafic WHERE s_date BETWEEN $startDate AND $endDate AND s_type = 'search_engine') as count")
			->from('statistic_trafic')
			->where("s_date BETWEEN $startDate AND $endDate AND s_type = 'search_engine'")
			->groupby('s_url')
			->orderby('visits', 'DESC')
			->limit(5, 0)->get();

			$return = array();

			foreach ($query->result(false) as $row){
				$return[] = $row;

			}

			return $return;

		}	else{
			return false;

		}

	}


	/**
	 *	Додає статистику найпопулярніших сторінок
	 *
	 * @param array $statisticData - масив зі статистичними даними
	 * @return boolean
	 */
	public function insertTopPagesStatistic($statisticData){
		foreach($statisticData as $date => $value){
			$sql = "SELECT COUNT(*) as count FROM statistic_content WHERE s_date = $date AND s_type = 'popular'";

			$query = $this->db->query($sql);

			foreach ($query->result(true) as $row){
				$count = $row->count;

			}

			unset($query);

			if($count == 0){
				$this->db->delete('statistic_content', 's_type = \'popular\' AND s_date = '. $date);

			}

			foreach($value as $item){
				$insertData = array('s_url' => $item['url'],
				's_visits' => $item['visits'],
				's_time_on_page' => $item['time'],
				's_new_visits' => $item['newVisits'],
				's_refuses' => $item['refuses'],
				's_type' => 'popular',
				's_date' => $date);

				$this->db->insert('statistic_content', $insertData);

			}

		}

		return true;

	}


	/**
	 *	Додає статистику найпопулярніших сторінок входу
	 *
	 * @param array $statisticData - масив зі статистичними даними
	 * @return boolean
	 */
	public function insertEntrancePagesStatistic($statisticData){
		foreach($statisticData as $date => $value){
			$sql = "SELECT COUNT(*) AS count FROM statistic_content WHERE s_date = $date AND s_type = 'entrance'";

			$query = $this->db->query($sql);

			foreach ($query->result(true) as $row){
				$count = $row->count;

			}

			unset($query);

			if($count == 0){
				$this->db->delete('statistic_content', 's_type = \'entrance\' AND s_date = '. $date);

			}

			foreach($value as $item){
				$insertData = array('s_url' => $item['url'],
				's_visits' => $item['visits'],
				's_refuses' => $item['refuses'],
				's_type' => 'entrance',
				's_date' => $date);

				$this->db->insert('statistic_content', $insertData);

			}

		}

		return true;

	}


	/**
	 * Отримуємо статистику найпопулярніших сторінок
	 *
	 * @param int $startDate - початковий час
	 * @param int $endDate - кінцевий час
	 * @return false|array
	 */
	public function getTopPagesByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '')){
			$query = $this->db->select("s_url, SUM(s_visits) AS visits, SUM(s_time_on_page) AS time, SUM(s_new_visits) AS new_visits, SUM(s_refuses) AS refuses,
						(SELECT COUNT(DISTINCT s_date) FROM statistic_content WHERE s_date BETWEEN $startDate AND $endDate AND s_type = 'popular') as count")
			->from('statistic_content')
			->where("s_date BETWEEN $startDate AND $endDate AND s_type = 'popular'")
			->groupby('s_url')
			->orderby('visits', 'DESC')
			->limit(10, 0)->get();

			$return = array();

			foreach ($query->result(false) as $row){
				$row['visits'] = intval($row['visits']);
				$row['new_visits'] = floatval($row['new_visits']);
				$row['refuses'] = floatval($row['refuses']);
				$return[] = $row;

			}

			return $return;

		}	else{
			return false;

		}

	}


	/**
	 * Отримуємо статистику найпопулярніших сторінок входу
	 *
	 * @param int $startDate - початковий час
	 * @param int $endDate - кінцевий час
	 * @return false|array
	 */
	public function getEntrancePagesByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '')){
			$query = $this->db->select("s_url, SUM(s_visits) AS visits, SUM(s_refuses) AS refuses,
						(SELECT COUNT(DISTINCT s_date) FROM statistic_content WHERE s_date BETWEEN $startDate AND $endDate AND s_type = 'entrance') as count")
			->from('statistic_content')
			->where("s_date BETWEEN $startDate AND $endDate AND s_type = 'entrance'")
			->groupby('s_url')
			->orderby('visits', 'DESC')
			->limit(10, 0)->get();

			$return = array();

			foreach ($query->result(false) as $row){
				$row['visits'] = intval($row['visits']);
				$row['refuses'] = floatval($row['refuses']);
				$return[] = $row;

			}

			return $return;

		}	else{
			return false;

		}

	}


	/**
	 * Зчитує файл, xml повертаючи теги зазначені в змінних $startItem і $informationItem
	 *
	 * @param string $fileName - шлях до файл,  який необхідно опрацювати
	 * @param string $startItem - початковий елемент
	 * @param string $informationItem - значущий елемент
	 * @return array|string
	 */
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


	/**
	 * Зчитує піделементи XML-файла
	 *
	 * @param string $name - назва елемента
	 * @return array|string
	 */
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


	/**
	 * Конвертує час зі стрічки в секунди
	 *
	 * @param string $time - вхідна стрічка
	 * @return integer
	 */
	public function timeToSeconds($time){
		$el = explode(':', $time);
		$seconds = 3600 * intval($el[0]) + 60 * intval($el[1]) + $el[2];
		return $seconds;

	}

	/**
	 * Конвертує час із секунд в стрічку формату HH:MM:SS
	 *
	 * @param int $seconds - кількість секунд
	 * @return string
	 */
	public function secondsToTime($seconds){
		$time = array();

		if($seconds >= 3600){
			$value[0] = floor($seconds / 3600);
			$seconds = ($seconds % 3600);
			if(strlen($value[0]) < 2){
				$value[0] = '0' . $value[0];

			}

		}	else{
			$value[0] = '00';

		}

		if($seconds >= 60){
			$value[1] = floor($seconds / 60);
			$seconds = ($seconds % 60);
			if(strlen($value[1]) < 2){
				$value[1] = '0' . $value[1];

			}

		}	else{
			$value[1] = '00';

		}

		if(strlen($seconds) < 2){
			$value[3] = '0' . $seconds;

		}	else{
			$value[3] = $seconds;

		}

		return implode(':', $value);

	}

}
?>