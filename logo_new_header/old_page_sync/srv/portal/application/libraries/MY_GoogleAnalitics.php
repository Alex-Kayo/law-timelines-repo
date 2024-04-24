<?php

/**
 * Клас для отримання статистики з Google Analitics в форматі XML
 *
 */
class MY_GoogleAnalitics{
	
	/**
	 * Логін користувача
	 *
	 * @var string
	 */
	private $userLogin;

	
	/**
	 * Пароль користувача
	 *
	 * @var string
	 */
	private $userPassword;

	
	/**
	 * Ідентифікатор проекту в системі Google Analitics
	 *
	 * @var int
	 */
	private $projectId;

	
	/**
	 * Куки,  які повертаються при авторизації в системі
	 *
	 * @var unknown_type
	 */
	private $loggedCookies = '';


	/**
	 * Конструктор
	 *
	 * @param string $login - логін користувача
	 * @param string $password - пароль користувача
	 * @param int $projectId - ідентифікатор проекту
	 */
	public function __construct($login, $password, $projectId){
		$this->userLogin = $login;
		$this->userPassword = $password;
		$this->projectId = $projectId;
		if(!$this->login()){
			die(' Неможливо з\'єднатись  з сервером Google Analics.  Перевірте параметри підключення');

		}

	}


	/**
	 * Здійснює спробу конекту до сервера Google Analitics
	 *
	 * @return bool
	 */
	private function login(){
		//якщо необхыдно отримати результат в UTF-8 відправляємо відповідних заголовок
		header ("Content-type: text/html; charset=utf-8");

		$postData = "Email=" . $this->userLogin . "&Passwd=" . $this->userPassword . "&GA3T=5AS_gBsvDHI&nui=15&fpui=3"
					. "&service=analytics&ifr=true&rm=hide&itmpl=true&hl=en_US&alwf=true&"
					. ";continue=https://www.google.com/analytics/reporting/?scid&null=Sign in";


		$returnCurl = curl_init();
		curl_setopt ($returnCurl, CURLOPT_URL,"https://www.google.com/accounts/ServiceLoginBoxAuth");
		curl_setopt ($returnCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt ($returnCurl, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6");
		curl_setopt ($returnCurl, CURLOPT_TIMEOUT, 60);
		curl_setopt ($returnCurl, CURLOPT_FOLLOWLOCATION, 0);
		curl_setopt ($returnCurl, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt ($returnCurl, CURLOPT_REFERER, 'https://www.google.com/analytics/reporting');
		curl_setopt ($returnCurl, CURLOPT_POSTFIELDS, $postData);
		curl_setopt ($returnCurl, CURLOPT_POST, 1);
		curl_setopt ($returnCurl, CURLOPT_HEADER, 1);
		$htmlResponse = curl_exec ($returnCurl);
		curl_close($returnCurl);

		$foundCookies = array();

		preg_match_all('/Set-Cookie:\s*([^=]+=[^\s;]+)/si', $htmlResponse, $foundCookies);

		if(in_array('GAUSR=' . $this->userLogin, $foundCookies[1])){
			//Перетворюємо масив отриманих кукізів в стрічку
			$this->loggedCookies = join(';', $foundCookies[1]);
			return true;

		}	else{
			return false;

		}

	}


	/**
	 * Посилає запит до сервера і повертає отриманий результат
	 *
	 * @param string $url - адреса сторінки
	 * @return false|string
	 */
	private function sendRequest($url){
		if($this->loggedCookies != ''){
			$returnCurl = curl_init();
			curl_setopt ($returnCurl, CURLOPT_URL, $url);
			curl_setopt ($returnCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
			curl_setopt ($returnCurl, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6");
			curl_setopt ($returnCurl, CURLOPT_TIMEOUT, 60);
			curl_setopt ($returnCurl, CURLOPT_FOLLOWLOCATION, 0);
			curl_setopt ($returnCurl, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt ($returnCurl, CURLOPT_COOKIE, $this->loggedCookies);
			$htmlResponse = curl_exec ($returnCurl);
			curl_close($returnCurl);

			if($htmlResponse != ''){
				return $htmlResponse;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}

	
	/**
	 * Повертає статистику відвідувань унікальних користувачів за певний період у вигляді XML
	 *
	 * @param int $startDate - початкова дата формування звіту (формат YYYYMMDD)
	 * @param int $endDate - кінцева дата звіту формування (формат YYYYMMDD)
	 * @return false|string
	 */
	public function getUniqueVisitorsByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '') and ($this->loggedCookies != '')){
			$url = "https://www.google.com/analytics/reporting/export?fmt=1&id=$this->projectId&pdr=$startDate-$endDate&cmp=average&trows=10&gdfmt=nth_day&rpt=UniqueVisitorsReport&gdfmt=nth_day";
			if(($visitors = $this->sendRequest($url))){
				return $visitors;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}
	
	
	/**
	 * Повертає статистику відвідувань сайту за певний період у вигляді XML
	 *
	 * @param int $startDate - початкова дата формування звіту (формат YYYYMMDD)
	 * @param int $endDate - кінцева дата звіту формування (формат YYYYMMDD)
	 * @return false|string
	 */
	public function getVisitsByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '') and ($this->loggedCookies != '')){			
			$url = "https://www.google.com/analytics/reporting/export?fmt=1&id=$this->projectId&pdr=$startDate-$endDate&cmp=average&trows=10&gdfmt=nth_day&rpt=VisitsReport&gdfmt=nth_day";
			if(($visits = $this->sendRequest($url))){
				return $visits;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}
	
	
	/**
	 * Повертає статистику проглядів сторінок за певний період у вигляді XML
	 *
	 * @param int $startDate - початкова дата формування звіту (формат YYYYMMDD)
	 * @param int $endDate - кінцева дата звіту формування (формат YYYYMMDD)
	 * @return false|string
	 */
	public function getPageVisitedByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '') and ($this->loggedCookies != '')){
			$url = "https://www.google.com/analytics/reporting/export?fmt=1&id=$this->projectId&pdr=$startDate-$endDate&cmp=average&trows=10&gdfmt=nth_day&rpt=PageviewsReport&gdfmt=nth_day";
			if(($pageViews = $this->sendRequest($url))){
				return $pageViews;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}
	
	
	/**
	 * Повертає статистику відмов за певний період у вигляді XML
	 *
	 * @param int $startDate - початкова дата формування звіту (формат YYYYMMDD)
	 * @param int $endDate - кінцева дата звіту формування (формат YYYYMMDD)
	 * @return false|string
	 */
	public function getRefusesByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '') and ($this->loggedCookies != '')){
			$url = "https://www.google.com/analytics/reporting/export?fmt=1&id=$this->projectId&pdr=$startDate-$endDate&cmp=average&trows=10&gdfmt=nth_day&rpt=BounceRateReport&gdfmt=nth_day";
			if(($refuses = $this->sendRequest($url))){
				return $refuses;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}
	
	
	/**
	 * Повертає статистику прямого трафіку за певний період у вигляді XML
	 *
	 * @param int $startDate - початкова дата формування звіту (формат YYYYMMDD)
	 * @param int $endDate - кінцева дата звіту формування (формат YYYYMMDD)
	 * @return false|string
	 */
	public function getDirectSourceByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '') and ($this->loggedCookies != '')){
			$url = "https://www.google.com/analytics/reporting/export?fmt=1&id=$this->projectId&pdr=$startDate-$endDate&cmp=average&trows=10&gdfmt=nth_day&rpt=DirectSourcesReport&gdfmt=nth_day";
			if(($source = $this->sendRequest($url))){
				return $source;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}
		
	/**
	 * Повертає статистику переходів з інших сайтів за певний період у вигляді XML
	 *
	 * @param int $startDate - початкова дата формування звіту (формат YYYYMMDD)
	 * @param int $endDate - кінцева дата звіту формування (формат YYYYMMDD)
	 * @return false|string
	 */
	public function getPageReferersByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '') and ($this->loggedCookies != '')){
			$url = "https://www.google.com/analytics/reporting/export?fmt=1&id=$this->projectId&pdr=$startDate-$endDate&cmp=average&rpt=ReferringSourcesReport";
			if(($referers = $this->sendRequest($url))){
				return $referers;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}
	
	
	/**
	 * Повертає статистику приходу з пошукових систем за певний період у вигляді XML
	 *
	 * @param int $startDate - початкова дата формування звіту (формат YYYYMMDD)
	 * @param int $endDate - кінцева дата звіту формування (формат YYYYMMDD)
	 * @return false|string
	 */
	public function getSearchEnginesByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '') and ($this->loggedCookies != '')){
			$url = "https://www.google.com/analytics/reporting/export?fmt=1&id=$this->projectId&pdr=$startDate-$endDate&cmp=average&trows=10&gdfmt=nth_day&rpt=SearchEnginesReport&gdfmt=nth_day";
			if(($engines = $this->sendRequest($url))){
				return $engines;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}
	
	
	/**
	 * Повертає найпопулярніші сторінки за певний період у вигляді XML
	 *
	 * @param int $startDate - початкова дата формування звіту (формат YYYYMMDD)
	 * @param int $endDate - кінцева дата звіту формування (формат YYYYMMDD)
	 * @return false|string
	 */
	public function getTopPagesByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '') and ($this->loggedCookies != '')){
			$url = "https://www.google.com/analytics/reporting/export?fmt=1&id=$this->projectId&pdr=$startDate-$endDate&cmp=average&trows=10&gdfmt=nth_day&rpt=TopContentReport&gdfmt=nth_day";			
			if(($pages = $this->sendRequest($url))){
				return $pages;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}
	
	
	/**
	 * Повертає найпопулярніші сторінки входу за певний період у вигляді XML
	 *
	 * @param int $startDate - початкова дата формування звіту (формат YYYYMMDD)
	 * @param int $endDate - кінцева дата звіту формування (формат YYYYMMDD)
	 * @return false|string
	 */
	public function getEntrancePagesByPeriod($startDate, $endDate){
		if(($startDate != '') and ($endDate != '') and ($this->loggedCookies != '')){
			$url = "https://www.google.com/analytics/reporting/export?fmt=1&id=$this->projectId&pdr=$startDate-$endDate&cmp=average&trows=10&gdfmt=nth_day&rpt=EntrancesReport&gdfmt=nth_day";
			if(($entrances = $this->sendRequest($url))){
				return $entrances;

			}	else{
				return false;

			}

		}	else{
			return false;

		}

	}	

}

?>