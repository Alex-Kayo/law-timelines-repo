<?php defined('SYSPATH') OR die('No direct access allowed.');

/**
 * Базовый клас контролерів
 * 
 * 
 * Налаштування параметрів доступу до методів контролера проводиться в конструкторі контролера:
 *  (При забороні доступу до методу контролера викликається метод позамовчуванню: accessDenied() )
 *
 *  $this->setControllerHead('Адмінпанель: Налаштування групи користувачів', 'back');		
 * 
 *  $this->addPrivelegAction('listRows','Відображення списку', 'Відображення списку груп користувачів');
 *	$this->addPrivelegAction('save','Редагування/додавання', 'Редагування/додавання групи користувачів і встановлення прав доступу');
 *	$this->addPrivelegAction('saveGrid','Швидке редагування Grid', 'Швидке редагування Grid (Назва, статус групи користувачів)');
 *	$this->addPrivelegAction('removeGrid','Видалення груп користувачів', 'Видалення груп користувачів');
 * 
 *  
 * 
 *  Після оновлення налаштувань контролера проводиться оновлення модулів адмінки
 */

abstract class Main_Controller extends Controller {

	
	/**
	 * Назва контролера
	 *
	 * @var string
	 */
	protected $controllerDescript;
	
	/**
	 * Тип модуля
	 *
	 * @var string
	 */
	protected $typeModule = 'back';
	
	/**
	 * Ідентифікатор кореневого вузла топіка
	 *
	 * @var number
	 */
	protected $controllerRootTopic = null;
	
	
	/**
	 * Дооступні дії контроллера з описом (контроль доступу до дій виконується тільки по заданим методам даного масиву)
	 *
	 * @var array
	 * key - нік методу, array('name' - назва методу, 'description' - опис методу)
	 */
	protected $actionData = array();
	

	
	
	/**
	 * Конструктор класу
	 *
	 */
	public function __construct(){
		parent::__construct();
		
	}

	
    /**
     * Метод викликається при забороні доступа до дії контролера
     *
     * @param string $nameMethod - назва заблокованого методу
     */
    public function accessDenied($nameMethod=''){
    	Event::run('system.404');
    	

    }	
	
    /**
     * Встановлення дії, для якої ведеться контроль доступу
     *
     * @param string $actionNick - нік дії
     * @param string $actionName - назва дії
     * @param string $actionDescription - опис дії
     */
    protected function addPrivelegAction($actionNick, $actionName, $actionDescription){    	
    	if(!method_exists($this, $actionNick)){
    		throw new Kohana_Exception('Заданий неіснуючий метод класу');
    		
    	}
    	$this->actionData[$actionNick] = array('name' => $actionName, 'description' => $actionDescription);
    	
    }
    
    /**
     * Задати загальний опис контролера
     *
     * @param string $description - опис модуля
     * @param string $typeModule - тип модуля (front / back)
     * @param number $idRootTopic - ідентифікатор кореневого вузла дерева категорій
     */
    protected function setControllerHead($description, $typeModule = 'back', $idRootTopic = null){
    	$this->controllerDescript = $description;
    	$this->typeModule = $typeModule;
    	$this->controllerRootTopic = $idRootTopic;
    	
    }
    
   
	
}