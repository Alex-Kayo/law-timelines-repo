<?php
/**
 * API драйвера бази даних
 *
 */
abstract class Database_Driver {

	static $query_cache;

	/**
	 * З"єднання з БД.
	 * Повертає FALSE при відсутності з"єднання
	 *
	 * @return mixed
	 */
	abstract public function connect();

	/**
	 * Запит з LOB данними в файл
	 *
	 * @param  string  SQL запит
	 * @param string fieldLobData - поле з LOB данними
	 * @param string fieldFileName - поле з назвою файла
	 * @return array
	 */
	abstract public function lobQueryToFile($sql, $fieldLobData, $fieldFileName);	
	
	/**
	 * Виконати запит
	 *
	 * @param  string  SQL запит
	 * @return Database_Result
	 */
	abstract public function query($sql);

	/**
	 * Побудова DELETE запиту.
	 *
	 * @param   string  назва таблиці
	 * @param   array   where умова
	 * @return  string
	 */
	public function delete($table, $where){
		return 'DELETE FROM ' . $this->escape_table($table) . ' WHERE ' . implode(' ', $where);
	}

	/**
	 * Побудова UPDATE запиту.
	 *
	 * @param   string  назва таблиці
	 * @param   array   key => value значення
	 * @param   array   where умова
	 * @return  string
	 */
	public function update($table, $values, $where){
		foreach ($values as $key => $val){
			$valstr[] = $this->escape_column($key) . ' = ' . $val;
		}
		return 'UPDATE ' . $this->escape_table($table) . ' SET ' . implode(', ', $valstr) . ' WHERE ' . implode(' ', $where);
	}

	/**
	 * ВВстановити кодову сторінку для БД
	 *
	 * @param  string  character set to use
	 */
	public function set_charset($charset){
		throw new Kohana_Database_Exception('database.not_implemented', __FUNCTION__);
	}

	/**
	 * Екранування назви таблиці
	 *
	 * @param   string  table name
	 * @return  string
	 */
	abstract public function escape_table($table);

	/**
	 * Екранування назв стовбців талиці
	 *
	 * @param   string  назва стовбця
	 * @return  string
	 */
	abstract public function escape_column($column);

	/**
	 * Побудова WHERE блоку.
	 *
	 * @param   mixed    ключ
	 * @param   string   значення
	 * @param   string   тип
	 * @param   int      номер where умови
	 * @param   boolean  екранування значення
	 * @return  string
	 */
	public function where($key, $value, $type, $num_wheres, $quote){
		$prefix = ($num_wheres == 0) ? '' : $type;

		if ($quote === -1){
			$value = '';
		} else {
			if ($value === NULL){
				if ( ! $this->has_operator($key)){
					$key .= ' IS';
				}

				$value = ' NULL';
			} elseif (is_bool($value)) {
				if ( ! $this->has_operator($key)) {
					$key .= ' =';
				}

				$value = ($value == TRUE) ? ' 1' : ' 0';
			} else {
				if ( ! $this->has_operator($key)){
					$key = $this->escape_column($key).' =';
				} else {
					preg_match('/^(.+?)([<>!=]+|\bIS(?:\s+NULL))\s*$/i', $key, $matches);
					if (isset($matches[1]) AND isset($matches[2])) {
						$key = $this->escape_column(trim($matches[1])).' '.trim($matches[2]);
					}
				}

				$value = ' ' . (($quote == TRUE) ? $this->escape($value) : $value);
			}
		}

		return $prefix . $key . $value;
	}

	/**
	 * Побудова LIKE блоку.
	 *
	 * @param   mixed    назва стовбця
	 * @param   string   значння (умова)
	 * @param   boolean  додати підстановочні знаки до і після умови
	 * @param   string   тип умови (AND або OR)
	 * @param   int      кількість like
	 * @return  string
	 */
	public function like($field, $match = '', $auto = TRUE, $type = 'AND ', $num_likes){
		$prefix = ($num_likes == 0) ? '' : $type;

		$match = $this->escape_str($match);

		if ($auto === TRUE){
			$match = '%' . str_replace('%', '\\%', $match) . '%';
		}

		return $prefix . ' ' . $this->escape_column($field) . ' LIKE \'' . $match . '\'';
	}

	/**
	 * Побудова NOT LIKE блоку.
	 *
	 * @param   mixed   назва стовбця
	 * @param   string  значння (умова)
	 * @param   string  тип умови (AND або OR)
	 * @param   int     кількість like
	 * @return  string
	 */
	public function notlike($field, $match = '', $auto = TRUE, $type = 'AND ', $num_likes){
		$prefix = ($num_likes == 0) ? '' : $type;

		$match = $this->escape_str($match);

		if ($auto === TRUE){
			$match = '%' . $match . '%';
		}

		return $prefix . ' ' . $this->escape_column($field) . ' NOT LIKE \'' . $match . '\'';
	}

	/**
	 * Побудова REGEX блоку.
	 *
	 * @param   string   назва стовбця
	 * @param   string   значння (умова)
	 * @param   string   тип умови (AND або OR)
	 * @param   integer  кількість regexes
	 * @return  string
	 */
	public function regex($field, $match, $type, $num_regexs){
		throw new Kohana_Database_Exception('database.not_implemented', __FUNCTION__);
		
	}

	/**
	 * Побудова NOT REGEX блоку.
	 *
	 * @param   string   назва стовбця
	 * @param   string   значння (умова)
	 * @param   string   тип умови (AND або OR)
	 * @param   integer  кількість regexes
	 * @return  string
	 */
	public function notregex($field, $match, $type, $num_regexs){
		throw new Kohana_Database_Exception('database.not_implemented', __FUNCTION__);
		
	}

	/**
	 * Побудова INSERT.
	 *
	 * @param   string  назва таблиці
	 * @param   array   ключ
	 * @param   array   значення
	 * @return  string
	 */
	public function insert($table, $keys, $values){
		foreach ($keys as $key => $value){
			$keys[$key] = $this->escape_column($value);
			
		}
		return 'INSERT INTO ' . $this->escape_table($table) . ' (' . implode(', ', $keys) . ') VALUES (' . implode(', ', $values) . ')';
	}

	/**
	 * Побудова MERGE блоку.
	 *
	 * @param   string  назва таблиці
	 * @param   array   ключ
	 * @param   array   значення
	 * @return  string
	 */
	public function merge($table, $keys, $values){
		throw new Kohana_Database_Exception('database.not_implemented', __FUNCTION__);
		
	}

	/**
	 * Побудова LIMIT блоку.
	 *
	 * @param   integer  к-ть рядків виборки
	 * @param   integer  початковий рядок
	 * @return  string
	 */
	abstract public function limit($limit, $offset = 0);

	/**
	 * Створення підготовленої заявки
	 *
	 * @param   string  SQL запит
	 * @return  Database_Stmt
	 */
	public function stmt_prepare($sql = ''){
		throw new Kohana_Database_Exception('database.not_implemented', __FUNCTION__);
		
	}

	/**
	 *  Компіляція SELECT консрукції.
	 *
	 * @param   array   значення select запиту
	 * @return  string
	 */
	abstract public function compile_select($database);

	/**
	 * Визначення чи немає значення арифм. операції 
	 *
	 * @param   string   стрічка для перевірки
	 * @return  boolean
	 */
	public function has_operator($str){
		return (bool) preg_match('/[<>!=]|\sIS(?:\s+NOT\s+)?\b/i', trim($str));
		
	}

	/**
	 * Екранування значень вводу
	 *
	 * @param   mixed   значення для екранування
	 * @return  string
	 */
	public function escape($value){
		if ( ! $this->db_config['escape']){
			return $value;
			
		}

		switch (gettype($value))
		{
			case 'string':
				$value = '\''.$this->escape_str($value).'\'';
			break;
			case 'boolean':
				$value = (int) $value;
			break;
			case 'double':
				$value = sprintf('%F', $value);
			break;
			default:
				$value = ($value === NULL) ? 'NULL' : $value;
			break;
		}

		return (string) $value;
	}

	/**
	 * Екранування стрічки запиту.
	 *
	 * @param   mixed   значення для екранування
	 * @return  string
	 */
	abstract public function escape_str($str);

	/**
	 * Список всіх таблиць.
	 *
	 * @return  array
	 */
	abstract public function list_tables(Database $db);

	/**
	 * Список всіх полів таблиці.
	 *
	 * @param   string  назва таблиці
	 * @return  array
	 */
	abstract function list_fields($table);

	/**
	 * Повертає останню помилку БД
	 *
	 * @return  string
	 */
	abstract public function show_error();

	/**
	 * Повертає поля таблиці
	 *
	 * @param   string  назва таблиці
	 * @return  array
	 */
	abstract public function field_data($table);

	/**
	 * Повертає тип поля відповідно основного формату
	 *
	 * @param   string  тип поля
	 * @return  array
	 */
	protected function sql_type($str){
		static $sql_types;

		if ($sql_types === NULL){
			// Завантаження SQL тип даних
			$sql_types = Kohana::config('sql_types');
		}

		$str = strtolower(trim($str));

		if (($open  = strpos($str, '(')) !== FALSE){
			$close = strpos($str, ')', $open) - 1;

			$type = substr($str, 0, $open);
		}	else{
			$type = $str;
		}

		empty($sql_types[$type]) and exit(
			'Unknown field type: '.$type.'. '.
			'Please report this: http://trac.kohanaphp.com/newticket'
		);


		$field = $sql_types[$type];

		switch ($field['type']){
			case 'string':
			case 'float':
				if (isset($close)){
					$field['length'] = substr($str, $open + 1, $close - $open);
				}
			break;
			case 'int':
				$field['unsigned'] = (strpos($str, 'unsigned') !== FALSE);
			break;
		}

		return $field;
	}

	/**
	 * Очистка кешу запитів.
	 *
	 * @param  string  SQL запит
	 */
	public function clear_cache($sql = NULL){
		if (empty($sql)){
			self::$query_cache = array();
			
		}else{
			unset(self::$query_cache[$this->query_hash($sql)]);
			
		}

		Kohana::log('debug', 'Database cache cleared: '.get_class($this));
	}

	/**
	 * Створення хешу SQL запиту
	 *
	 * @param   string  SQL запит
	 * @return  string
	 */
	protected function query_hash($sql) {
		return sha1(str_replace("\n", ' ', trim($sql)));
		
	}
	

} // Завершення Database Driver Interface

/**
 * Database_Result
 *
 */
abstract class Database_Result implements ArrayAccess, Iterator, Countable {
	
	/**
	 * Ресурс курсору виборки
	 *
	 * @var resource
	 */
	protected $result;
	
	/**
	 * Ідент. останньої INSERT
	 *
	 * @var number
	 */
	protected $insert_id;
	
	/**
	 * SQL вираз
	 *
	 * @var unknown_type
	 */
	protected $sql;

	/**
	 * Поточний рядок виборки
	 *
	 * @var number
	 */
	protected $current_row = 0;
	
	/**
	 * Загальна кількість рядків виборки
	 *
	 * @var number
	 */
	protected $total_rows  = 0;

	/**
	 * Функція, яка повертає результат виборки
	 *
	 * @var string
	 */
	protected $fetch_type;
	
	/**
	 * Тип даних, який повертає виборка
	 *
	 * @var mixed
	 */
	protected $return_type;

	/**
	 * Повертає останній SQL запит
	 *
	 * @return  string
	 */
	public function sql(){
		return $this->sql;
		
	}

	/**
	 * Повертає ідент. останньої INSERT
	 *
	 * @return  mixed
	 */
	public function insert_id(){
		return $this->insert_id;
		
	}

	/**
	 * Підготовка результату запиту
	 *
	 * @param   boolean   return rows as objects
	 * @param   mixed     type
	 * @return  Database_Result
	 */
	abstract function result($object = TRUE, $type = FALSE);

	/**
	 * Побудова результуючого масиву
	 *
	 * @param   boolean   повертає рядок як об"єкт
	 * @param   mixed     тип
	 * @return  array
	 */
	abstract function result_array($object = NULL, $type = FALSE);

	/**
	 * Отримає поля вже корегованого запиту
	 *
	 * @return  array
	 */
	abstract public function list_fields();

	/**
	 * Пошук по результату виборки
	 *
	 * @return  boolean
	 */
	abstract public function seek($offset);

	/**
	 * К-ть рядків виборки
	 */
	public function count(){
		return $this->total_rows;
	}

	/**
	 * ArrayAccess: offsetExists
	 */
	public function offsetExists($offset){		
		if ($this->total_rows > 0){
		
			$min = 0;
			$max = $this->total_rows - 1;

			return ! ($offset < $min OR $offset > $max);
		}

		return FALSE;
	}

	/**
	 * ArrayAccess: offsetGet
	 */
	public function offsetGet($offset){
		if ( ! $this->seek($offset)){
			return FALSE;
			
		}

		return call_user_func($this->fetch_type, $this->result, $this->return_type);
	}

	/**
	 * ArrayAccess: offsetSet
	 *
	 * @throws  Kohana_Database_Exception
	 */
	final public function offsetSet($offset, $value){		
		throw new Kohana_Database_Exception('database.result_read_only');
		
	}

	/**
	 * ArrayAccess: offsetUnset
	 *
	 * @throws  Kohana_Database_Exception
	 */
	final public function offsetUnset($offset){
		throw new Kohana_Database_Exception('database.result_read_only');
		
	}

	/**
	 * Iterator: current
	 */
	public function current(){		
		return $this->offsetGet($this->current_row);
		
	}

	/**
	 * Iterator: key
	 */
	public function key(){
		return $this->current_row;
		
	}

	/**
	 * Iterator: next
	 */
	public function next(){
		++$this->current_row;
		return $this;
		
	}

	/**
	 * Iterator: prev
	 */
	public function prev(){
		--$this->current_row;
		return $this;
		
	}

	/**
	 * Iterator: rewind
	 */
	public function rewind()
	{
		$this->current_row = 0;
		return $this;
	}

	/**
	 * Iterator: valid
	 */
	public function valid(){
		return $this->offsetExists($this->current_row);
		
	}

} // Завершення Database Result