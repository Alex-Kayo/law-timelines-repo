<?php

/**
 * Клас для отримання статистики відвідувань сайту і занесення в БД
 *
 */
class TraficParser_Controller extends Template_Controller {

    /**
     * Об'єкт класу GoogleAnalitics
     *
     * @var GoogleAnalitics
     */
    private $ga;

    /**
     * Об'єкт класу Statistic
     *
     * @var Statistic
     */
    private $statistic;

    /**
     * Конфігураційний файл
     *
     * @var array
     */
    private $config;

    /**
     * Конструтор.  
     * 
     * Здійснюється отримання конфігуваційного файлу і створення об'єктів 
     * класів GoogleAnalitics та statistic
     *
     */
    public function __construct() {
        set_time_limit(0);
        $this->config = Kohana::config('google_analitics.default');
        $this->ga = new MY_GoogleAnalitics($this->config['login'], $this->config['password'], $this->config['project_id']);
        $this->statistic = new MY_Statistic();
    }

    /**
     * Метод,  що виконується по замовчуванню,  якщо не вказано конкретну дію.
     * 
     * В ньому здійснюється отримання усіх статистичних даних на дату запуску 
     *
     */
    public function index($dateStart = '', $dateFinish = '') {

        $date = $this->checkDateParameters($dateStart, $dateFinish);
        $dateStart = $date[0];
        $dateFinish = $date[1];
        unset($date);

        //Статистика відвідувань
        $this->visitsStatistic($dateStart, $dateFinish);
        $this->visitorsStatistic($dateStart, $dateFinish);
        $this->visitedPagesStatistic($dateStart, $dateFinish);
        $this->refusesStatistic($dateStart, $dateFinish);
        $this->directStatistic($dateStart, $dateFinish);

        //Статистика відвідування сторінок
        $this->topPagesStatistic($dateStart, $dateFinish);
        $this->entrancePagesStatistic($dateStart, $dateFinish);

        //Статистика трафіку
        $this->pageReferersStatistic($dateStart, $dateFinish);
        $this->searchEnginesStatistic($dateStart, $dateFinish);
    }

    /**
     * Зчитування та занесення статистики про відвідування в БД
     *
     * @param int $dateStart - початкова дата в форматі YYYYMMDD
     * @param int $dateFinish - кінцева дата в форматі YYYYMMDD
     */
    public function visitsStatistic($dateStart = '', $dateFinish = '') {
        $filesPath = $this->config['files_path'];

        $date = $this->checkDateParameters($dateStart, $dateFinish);
        $dateStart = $date[0];
        $dateFinish = $date[1];
        unset($date);

        file_put_contents($filesPath . 'visits_' . $dateFinish . '.xml', $this->ga->getVisitsByPeriod($dateStart, $dateFinish));

        $item = $this->statistic->startReadElement($filesPath . 'visits_' . $dateFinish);
        if (!empty($item['BarList'])) {
            foreach ($item['BarList'] as $value) {
                $date = strtotime($value['Label']);
                $visitors = intval(str_replace(',', '', $value['Value']));
                if (!$this->statistic->insertVisitsStatistic($visitors, $date)) {
                    Log::add('error', 'Неможливо записати статистику про відвідування в БД');
                }
            }
        } else {
            Log::add('error', 'Статистика відвідування пуста');
        }

        //unlink($filesPath . 'visits_' . $dateFinish . '.xml');
    }

    /**
     * Зчитування та занесення статистики про відвідувачів в БД
     *
     * @param int $dateStart - початкова дата в форматі YYYYMMDD
     * @param int $dateFinish - кінцева дата в форматі YYYYMMDD
     */
    public function visitorsStatistic($dateStart = '', $dateFinish = '') {
        $filesPath = $this->config['files_path'];

        $date = $this->checkDateParameters($dateStart, $dateFinish);
        $dateStart = $date[0];
        $dateFinish = $date[1];
        unset($date);

        file_put_contents($filesPath . 'visitors_' . $dateFinish . '.xml', $this->ga->getUniqueVisitorsByPeriod($dateStart, $dateFinish));

        $item = $this->statistic->startReadElement($filesPath . 'visitors_' . $dateFinish);
        if (!empty($item['BarList'])) {
            foreach ($item['BarList'] as $value) {
                $date = strtotime($value['Label']);
                $visitors = intval(str_replace(',', '', $value['Value']));
                if (!$this->statistic->insertVisitorsStatistic($visitors, $date)) {
                    Log::add('error', 'Неможливо записати статистику про відвідувачів в БД');
                }
            }
        } else {
            Log::add('error', 'статистика про відвідувачів пуста');
        }

        //unlink($filesPath . 'visitors_' . $dateFinish . '.xml');
    }

    /**
     * Зчитування та занесення статистики про відвідані сторінки в БД
     *
     * @param int $dateStart - початкова дата в форматі YYYYMMDD
     * @param int $dateFinish - кінцева дата в форматі YYYYMMDD
     */
    public function visitedPagesStatistic($dateStart = '', $dateFinish = '') {
        $filesPath = $this->config['files_path'];

        $date = $this->checkDateParameters($dateStart, $dateFinish);
        $dateStart = $date[0];
        $dateFinish = $date[1];
        unset($date);

        file_put_contents($filesPath . 'visited_pages_' . $dateFinish . '.xml', $this->ga->getPageVisitedByPeriod($dateStart, $dateFinish));

        $item = $this->statistic->startReadElement($filesPath . 'visited_pages_' . $dateFinish);
        if (!empty($item['BarList'])) {
            foreach ($item['BarList'] as $value) {
                $date = strtotime($value['Label']);
                $visitedPages = intval(str_replace(',', '', $value['Value']));
                if (!$this->statistic->insertVisitedPagesStatistic($visitedPages, $date)) {
                    Log::add('error', 'Неможливо записати статистику про відвідані сторінки в БД');
                }
            }
        } else {
            Log::add('error', 'Статистика про відвідані сторінки пуста');
        }

        //unlink($filesPath . 'visited_pages_' . $dateFinish . '.xml');
    }

    /**
     * Зчитування та занесення статистики про відмови в БД
     *
     * @param int $dateStart - початкова дата в форматі YYYYMMDD
     * @param int $dateFinish - кінцева дата в форматі YYYYMMDD
     */
    public function refusesStatistic($dateStart = '', $dateFinish = '') {
        $filesPath = $this->config['files_path'];

        $date = $this->checkDateParameters($dateStart, $dateFinish);
        $dateStart = $date[0];
        $dateFinish = $date[1];
        unset($date);

        file_put_contents($filesPath . 'refuses_' . $dateFinish . '.xml', $this->ga->getRefusesByPeriod($dateStart, $dateFinish));

        $item = $this->statistic->startReadElement($filesPath . 'refuses_' . $dateFinish);
        if (!empty($item['BarList'])) {
            foreach ($item['BarList'] as $value) {
                $date = strtotime($value['Label']);
                $persents = str_replace('.', ',', (floatval(str_replace('%', '', $value['Value']))));
                if (!$this->statistic->insertRefusesStatistic($persents, $date)) {
                    Log::add('error', 'Неможливо записати статистику про відмови в БД');
                }
            }
        } else {
            Log::add('error', 'Статистика відмов пуста');
        }

        //unlink($filesPath . 'refuses_' . $dateFinish . '.xml');
    }

    /**
     * Зчитування та занесення статистики про прямі входження на сайт в БД
     *
     * @param int $dateStart - початкова дата в форматі YYYYMMDD
     * @param int $dateFinish - кінцева дата в форматі YYYYMMDD
     */
    public function directStatistic($dateStart = '', $dateFinish = '') {
        $filesPath = $this->config['files_path'];

        $date = $this->checkDateParameters($dateStart, $dateFinish);
        $dateStart = $date[0];
        $dateFinish = $date[1];
        unset($date);

        file_put_contents($filesPath . 'direct_' . $dateFinish . '.xml', $this->ga->getDirectSourceByPeriod($dateStart, $dateFinish));

        $item = $this->statistic->startReadElement($filesPath . 'direct_' . $dateFinish, 'Graph', 'Serie');

        if (!empty($item['Point'])) {
            foreach ($item['Point'] as $value) {
                $date = strtotime($value['Label']);
                $visits = intval($value['Value']);
                if (!$this->statistic->insertDirectStatistic($visits, $date)) {
                    Log::add('error', 'Неможливо записати статистику прямого заходження в БД');
                }
            }
        } else {
            Log::add('error', 'Статистика прямого заходження пуста');
        }

        //unlink($filesPath . 'direct_' . $dateFinish . '.xml');
    }

    /**
     * Зчитування та занесення статистики про найпопулярніші сторінки в БД
     *
     * @param int $dateStart - початкова дата в форматі YYYYMMDD
     * @param int $dateFinish - кінцева дата в форматі YYYYMMDD
     */
    public function topPagesStatistic($dateStart = '', $dateFinish = '') {
        $filesPath = $this->config['files_path'];

        $date = $this->checkDateParameters($dateStart, $dateFinish);
        $dateStart = $date[0];
        $dateFinish = $date[1];
        unset($date);

        $intDateStart = $this->strToTimestamp($dateStart);
        $intDateFinish = $this->strToTimestamp($dateFinish);

        $topPagesData = array();
        for ($i = $intDateFinish; $i >= $intDateStart; $i-= 86400) {
            $dateValue = date("Ymd", $i);

            file_put_contents($filesPath . 'popular_' . $dateValue . '.xml', $this->ga->getTopPagesByPeriod($dateValue, $dateValue));

            $item = $this->statistic->startReadElement($filesPath . 'popular_' . $dateValue, 'Report', 'Table');
            if (!empty($item)) {
                foreach ($item['Row'] as $value) {
                    if (trim($value['Key']) == '/') {
                        $url = '/index.php';
                    } else {
                        $url = trim($value['Key']);
                    }

                    $visits = intval($value['Cell'][0]['Content'][0]['Value']);
                    $time = $this->statistic->timeToSeconds($value['Cell'][2]['Content'][0]['Value']);
                    $newVisits = intval(str_replace('%', '', $value['Cell'][3]['Content'][0]['Value']));
                    $refuses = str_replace('.', ',', (floatval(str_replace('%', '', $value['Cell'][4]['Content'][0]['Value']))));
                    $date = $i;

                    if (!isset($topPagesData[$date])) {
                        $topPagesData[$date] = array();
                    }

                    $topPagesData[$date][] = array('url' => $url,
                        'visits' => $visits,
                        'time' => $time,
                        'newVisits' => $newVisits,
                        'refuses' => $refuses);
                }
            }

            //unlink($filesPath . 'popular_' . $dateValue . '.xml');
        }

        if (!empty($topPagesData)) {
            if (!($this->statistic->insertTopPagesStatistic($topPagesData))) {
                Log::add('error', 'Неможливо записати статистику найпопулярніших сторінок в БД');
            }
        } else {
            Log::add('error', 'Статистика найпопулярніших сторінок пуста');
        }
    }

    /**
     * Зчитування та занесення статистики про точки входу в БД
     *
     * @param int $dateStart - початкова дата в форматі YYYYMMDD
     * @param int $dateFinish - кінцева дата в форматі YYYYMMDD
     */
    public function entrancePagesStatistic($dateStart = '', $dateFinish = '') {
        $filesPath = $this->config['files_path'];

        $date = $this->checkDateParameters($dateStart, $dateFinish);
        $dateStart = $date[0];
        $dateFinish = $date[1];
        unset($date);

        $intDateStart = $this->strToTimestamp($dateStart);
        $intDateFinish = $this->strToTimestamp($dateFinish);

        $entrancePagesData = array();
        for ($i = $intDateFinish; $i >= $intDateStart; $i-= 86400) {
            $dateValue = date("Ymd", $i);

            file_put_contents($filesPath . 'entrance_' . $dateValue . '.xml', $this->ga->getEntrancePagesByPeriod($dateValue, $dateValue));

            $item = $this->statistic->startReadElement($filesPath . 'entrance_' . $dateValue, 'Report', 'Table');
            if (!empty($item)) {
                foreach ($item['Row'] as $value) {
                    if (trim($value['Key']) == '/') {
                        $url = '/index.php';
                    } else {
                        $url = trim($value['Key']);
                    }

                    $visits = intval($value['Cell'][0]['Content'][0]['Value']);
                    $refuses = str_replace('.', ',', (floatval(str_replace('%', '', $value['Cell'][2]['Content'][0]['Value']))));
                    $date = $i;

                    if (!isset($entrancePagesData[$date])) {
                        $entrancePagesData[$date] = array();
                    }

                    $entrancePagesData[$date][] = array('url' => $url,
                        'visits' => $visits,
                        'refuses' => $refuses);
                }
            }

            //unlink($filesPath . 'entrance_' . $dateValue . '.xml');
        }

        if (!empty($entrancePagesData)) {
            if (!($this->statistic->insertEntrancePagesStatistic($entrancePagesData))) {
                Log::add('error', 'Неможливо записати статистику точок входу в БД');
            }
        } else {
            Log::add('error', 'Статистика точок входу пуста');
        }
    }

    /**
     * Здійснюється отримання статистичних даних про сторінки переходу 
     * і занесення в БД
     *
     * @param int $dateStart - початкова дата в форматі YYYYMMDD
     * @param int $dateFinish - кінцева дата в форматі YYYYMMDD
     * 
     */
    public function pageReferersStatistic($dateStart = '', $dateFinish = '') {
        $filesPath = $this->config['files_path'];

        $date = $this->checkDateParameters($dateStart, $dateFinish);
        $dateStart = $date[0];
        $dateFinish = $date[1];
        unset($date);

        $intDateStart = $this->strToTimestamp($dateStart);
        $intDateFinish = $this->strToTimestamp($dateFinish);

        //Формування статистики сайтів - джерел переходів
        $sitesData = array();
        for ($i = $intDateFinish; $i >= $intDateStart; $i-= 86400) {
            $dateValue = date("Ymd", $i);

            file_put_contents($filesPath . 'sites_' . $dateValue . '.xml', $this->ga->getPageReferersByPeriod($dateValue, $dateValue));

            $item = $this->statistic->startReadElement($filesPath . 'sites_' . $dateValue, 'Report', 'Table');

            if (!empty($item)) {
                foreach ($item['Row'] as $value) {
                    $url = trim($value['Key']);
                    $visits = intval($value['Cell'][0]['Content'][0]['Value']);
                    $time = $this->statistic->timeToSeconds($value['Cell'][2]['Content'][0]['Value']);
                    $newVisits = intval(str_replace('%', '', $value['Cell'][3]['Content'][0]['Value']));
                    $refuses = intval(str_replace('%', '', $value['Cell'][4]['Content'][0]['Value']));
                    $date = $i;

                    if (!isset($sitesData[$date])) {
                        $sitesData[$date] = array();
                    }

                    $sitesData[$date][] = array('url' => $url,
                        'visits' => $visits,
                        'time' => $time,
                        'newVisits' => $newVisits,
                        'refuses' => $refuses);
                }
            }

            //unlink( $filesPath . 'sites_' . $dateValue . '.xml');
        }

        if (!empty($sitesData)) {
            if (!($this->statistic->insertPageRefererStatistic($sitesData))) {
                Log::add('error', 'Неможливо записати статистику сторінок переходу в БД');
            }
        } else {
            Log::add('error', 'статистика сторінок переходу пуста');
        }
    }

    /**
     * Здійснюється отримання статистичних даних про пошунові системи,  
     * з яких відбувався перехід і занесення в БД
     *
     * @param int $dateStart - початкова дата в форматі YYYYMMDD
     * @param int $dateFinish - кінцева дата в форматі YYYYMMDD
     * 
     */
    public function searchEnginesStatistic($dateStart = '', $dateFinish = '') {
        $filesPath = $this->config['files_path'];

        $date = $this->checkDateParameters($dateStart, $dateFinish);
        $dateStart = $date[0];
        $dateFinish = $date[1];
        unset($date);

        $intDateStart = $this->strToTimestamp($dateStart);
        $intDateFinish = $this->strToTimestamp($dateFinish);

        //Формування статистики сайтів - пошукових машин
        $searchEnginesData = array();
        for ($i = $intDateFinish; $i >= $intDateStart; $i-= 86400) {
            $dateValue = date("Ymd", $i);

            file_put_contents($filesPath . 'search_' . $dateValue . '.xml', $this->ga->getSearchEnginesByPeriod($dateValue, $dateValue));

            $item = $this->statistic->startReadElement($filesPath . 'search_' . $dateValue, 'Report', 'Table');
            if (!empty($item)) {
                foreach ($item['Row'] as $value) {
                    $url = trim($value['Key']);
                    $visits = intval($value['Cell'][0]['Content'][0]['Value']);
                    $time = $this->statistic->timeToSeconds($value['Cell'][2]['Content'][0]['Value']);
                    $newVisits = intval(str_replace('%', '', $value['Cell'][3]['Content'][0]['Value']));
                    $refuses = intval(str_replace('%', '', $value['Cell'][4]['Content'][0]['Value']));
                    $date = $i;

                    if (!isset($searchEnginesData[$date])) {
                        $searchEnginesData[$date] = array();
                    }

                    $searchEnginesData[$date][] = array('url' => $url,
                        'visits' => $visits,
                        'time' => $time,
                        'newVisits' => $newVisits,
                        'refuses' => $refuses);
                }
            }

            //unlink($filesPath . 'search_' . $dateValue . '.xml');
        }

        if (!empty($searchEnginesData)) {
            if (!($this->statistic->insertSearchEnginesStatistic($searchEnginesData))) {
                Log::add('error', 'Неможливо записати статистику пошукових систем в БД');
            }
        } else {
            Log::add('error', 'Статистика пошукових систем пуста');
        }
    }

    /**
     * Перевіряє правельність введеної дати
     *
     * @param int $dateStart - початкова дата в форматі YYYYMMDD
     * @param int $dateFinish - кінцева дата в форматі YYYYMMDD
     * @return unknown
     */
    private function checkDateParameters($dateStart = '', $dateFinish = '') {
        if (($dateStart == '') and ($dateFinish == '')) {
            $currentDay = date("d");
            $currentMonth = date("m");
            $currentYear = date("Y");

            $dateFinish = date("Ymd", mktime(0, 0, 0, $currentMonth, $currentDay, $currentYear));
            $dateStart = date("Ymd", mktime(0, 0, 0, $currentMonth, $currentDay - 1, $currentYear));
        }

        if ($dateFinish == '') {
            $dateFinish = $dateStart;
        }

        return array($dateStart, $dateFinish);
    }

    /**
     * Конвертує дату зі стрічки в формат Unix
     *
     * @param int $date - вхідна дата в форматі YYYYMMDD
     * @return timestamp
     */
    private function strToTimestamp($date) {
        preg_match('/(\d\d\d\d)(\d\d)(\d\d)/', $date, $out);
        if (!empty($out)) {
            $timeStamp = mktime(0, 0, 0, $out[2], $out[3], $out[1]);
        } else {
            $timeStamp = mktime(0, 0, 0, date("m"), date("d"), date("Y"));
        }

        return $timeStamp;
    }

}

?>