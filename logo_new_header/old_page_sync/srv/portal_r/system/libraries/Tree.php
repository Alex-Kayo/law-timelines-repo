<?php

class Tree_Core extends Database {
    
    protected $db;
	protected $table;
    protected $t_id;
    protected $t_left;
    protected $t_right;
    protected $t_level;
    protected $t_parent;
        
    function __construct($table, $prefix) {
        $this->table = $table;
        $this->t_id = $prefix.'id';
        $this->t_left = $prefix.'left_key';
        $this->t_right = $prefix.'right_key';
        $this->t_level = $prefix.'level';
        $this->t_parent = $prefix.'parent_id';
        $this->t_public = $prefix.'status';
        if ( ! is_object($this->db))
        {
            // Load the default database
            $this->db = Database::instance('default');
        }        
    }

    public function getNode($id){
        return $this->db->select('*')->from($this->table)->where($this->t_id, $id)->get()->current();
    }

    public function publishNode($id, $public = 1) {
        if ($id) {
            $node = $this->getNode($id);
            if(!$node) return FALSE;

            if ($public) {
                $result = $this->db->update($this->table, array($this->t_public => $public), "$this->t_id = $id");        
                return $result;
            }
            
            $right = $node->{$this->t_right};
            $left = $node->{$this->t_left};
            $parent = $node->{$this->t_parent};
            if ($public and $parent) {
                $result = $this->db->select($this->t_public)
                                   ->from($this->table)
                                   ->where($this->t_id, $parent)
                                   ->get()
                                   ->current()
                                   ->{$this->t_public};

                if (!$result) return FALSE;
            }
                        
            $exp = "$this->t_left >= $left AND $this->t_right <= $right";
        } else {
            return FALSE;
        }
        $result = $this->db->update($this->table, array($this->t_public => $public), $exp);
        
        return $result;
    }
    
    public function addNode($id, $data) {
    	$node = $this->getNode($id);
        if(!($node)) {
            $right = (integer)$this->db->query("SELECT nvl(MAX($this->t_right)+1,0) AS root FROM $this->table WHERE $this->t_level = 1")
                               ->current()
                               ->root;
            $left = 0;
			$level = 0;
        } else {
        	$right = $node->{$this->t_right};
            $left = $node->{$this->t_left};
			$level = $node->{$this->t_level};
        }
        
        $data += array(
            $this->t_left => $right,
            $this->t_right => $right + 1,
            $this->t_level => $level + 1,
            $this->t_parent => $id

        );
        $sql = "UPDATE $this->table SET 
				$this->t_right = $this->t_right + 2,
                $this->t_left = CASE
                    WHEN $this->t_left > $right
                        THEN $this->t_left + 2
                        ELSE $this->t_left
                END
			  WHERE
    			$this->t_right >= $right";
        
        //$this->db->query($sql);
        $this->db->stmt_prepare($sql)->noCommit()->execute();

        $insertedId = $this->db->insert($this->table, $data);
        return $insertedId;
    }

    public function delBranch($id) {
    	$node = $this->getNode($id);
        
        if (!$node) return false;
        
        $right = $node->{$this->t_right};
		$left = $node->{$this->t_left};
        
        $sql1="DELETE FROM $this->table WHERE $this->t_left BETWEEN $left AND $right";
        
        $delta = (($right - $left) + 1);
  
        $sql2="UPDATE $this->table SET
                $this->t_left = CASE WHEN $this->t_left > $left THEN $this->t_left - $delta ELSE $this->t_left END,
                $this->t_right = CASE WHEN $this->t_right > $left THEN $this->t_right - $delta ELSE $this->t_right END
			  WHERE
				$this->t_right > $right";
        
        //$this->db->query($sql1);
        //$this->db->query($sql2);
        $this->db->stmt_prepare($sql1)->noCommit()->execute();
        $this->db->stmt_prepare($sql2)->execute();
        
        return TRUE;
    }
    

    public function changeParentNode($id_s, $id_d) {
        $node_s = $this->getNode($id_s);
        if (!$node_s) return false;

        $left_s = $node_s->{$this->t_left};
        $right_s = $node_s->{$this->t_right};
        $level_s = $node_s->{$this->t_level};

        if ($id_d != 0) {        
            $node_d = $this->getNode($id_d);
            if (!$node_d) return false;
            
            $left_d = $node_d->{$this->t_left};
            $right_d = $node_d->{$this->t_right};
            $level_d = $node_d->{$this->t_level};
            $public_d = $node_d->{$this->t_public};
            
        } else {
            $root = $this->db->query("SELECT nvl(MAX($this->t_right),0)+1 AS root FROM $this->table WHERE $this->t_level = 1")
                               ->current()
                               ->root;
            
            $left_d = $root;
            $right_d = $root;
            $level_d = 0;
            $public_d = 1;
        }
       
        if ($id_s == $id_d || $left_s == $left_d || ($left_d >= $left_s && $left_d <= $right_s) ||
            ($level_s == $level_d+1 && $left_s > $left_d && $right_s < $right_d)) {
            return false;
        }

        if ($left_d < $left_s && $right_d > $right_s && $level_d < $level_s - 1) {
            $sql = "UPDATE $this->table SET
                        $this->t_level = CASE 
                            WHEN $this->t_left BETWEEN $left_s AND $right_s
                                THEN $this->t_level ".sprintf('%+d', -($level_s-1)+$level_d)."
                                ELSE $this->t_level
                        END,
                        $this->t_right = CASE
                            WHEN $this->t_right BETWEEN ".($right_s+1)." AND ".($right_d-1)."
                                THEN $this->t_right-".($right_s-$left_s+1)."
                            WHEN $this->t_left BETWEEN $left_s AND $right_s
                                THEN $this->t_right+".((($right_d-$right_s-$level_s+$level_d)/2)*2+$level_s-$level_d-1)."
                                ELSE $this->t_right
                        END,
                        $this->t_left = CASE
                            WHEN $this->t_left BETWEEN ".($right_s+1)." AND ".($right_d-1)."
                                THEN $this->t_left-".($right_s-$left_s+1)."
                            WHEN $this->t_left BETWEEN $left_s AND $right_s
                                THEN $this->t_left+".((($right_d-$right_s-$level_s+$level_d)/2)*2+$level_s-$level_d-1)."
                                ELSE $this->t_left
                        END,
                        $this->t_parent = CASE
                            WHEN $this->t_id = $id_s
                            THEN $id_d
                            ELSE $this->t_parent
                        END
                        WHERE $this->t_left BETWEEN ".($left_d+1)." AND ".($right_d-1);
                        
        } elseif ($left_d < $left_s) {
            $sql = "UPDATE $this->table SET
                        $this->t_level = CASE
                            WHEN $this->t_left BETWEEN $left_s AND $right_s
                                THEN $this->t_level ".sprintf('%+d', -($level_s-1)+$level_d)."
                                ELSE $this->t_level
                        END,
                        $this->t_left = CASE
                            WHEN $this->t_left BETWEEN $right_d AND ".($left_s-1)."
                                THEN $this->t_left+".($right_s-$left_s+1)."
                            WHEN $this->t_left BETWEEN $left_s AND $right_s
                                THEN $this->t_left-".($left_s-$right_d)."
                                ELSE $this->t_left
                        END,
                        $this->t_right = CASE
                            WHEN $this->t_right BETWEEN $right_d AND $left_s
                                THEN $this->t_right+".($right_s-$left_s+1)."
                            WHEN $this->t_right BETWEEN $left_s AND $right_s
                                THEN $this->t_right-".($left_s-$right_d)."
                                ELSE $this->t_right
                        END,
                        $this->t_parent = CASE
                            WHEN $this->t_id = $id_s
                            THEN $id_d
                            ELSE $this->t_parent
                        END                        
                        WHERE ($this->t_left BETWEEN $left_d AND $right_s
                           OR $this->t_right BETWEEN $left_d AND $right_s)";
                        
        } else {
            $sql = "UPDATE $this->table SET
                        $this->t_level = CASE
                            WHEN $this->t_left BETWEEN $left_s AND $right_s
                                THEN $this->t_level ".sprintf('%+d', -($level_s-1)+$level_d)."
                                ELSE $this->t_level
                        END,
                        $this->t_left = CASE
                            WHEN $this->t_left BETWEEN $right_s AND $right_d
                                THEN $this->t_left-".($right_s-$left_s+1)."
                            WHEN $this->t_left BETWEEN $left_s AND $right_s
                                THEN $this->t_left+".($right_d-1-$right_s)."
                                ELSE $this->t_left
                        END,
                        $this->t_right = CASE
                            WHEN $this->t_right BETWEEN ".($right_s+1)." AND ".($right_d-1)."
                                THEN $this->t_right-".($right_s-$left_s+1)."
                            WHEN $this->t_right BETWEEN $left_s AND $right_s
                                THEN $this->t_right+".($right_d-1-$right_s)." ELSE $this->t_right
                        END,
                        $this->t_parent = CASE
                            WHEN $this->t_id = $id_s
                            THEN $id_d
                            ELSE $this->t_parent
                        END                        
                        WHERE ($this->t_left BETWEEN $left_s AND $right_d
                           OR $this->t_right BETWEEN $left_s AND $right_d)";
                        
        }

        $result = $this->db->query($sql);
        //if ($result && ($public_d == 0)) $this->setPublicNode($id_s, 0);
        return (boolean)$result;
    }
    
    
    
    public function moveNode($id_s, $id_d, $point = 'above') {
        if ('append' == $point) {
                return $this->changeParentNode($id_s, $id_d);
        }

        $node_s = $this->getNode($id_s);
        if (!$node_s) return false;

        $node_d = $this->getNode($id_d);
        if (!$node_d) return false;
            
        $left_s = $node_s->{$this->t_left};
        $right_s = $node_s->{$this->t_right};
        $level_s = $node_s->{$this->t_level};
            
        $left_d = $node_d->{$this->t_left};
        $right_d = $node_d->{$this->t_right};
        $level_d = $node_d->{$this->t_level};
        $parent = $node_d->{$this->t_parent};
        
        if ($level_s <> $level_d) {
            if ($this->changeParentNode($id_s, $parent)) {
                return $this->moveNode($id_s, $id_d, $point);
            } else {
                return false;
            }
        }
        if ('above' == $point) {
            if ($left_s > $left_d) {
                $sql = "UPDATE $this->table SET
                            $this->t_right = CASE
                                WHEN $this->t_left BETWEEN $left_s AND $right_s
                                    THEN $this->t_right - ".($left_s - $left_d)."
                                WHEN $this->t_left BETWEEN $left_d AND ".($left_s - 1)."
                                    THEN $this->t_right + ".($right_s - $left_s + 1)."
                                    ELSE $this->t_right
                                END,
                            $this->t_left = CASE
                                WHEN $this->t_left BETWEEN $left_s AND $right_s
                                    THEN $this->t_left - ".($left_s - $left_d)."
                                WHEN $this->t_left BETWEEN $left_d AND ".($left_s - 1)."
                                    THEN $this->t_left + ".($right_s - $left_s + 1)."
                                    ELSE $this->t_left
                                END
                                WHERE $this->t_left BETWEEN $left_d AND $right_s";
            } else {
                $sql = "UPDATE $this->table SET
                            $this->t_right = CASE
                                WHEN $this->t_left BETWEEN $left_s AND $right_s
                                    THEN $this->t_right + ".(($left_d - $left_s) - ($right_s - $left_s + 1))."
                                WHEN $this->t_left BETWEEN ".($right_s + 1)." AND ".($left_d - 1)."
                                    THEN $this->t_right - ".(($right_s - $left_s + 1))."
                                    ELSE $this->t_right
                            END,
                            $this->t_left = CASE
                                WHEN $this->t_left BETWEEN $left_s AND $right_s
                                    THEN $this->t_left + ".(($left_d - $left_s) - ($right_s - $left_s + 1))."
                                WHEN $this->t_left BETWEEN ".($right_s + 1)." AND ".($left_d - 1)."
                                    THEN $this->t_left - ".($right_s - $left_s + 1)."
                                ELSE $this->t_left
                            END
                            WHERE $this->t_left BETWEEN $left_s AND ".($left_d - 1);
            }
        }
        if ('below' == $point) {
            if ($left_s > $left_d) {
                $sql = "UPDATE $this->table SET
                            $this->t_right = CASE
                                WHEN $this->t_left BETWEEN $left_s AND $right_s
                                    THEN $this->t_right - ".($left_s - $left_d - ($right_d - $left_d + 1))."
                                        WHEN $this->t_left BETWEEN ".($right_d + 1)." AND ".($left_s - 1)."
                                    THEN $this->t_right + ".($right_s - $left_s + 1)."
                                    ELSE $this->t_right
                            END,
                            $this->t_left = CASE
                                WHEN $this->t_left BETWEEN $left_s AND $right_s
                                    THEN $this->t_left - ".($left_s - $left_d - ($right_d - $left_d + 1))."
                                WHEN $this->t_left BETWEEN ".($right_d + 1)." AND ".($left_s - 1)."
                                    THEN $this->t_left + ".($right_s - $left_s + 1)."
                                    ELSE $this->t_left
                            END
                            WHERE $this->t_left BETWEEN ".($right_d + 1)." AND $right_s";
            } else {
                $sql = "UPDATE $this->table SET
                            $this->t_right = CASE
                                WHEN $this->t_left BETWEEN $left_s AND $right_s
                                    THEN $this->t_right + ".($right_d - $right_s)."
                                WHEN $this->t_left BETWEEN ".($right_s + 1)." AND $right_d
                                    THEN $this->t_right - ".(($right_s - $left_s + 1))."
                                    ELSE $this->t_right
                            END,
                            $this->t_left = CASE
                                WHEN $this->t_left BETWEEN $left_s AND $right_s
                                    THEN $this->t_left + ".($right_d - $right_s)."
                                WHEN $this->t_left BETWEEN ".($right_s + 1)." AND $right_d
                                    THEN $this->t_left - ".($right_s - $left_s + 1)."
                                    ELSE $this->t_left
                            END
                            WHERE $this->t_left BETWEEN $left_s AND $right_d";
            }
        }
        $result = $this->db->query($sql);
        return (boolean)$result;
    }
       
    
    
    public function reBuildKeys(){
    	
    	$this->db->query("update {$this->table}  set {$this->t_left}=0,{$this->t_right}=0");
    	    	
    	$query = $this->db->query("SELECT * FROM {$this->table} 
							ORDER BY {$this->t_parent}, {$this->t_id}  ASC");    	
    	
    	
    	foreach ($query->result(false) as $row){
    		
	    	$node = $this->getNode($row[$this->t_parent]);	    	
	        if(!($node)) {
	            $right = (integer)$this->db->query("SELECT nvl(MAX($this->t_right),0)+1 AS root FROM $this->table WHERE $this->t_level = 1")
	                               ->current()
	                               ->root;
	            $left = 0;
				$level = 0;
	        } else {
	        	$right = $node->{$this->t_right};
	            $left = $node->{$this->t_left};
				$level = $node->{$this->t_level};
	        }
	        
	        $data = array(
	            $this->t_left => $right,
	            $this->t_right => $right + 1,
	            $this->t_level => $level + 1
	
	        );    	
	    	
	        
	        $sql = "UPDATE $this->table SET 
					$this->t_right = $this->t_right + 2,
	                $this->t_left = CASE
	                    WHEN $this->t_left > $right
	                        THEN $this->t_left + 2
	                        ELSE $this->t_left
	                END
				  WHERE
	    			$this->t_right >= $right";
	        
	        $this->db->stmt_prepare($sql)->noCommit()->execute();	
	        $this->db->update($this->table, $data, array($this->t_id=>$row[$this->t_id]));	 
    	}
    	
    }
    
    
}

?>