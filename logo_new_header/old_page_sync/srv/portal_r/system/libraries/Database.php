<?php
/**
 * Клас для забезпечення доступу до бази даних
 * 
 * @example $query = $db->select('*')->from('tabl')->where('id>','1')->limit(2,2)->get();
 * @example $query = $db->query("select * from tabl where id>1");
  */
class Database_Core {

	/**
	 * Префікс таблиць
	 *
	 * @var string
	 */
	private $tablePrefix = '';
	
	
	/**
	 * Збереження об"єкту  БД
	 *
	 * @var array
	 */
	public static $instances = array();

	/**
	 * Діагоностика
	 *
	 * @var array
	 */
	public static $benchmarks = array();

	/**
	 * Конфігурація
	 *
	 * @var array
	 */
	protected $config = array
	(
		'benchmark'     => TRUE,
		'persistent'    => FALSE,
		'connection'    => '',
		'character_set' => 'utf8',
		'table_prefix'  => '',
		'object'        => TRUE,
		'cache'         => FALSE,
		'escape'        => TRUE,
	);

	/**
	 * Об"єкт драйвера
	 *
	 * @var object
	 */
	protected $driver;
	
	/**
	 * Об"єкт з"єднання з БД
	 *
	 * @var resource
	 */
	protected $link;

	
	/**
	 * Некомпільовані частини SQL запиту
	 *
	 * @var unknown_type
	 */	
	protected $select     = array();
	protected $set        = array();
	protected $from       = array();
	protected $join       = array();
	protected $where      = array();
	protected $orderby    = array();
	protected $order      = array();
	protected $groupby    = array();
	protected $having     = array();
	protected $distinct   = FALSE;
	protected $limit      = FALSE;
	protected $offset     = FALSE;
	protected $last_query = '';


     /**
      * Count the number of records in the last query, without LIMIT or OFFSET applied.
      *
      * @return  integer
      */
     public function count_last_query()
     {    
          if ($sql = $this->driver->sqlWithoutLimit)
          {
          	/*
               $pattern = '~SELECT \s* \* \s* FROM \s* \(\s*SELECT \s* rownum \s* as \s* linenum, \s* p_query\.\* \s* FROM \s* \(~isx';
               $sql = preg_replace($pattern, '', $sql);
            
               $pattern = '~\) \s* p_query \s* WHERE \s* rownum \s* <= \s* \d+\) \s* WHERE \s* linenum \s* >= \s* \d+~isx';
               $sql = preg_replace($pattern, '', $sql);
			*/                        
               $result = $this->query
               (
                    'SELECT /*+parallel(a)*/  COUNT(*) AS '.$this->escape_column('count').' '.
                    'FROM ('.trim($sql).') '.$this->escape_table('counted_results')
               );

               // Return the total number of rows from the query
               return (int) $result->current()->count;
 
          }

          return FALSE;
     }

	/**
	 * Повертає сингтон БД
	 *
	 * @param   mixed   конфігурація масив або DSN
	 * @return  Database_Core
	 */
	public static function & instance($name = 'default', $config = NULL){
		if ( ! isset(Database::$instances[$name])){
			Database::$instances[$name] = new Database($config === NULL ? $name : $config);
			
		}

		return Database::$instances[$name];
	}

	/**
	 * Повертає назву заданого екземпляру
	 *
	 * @param   Database  екземпляр БД
	 * @return  string
	 */
	public static function instance_name(Database $db){
		return array_search($db, Database::$instances, TRUE);
		
	}

	
	/**
	 * Встановлює конфігурацію бази даних, завантажує Database_Driver.
	 *
	 * @throws  Kohana_Database_Exception
	 */
	public function __construct($config = array()){
		if (empty($config)){
			$config = Kohana::config('database.default');
		} elseif (is_array($config) AND count($config) > 0) {
			if ( ! array_key_exists('connection', $config)) {
				$config = array('connection' => $config);
			}
		} elseif (is_string($config)) {
			if (strpos($config, '://') !== FALSE) {
				$config = array('connection' => $config);
			} else {
				$name = $config;

				if (($config = Kohana::config('database.'.$config)) === NULL)
					throw new Kohana_Database_Exception('database.undefined_group', $name);
			}
		}

		$this->config = array_merge($this->config, $config);

		if (is_string($this->config['connection'])){
			if (strpos($this->config['connection'], '://') === FALSE)
				throw new Kohana_Database_Exception('database.invalid_dsn', $this->config['connection']);

			$db = array
			(
				'type'     => FALSE,
				'user'     => FALSE,
				'pass'     => FALSE,
				'host'     => FALSE,
				'port'     => FALSE,
				'socket'   => FALSE,
				'database' => FALSE
			);

			list ($db['type'], $connection) = explode('://', $this->config['connection'], 2);

			if (strpos($connection, '@') !== FALSE){
				// Визначення користувача і пароля
				list ($db['pass'], $connection) = explode('@', $connection, 2);
				$logindata = explode(':', $db['pass'], 2);
				$db['pass'] = (count($logindata) > 1) ? $logindata[1] : '';
				$db['user'] = $logindata[0];

				$connection = explode('/', $connection);

				$db['database'] = array_pop($connection);

				$connection = implode('/', $connection);

				// Пошук сокета
				if (preg_match('/^unix\([^)]++\)/', $connection)){
					list ($db['socket'], $connection) = explode(')', substr($connection, 5), 2);
				} elseif (strpos($connection, ':') !== FALSE) {
					list ($db['host'], $db['port']) = explode(':', $connection, 2);
				} else {
					$db['host'] = $connection;
				}
			} else {
				// Файл з"єдання
				$connection = explode('/', $connection);
				$db['database'] = array_pop($connection);
				$db['socket'] = implode('/', $connection).'/';
			}

			$this->config['connection'] = $db;
		}
		// Встановлення назви драйверу
		$driver = 'Database_'.ucfirst($this->config['connection']['type']).'_Driver';

		// Завантаження драйверу
		if ( ! Kohana::auto_load($driver)){
			throw new Kohana_Database_Exception('core.driver_not_found', $this->config['connection']['type'], get_class($this));
			
		}

		// Ініціалізація драйверу
		$this->driver = new $driver($this->config);

		// Валідація драйверу
		if ( ! ($this->driver instanceof Database_Driver)){
			throw new Kohana_Database_Exception('core.driver_implements', $this->config['connection']['type'], get_class($this), 'Database_Driver');
			
		}

		Kohana::log('debug', 'Database Library initialized');
	}

	/**
	 * Створення з"єднання
	 *
	 * @return  void
	 */
	public function connect(){
		if ( ! is_resource($this->link) AND ! is_object($this->link)){
			$this->link = $this->driver->connect();
			if ( ! is_resource($this->link) AND ! is_object($this->link)){
				throw new Kohana_Database_Exception('database.connection', $this->driver->show_error());
				
			}

			//Видалити пароль з"єднання
			$this->config['connection']['pass'] = NULL;
		}
	}


	/**
	 * Запит з LOB данними в файл
	 *
	 * @param  string  SQL запит
	 * @param string fieldLobData - поле з LOB данними
	 * @param string fieldFileName - поле з назвою файла
	 * @return array
	 */
	 public function lobQueryToFile($sql, $fieldLobData, $fieldFileName){	
		if ($sql == ''){
			return FALSE;
		}

		if(!$this->link){
			$this->connect();
			
		}

		// старт діагностики
		$start = microtime(TRUE);		
		
		$result = $this->driver->lobQueryToFile($sql, $fieldLobData, $fieldFileName);
		
		
		// завершення діагоностики
		$stop = microtime(TRUE);	
		
		
			
		if ($this->config['benchmark'] == TRUE){
			// діагоностика запиту

			self::$benchmarks[] = array('query' => $sql, 'time' => $stop - $start, 'rows' => 1);
			
		}
		
		return $result;
		
	}
	
	
	/**
	 * Виконання запиту за допомогою драйвера
	 *
	 * @param   string  SQL запит для виконання
	 * @return  Database_Result
	 */
	public function query($sql = ''){
		if ($sql == ''){
			return FALSE;
		}

		if(!$this->link){
			$this->connect();
			
		}

		// старт діагностики
		$start = microtime(TRUE);

		if (func_num_args() > 1){
			$argv = func_get_args();
			$binds = (is_array(next($argv))) ? current($argv) : array_slice($argv, 1);
			
		}

		// Компіляція bind змінних
		if (isset($binds)){
			$sql = $this->compile_binds($sql, $binds);
			
		}

		$result = $this->driver->query($this->last_query = $sql);
		
		// завершення діагоностики
		$stop = microtime(TRUE);

		if ($this->config['benchmark'] == TRUE){
			// діагоностика запиту
			
			$bindData = array();			
			if(property_exists($result, 'bindVar')){
				foreach ($result->bindVar as $key => $val)	{
					$bindData[] = $val['name'] . '('. $val['type'] . ")='" . $val['value'] . "'";
					
				}
				
			}
			self::$benchmarks[] = array('query' => $sql . (count($bindData) > 0 ? '================BIND DATA: ' .  implode(' , ', $bindData) : ''), 'time' => $stop - $start, 'rows' => count($result));
			
		}

		return $result;
	}

	/**
	 * Вибір колонок запиту
	 *
	 * @param   string|array  стрічка або масив назв колонок SELECT
	 * @return  Database_Core  об"єкт БД.
	 */
	public function select($sql = '*'){	
		if (func_num_args() > 1){
			$sql = func_get_args();
			
		} elseif (is_string($sql)) {
			$sql = explode(',', $sql);
			
		} else {
			$sql = (array) $sql;
		}

		foreach ($sql as $val) {
			if (($val = trim($val)) === ''){
				continue;
				
			}

			
			if (strpos($val, '(') === FALSE AND $val !== '*'){
				if (preg_match('/^DISTINCT\s++(.+)$/i', $val, $matches)) {
					$val            = $this->table_prefix().$matches[1];
					$this->distinct = TRUE;
					
				} else {
					$val = (strpos($val, '.') !== FALSE) ? $this->table_prefix().$val : $val;
					
				}

				$val = $this->driver->escape_column($val);
			}

			$this->select[] = $val;
		}

		return $this;
	}

	/**
	 * Вибір таблиці запиту
	 *
	 * @param   string|array  стрічка або масив таблиць SELECT
	 * @return  Database_Core  об"єкт БД.
	 */
	public function from($sql){
		if (func_num_args() > 1){
			$sql = func_get_args();
			
		} elseif (is_string($sql)) {
			$sql = explode(',', $sql);
			
		} else {
			$sql = (array) $sql;
			
		}

		foreach ($sql as $val) {
			if (($val = trim($val)) === ''){
				continue;
			}

			$this->from[] = $this->table_prefix().$val;
		}

		return $this;
	}

	/**
	 * Встановлення "JOIN" блоку для виборки.
	 *
	 * @param   string        назва таблиці
	 * @param   string|array  where ключ або масив ключ => значення
	 * @param   string        where значення
	 * @param   string        тип join (LEFT, RIGHT ...)
	 * @return  Database_Core        об"єкт БД.
	 */
	public function join($table, $key, $value = NULL, $type = ''){
		$join = array();

		if ( ! empty($type)){
			$type = strtoupper(trim($type));

			if ( ! in_array($type, array('LEFT', 'RIGHT', 'OUTER', 'INNER', 'LEFT OUTER', 'RIGHT OUTER'), TRUE)){
				$type = '';
				
			} else {
				$type .= ' ';
				
			}
		}

		$cond = array();
		$keys  = is_array($key) ? $key : array($key => $value);
		foreach ($keys as $key => $value) {
			$key    = (strpos($key, '.') !== FALSE) ? $this->table_prefix().$key : $key;
			$cond[] = $this->driver->where($key, $this->driver->escape_column($this->table_prefix().$value), 'AND ', count($cond), FALSE);
			
		}

		if( ! is_array($this->join)) { 
				$this->join = array(); 
		}

		foreach ((array) $table as $t){
			$join['tables'][] = $this->driver->escape_column($this->table_prefix().$t);
			
		}

		$join['conditions'] = '('.trim(implode(' ', $cond)).')';
		$join['type'] = $type;

		$this->join[] = $join;

		return $this;
	}


	/**
	 * Встановлення блоку "WHERE" для запиту.
	 *
	 * @param   string|array  назва ключа або масив ключ => значення
	 * @param   string        значення, що відповідає ключу
	 * @param   boolean       блокування цитування WHERE умови
	 * @return  Database_Core        об"єкт БД
	 */
	public function where($key, $value = NULL, $quote = TRUE){
		$quote = (func_num_args() < 2 AND ! is_array($key)) ? -1 : $quote;
		$keys  = is_array($key) ? $key : array($key => $value);

		foreach ($keys as $key => $value){
			$key           = (strpos($key, '.') !== FALSE) ? $this->table_prefix().$key : $key;
			$this->where[] = $this->driver->where($key, $value, 'AND ', count($this->where), $quote);
			
		}

		
		return $this;
	}

	/**
	 * Встановлення блоку "OR WHERE" для запиту.
	 *
	 * @param   string|array  назва ключа або масив ключ => значення
	 * @param   string        значення, що відповідає ключу
	 * @param   boolean       блокування цитування WHERE умови
	 * @return  Database_Core        об"єкт БД
	 */
	public function orwhere($key, $value = NULL, $quote = TRUE){
		$quote = (func_num_args() < 2 AND ! is_array($key)) ? -1 : $quote;
		$keys  = is_array($key) ? $key : array($key => $value);

		foreach ($keys as $key => $value){
			$key           = (strpos($key, '.') !== FALSE) ? $this->table_prefix().$key : $key;
			$this->where[] = $this->driver->where($key, $value, 'OR ', count($this->where), $quote);
			
		}

		return $this;
	}

	/**
	 * Встановлення блоку "LIKE"  для запиту.
	 *
	 * @param   string|array  назва колонки або масив колонка => умова
	 * @param   string        умова like
	 * @param   boolean       автоматичне додавання початкових і кінцевих підстановлювальних знаків
	 * @return  Database_Core       об"єкт БД
	 */
	public function like($field, $match = '', $auto = TRUE){
		$fields = is_array($field) ? $field : array($field => $match);

		foreach ($fields as $field => $match){
			$field         = (strpos($field, '.') !== FALSE) ? $this->table_prefix().$field : $field;
			$this->where[] = $this->driver->like($field, $match, $auto, 'AND ', count($this->where));
			
		}

		return $this;
	}

	/**
	 * Встановлення блоку "OR LIKE"  для запиту.
	 *
	 * @param   string|array  назва колонки або масив колонка => умова
	 * @param   string        умова like
	 * @param   boolean       автоматичне додавання початкових і кінцевих підстановлювальних знаків
	 * @return  Database_Core       об"єкт БД
	 */
	public function orlike($field, $match = '', $auto = TRUE){
		$fields = is_array($field) ? $field : array($field => $match);

		foreach ($fields as $field => $match){
			$field         = (strpos($field, '.') !== FALSE) ? $this->table_prefix().$field : $field;
			$this->where[] = $this->driver->like($field, $match, $auto, 'OR ', count($this->where));
			
		}

		return $this;
	}

	/**
	 * Встановлення блоку "NOT LIKE"  для запиту.
	 *
	 * @param   string|array  назва колонки або масив колонка => умова
	 * @param   string        умова like
	 * @param   boolean       автоматичне додавання початкових і кінцевих підстановлювальних знаків
	 * @return  Database_Core       об"єкт БД
	 */
	public function notlike($field, $match = '', $auto = TRUE){
		$fields = is_array($field) ? $field : array($field => $match);

		foreach ($fields as $field => $match){
			$field         = (strpos($field, '.') !== FALSE) ? $this->table_prefix().$field : $field;
			$this->where[] = $this->driver->notlike($field, $match, $auto, 'AND ', count($this->where));
			
		}

		return $this;
	}

	/**
	 * Встановлення блоку "OR NOT LIKE"  для запиту.
	 *
	 * @param   string|array  назва колонки або масив колонка => умова
	 * @param   string        умова like
	 * @param   boolean       автоматичне додавання початкових і кінцевих підстановлювальних знаків
	 * @return  Database_Core       об"єкт БД
	 */
	public function ornotlike($field, $match = '', $auto = TRUE){
		$fields = is_array($field) ? $field : array($field => $match);

		foreach ($fields as $field => $match){
			$field         = (strpos($field, '.') !== FALSE) ? $this->table_prefix().$field : $field;
			$this->where[] = $this->driver->notlike($field, $match, $auto, 'OR ', count($this->where));
			
		}

		return $this;
	}

	/**
	 * Встановлення умови з регулярним виразом (REGEX)
	 *
	 * @param   string|array  назва колонки або масив колонка => умова
	 * @param   string        умова
	 * @return  Database_Core        об"єкт БД
	 */
	public function regex($field, $match = ''){
		$fields = is_array($field) ? $field : array($field => $match);

		foreach ($fields as $field => $match){
			$field         = (strpos($field, '.') !== FALSE) ? $this->table_prefix().$field : $field;
			$this->where[] = $this->driver->regex($field, $match, 'AND ', count($this->where));
			
		}

		return $this;
	}

	/**
	 * Встановлення умови з регулярним виразом (OR REGEX)
	 *
	 * @param   string|array  назва колонки або масив колонка => умова
	 * @param   string        умова
	 * @return  Database_Core        об"єкт БД
	 */
	public function orregex($field, $match = ''){
		$fields = is_array($field) ? $field : array($field => $match);

		foreach ($fields as $field => $match){
			$field         = (strpos($field, '.') !== FALSE) ? $this->table_prefix().$field : $field;
			$this->where[] = $this->driver->regex($field, $match, 'OR ', count($this->where));
			
		}

		return $this;
	}

	/**
	 * Встановлення умови з регулярним виразом (NOT REGEX)
	 *
	 * @param   string|array  назва колонки або масив колонка => умова
	 * @param   string        умова
	 * @return  Database_Core        об"єкт БД
	 */
	public function notregex($field, $match = ''){
		$fields = is_array($field) ? $field : array($field => $match);

		foreach ($fields as $field => $match){
			$field         = (strpos($field, '.') !== FALSE) ? $this->table_prefix().$field : $field;
			$this->where[] = $this->driver->notregex($field, $match, 'AND ', count($this->where));
			
		}

		return $this;
	}

	/**
	 * Встановлення умови з регулярним виразом (OR NOT REGEX)
	 *
	 * @param   string|array  назва колонки або масив колонка => умова
	 * @param   string        умова
	 * @return  Database_Core        об"єкт БД
	 */
	public function ornotregex($field, $match = ''){
		$fields = is_array($field) ? $field : array($field => $match);

		foreach ($fields as $field => $match){
			$field         = (strpos($field, '.') !== FALSE) ? $this->table_prefix().$field : $field;
			$this->where[] = $this->driver->notregex($field, $match, 'OR ', count($this->where));
			
		}

		return $this;
	}

	/**
	 * Всьановлення групування для запиту
	 *
	 * @param   string  назва колонки
	 * @return  Database_Core  об"єкт БД
	 */
	public function groupby($by){
		if ( ! is_array($by)){
			$by = explode(',', (string) $by);
			
		}

		foreach ($by as $val){
			$val = trim($val);

			if ($val != ''){
				$this->groupby[] = $this->driver->escape_column($val);
				
			}
		}

		return $this;
	}

	/**
	 * Встановлення блоку "HAVING для запиту .
	 *
	 * @param   string|array  назва ключа або масив ключ => значення
	 * @param   string        значення, що відповідає ключу
	 * @param   boolean       блокування цитування WHERE умови
	 * @return  Database_Core        об"єкт БД
	 */
	public function having($key, $value = '', $quote = TRUE){
		$this->having[] = $this->driver->where($key, $value, 'AND', count($this->having), TRUE);
		return $this;
		
	}

	/**
	 * Встановлення блоку "OR HAVING" для запиту .
	 *
	 * @param   string|array  назва ключа або масив ключ => значення
	 * @param   string        значення, що відповідає ключу
	 * @param   boolean       блокування цитування WHERE умови
	 * @return  Database_Core        об"єкт БД
	 */
	public function orhaving($key, $value = '', $quote = TRUE){
		$this->having[] = $this->driver->where($key, $value, 'OR', count($this->having), TRUE);
		return $this;
		
	}

	/**
	 * Встановлення юлоку сортування для запиту
	 *
	 * @param   string|array  колонки для сортування, масив колонок або перелік колонок через кому
	 * @param   string        тип сортування (ASC, DESC.. )
	 * @return  Database_Core        об"єкт БД
	 */
	public function orderby($orderby, $direction = NULL){
		if ( ! is_array($orderby)){
			$orderby = array($orderby => $direction);
			
		}

		foreach ($orderby as $column => $direction){
			$direction = strtoupper(trim($direction));

			if ( ! in_array($direction, array('ASC', 'DESC', 'RAND()', 'RANDOM()', 'NULL'))){
				$direction = 'ASC';
			}

			$this->orderby[] = $this->driver->escape_column($column).' '.$direction;
		}

		return $this;
	}

	/**
	 * Встановлення блоку "LIMIT" для запиту.
	 *
	 * @param   integer  к-ть рядків виборки
	 * @param   integer  початковий рядок з якого починається вивід
	 * @return  Database_Core   об"єкт БД
	 */
	public function limit($limit, $offset = NULL){
		$this->limit  = (int) $limit;

		if ($offset !== NULL OR ! is_int($this->offset)){
			$this->offset($offset);
		}

		return $this;
	}

	/**
	 * Встановлює офсетну частину запиту.
	 *
	 * @param   integer  офсетне значення
	 * @return  Database_Core   об"єкт БД
	 */
	public function offset($value){
		$this->offset = (int) $value;

		return $this;
	}

	/**
	 * Встановлення значень ключ/значення для операцій INSERT, UPDATE
	 *
	 * @param   string|array  назва ключа або масив ключ => значення
	 * @param   string        значення, що відповідає ключу
	 * @return  Database_Core        об"єкт БД
	 */
	public function set($key, $value = ''){
		if ( ! is_array($key)){
			$key = array($key => $value);
		}

		foreach ($key as $k => $v){
			if (strpos($k, '.'))
				$k = $this->table_prefix().$k;

			$this->set[$k] = $this->driver->escape($v);
		}

		return $this;
	}

	/**
	 * Компіляція запиту
	 *
	 * @param   string  назва таблиці
	 * @param   string  к-ть рядків виборки
	 * @param   string  початковий рядок з якого починається вивід
	 * @return  Database_Result 
	 */
	public function get($table = '', $limit = NULL, $offset = NULL){
		if ($table != ''){
			$this->from($table);
			
		}

		if ( ! is_null($limit)){
			$this->limit($limit, $offset);
			
		}

		$sql = $this->driver->compile_select(get_object_vars($this));

		$this->reset_select();
		$result = $this->query($sql);
		$this->last_query = $sql;

		return $result;
	}

	/**
	 * Компіляція запиту
	 *
	 * @param   string  назва таблиці
	 * @param 	array	where умова
	 * @param   string  к-ть рядків виборки
	 * @param   string  початковий рядок з якого починається вивід
	 * @return  Database_Result 
	 */	
	public function getwhere($table = '', $where = NULL, $limit = NULL, $offset = NULL){
		if ($table != ''){
			$this->from($table);
			
		}

		if ( ! is_null($where)){
			$this->where($where);
			
		}

		if ( ! is_null($limit)){
			$this->limit($limit, $offset);
			
		}

		$sql = $this->driver->compile_select(get_object_vars($this));
		$this->reset_select();
		$result = $this->query($sql);
		
		return $result;
	}

	/**
	 * Компіляція запиту
	 *
	 * @param   string  назва таблиці
	 * @param   string  к-ть рядків виборки
	 * @param   string  початковий рядок з якого починається вивід
	 * @param   string  sql стрічка
	 * @return  Database_Result 
	 */	
	public function compile($table = '', $limit = NULL, $offset = NULL){
		if ($table != ''){
			$this->from($table);
			
		}

		if ( ! is_null($limit)){
			$this->limit($limit, $offset);
			
		}

		$sql = $this->driver->compile_select(get_object_vars($this));
		$this->reset_select();

		return $sql;
	}

	/**
	 * Компіляція INSERT для виконання
	 *
	 * @param   string  назва таблиці
	 * @param   array   масив ключ/значення для insert
	 * @return  Database_Result  
	 */
	public function insert($table = '', $set = NULL){
		if ( ! is_null($set)){
			$this->set($set);
			
		}

		if ($this->set == NULL){
			throw new Kohana_Database_Exception('database.must_use_set');
			
		}

		if ($table == ''){
			if ( ! isset($this->from[0])){
				throw new Kohana_Database_Exception('database.must_use_table');
				
			}

			$table = $this->from[0];
		}

		// Очистка кешу
		if($this->config['cache'] === TRUE){
			
			$this->clear_cache();
		}
		
		$sql = $this->driver->insert($this->table_prefix().$table, array_keys($this->set), array_values($this->set));
		$this->reset_write();

		return $this->query($sql);
	}

	/**
	 * Додавання "IN" умови в where блок
	 *
	 * @param   string  Ім'я колонки, що розглядається
	 * @param   mixed   масив або стрічка умови
	 * @param   bool    генерування "NOT IN"
	 * @return  Database_Core  об"єкт БД
	 */
	public function in($field, $values, $not = FALSE){
		if (is_array($values)){
			$escaped_values = array();
			foreach ($values as $v){
				if (is_numeric($v)){
					$escaped_values[] = $v;
					
				} else {
					$escaped_values[] = "'".$this->driver->escape_str($v)."'";
					
				}
			}
			$values = implode(",", $escaped_values);
		}
		$this->where($this->driver->escape_column($field).' '.($not === TRUE ? 'NOT ' : '').'IN ('.$values.')');

		return $this;
	}

	/**
	 * Додавання "NOT IN" умови в where блок
	 *
	 * @param   string  Ім'я колонки, що розглядається
	 * @param   mixed   масив або стрічка умови
	 * @return  Database_Core об"єкт БД
	 */
	public function notin($field, $values){
		return $this->in($field, $values, TRUE);
		
	}

	/**
	 * Компіляція REPLACE для виконання
	 *
	 * @param   string  назва таблиці
	 * @param   array   масив ключ/значення
	 * @return  Database_Result  
	 */
	public function merge($table = '', $set = NULL){
		if ( ! is_null($set)){
			$this->set($set);
			
		}

		if ($this->set == NULL){
			throw new Kohana_Database_Exception('database.must_use_set');
			
		}

		if ($table == ''){
			if ( ! isset($this->from[0])){
				throw new Kohana_Database_Exception('database.must_use_table');
				
			}

			$table = $this->from[0];
		}

		$sql = $this->driver->merge($this->table_prefix().$table, array_keys($this->set), array_values($this->set));
		$this->reset_write();
		return $this->query($sql);
	}

	/**
	 * Компіляція UPDATE для виконання
	 *
	 * @param   string  назва таблиці
	 * @param   array   асоциативний масив (назва колонки/значення)
	 * @param   array   where умова
	 * @return  Database_Result
	 */
	public function update($table = '', $set = NULL, $where = NULL){
						
		if ( is_array($set)){
			$this->set($set);
			
		}	

		if ( ! is_null($where)){
			$this->where($where);
			
		}

		if ($this->set == FALSE){
			throw new Kohana_Database_Exception('database.must_use_set');
			
		}

		if ($table == ''){
			if ( ! isset($this->from[0])){
				throw new Kohana_Database_Exception('database.must_use_table');
				
			}

			$table = $this->from[0];
		}
		$sql = $this->driver->update($this->table_prefix().$table, $this->set, $this->where);
		$this->reset_write();
		return $this->query($sql);
	}

	/**
	 * Компіляція DELETE для виконання
	 *
	 * @param   string  назва таблиці
	 * @param   array   where умова
	 * @return  Database_Result
	 */
	public function delete($table = '', $where = NULL){
		if ($table == ''){
			if ( ! isset($this->from[0])){
				throw new Kohana_Database_Exception('database.must_use_table');
				
			}

			$table = $this->from[0];
		} else {
			$table = $this->table_prefix().$table;
			
		}

		if (! is_null($where)) {
			$this->where($where);
			
		}

		if (count($this->where) < 1){
			throw new Kohana_Database_Exception('database.must_use_where');
			
		}

		$sql = $this->driver->delete($table, $this->where);
		$this->reset_write();
		return $this->query($sql);
	}

	/**
	 * Повертає останній виконаний запит.
	 *
	 * @return  string SQL стрічка
	 */
	public function last_query(){
	   return $this->last_query;
	   
	}

	/**
	 * К-ть стрічок виборки
	 *
	 * @param   string   назва таблиці
	 * @param   array    where умова
	 * @return  integer
	 */
	public function count_records($table = FALSE, $where = NULL){
		if (count($this->from) < 1){
			if ($table == FALSE){
				throw new Kohana_Database_Exception('database.must_use_table');
				
			}

			$this->from($table);
		}

		if ($where !== NULL){
			$this->where($where);
			
		}

		$query = $this->select('COUNT(*) AS '.$this->escape_column('records_found'))->get()->result(TRUE);
		return (int) $query->current()->records_found;
	}

	/**
	 * Очистка всіх SELECT змінних
	 *
	 * @return  void
	 */
	protected function reset_select(){
		$this->select   = array();
		$this->from     = array();
		$this->join     = array();
		$this->where    = array();
		$this->orderby  = array();
		$this->groupby  = array();
		$this->having   = array();
		$this->distinct = FALSE;
		$this->limit    = FALSE;
		$this->offset   = FALSE;
	}

	/**
	 * Очистка всіх приватних INSERT і UPDATE змінних.
	 *
	 * @return  void
	 */
	protected function reset_write(){
		$this->set   = array();
		$this->from  = array();
		$this->where = array();
	}

	/**
	 * Список всіх таблиць
	 *
	 * @return  array
	 */
	public function list_tables(){
		if(!$this->link){
			$this->connect();
			
		}

		$this->reset_select();

		return $this->driver->list_tables($this);
	}

	/**
	 * Перевірка на наявність таблиці
	 *
	 * @param   string   назва таблиці
	 * @return  boolean
	 */
	public function table_exists($table_name){
		return in_array($this->table_prefix().$table_name, $this->list_tables());
		
	}

	/**
	 * Компіляція bind змінних
	 *
	 * @param   string  текст запиту
	 * @param   array   масив bind значень
	 * @return  string
	 */
	public function compile_binds($sql, $binds){
		foreach ((array) $binds as $val){
			if (($next_bind_pos = strpos($sql, '?')) === FALSE){
				break;
			}
				
			$val = $this->driver->escape($val);

			$val = str_replace('?', '{%B%}', $val);

			$sql = substr($sql, 0, $next_bind_pos).$val.substr($sql, $next_bind_pos + 1);
		}

		// Restore placeholders.
		return str_replace('{%B%}', '?', $sql);
	}

	/**
	 * Отримати список колонок таблиці з властивостями
	 *
	 * @param   string  назва таблиці
	 * @return  array
	 */
	public function field_data($table = ''){
		$this->link or $this->connect();

		return $this->driver->field_data($this->table_prefix().$table);
	}

	/**
	 * Отримати список колонок таблиці з властивостями
	 *
	 * @param   string  назва таблиці
	 * @return  array
	 */
	public function list_fields($table = ''){
		$this->link or $this->connect();

		return $this->driver->list_fields($this->table_prefix().$table);
	}

	/**
	 * Екранування значень запиту
	 *
	 * @param   mixed   значення
	 * @return  string
	 */
	public function escape($value){
		return $this->driver->escape($value);
		
	}

	/**
	 * Екранування стрычки запиту
	 *
	 * @param   string  стрічка  для екранування
	 * @return  string
	 */
	public function escape_str($str){
		return $this->driver->escape_str($str);
		
	}

	/**
	 * Екранування назви таблиці
	 *
	 * @param   string  стрічка для екранування
	 * @return  string
	 */
	public function escape_table($table){
		return $this->driver->escape_table($table);
		
	}

	/**
	 * Екранування колонки
	 *
	 * @param   string  стрічка для екранування
	 * @return  string
	 */
	public function escape_column($table){
		return $this->driver->escape_column($table);
		
	}

	/**
	 * Повертає префікс таблиці даної конфігурації
	 *
	 * @return  string
	 */
	public function table_prefix(){		
		return $this->tablePrefix;
		
	}

	/**
	 * Встановленння префіксу роботи з таблицями
	 *
	 * @param string $tablePrefix
	 */
	public function setTablePrefix($tablePrefix = ''){
		$this->tablePrefix = $tablePrefix;
		
	}
	
	
	
	
	/**
	 * Очистка кешу запиту
	 *
	 * @param   string|TRUE  стрічка запиту або TRUE для очтстки останнього запиту
	 * @return  Database_Core  об"єкт БД
	 */
	public function clear_cache($sql = NULL){
		if ($sql === TRUE){
			$this->driver->clear_cache($this->last_query);
			
		} elseif (is_string($sql)) {
			$this->driver->clear_cache($sql);
			
		} else {
			$this->driver->clear_cache();
			
		}

		return $this;
	}

	/**
	 * Створення попереднього об"єкту виконання
	 *
	 * @param   string  SQL запит
	 * @return  object
	 */
	public function stmt_prepare($sql){
		return $this->driver->stmt_prepare($sql, $this->config);
		
	}

} // Завершення Database Class


/**
 * Клас exception для Database.
 */
class Kohana_Database_Exception extends Kohana_Exception {

	protected $code = E_DATABASE_ERROR;

} // Завершення Kohana Database Exception
