<?php

class Database {
	 
	private static $db_host = 'yallara.cs.rmit.edu.au';
	private static $db_port = '50644';
	private static $db_name = 'hunter';
	private static $db_username = 'hunter';
	private static $db_password = 'hunter';


	private static $instance;
	private $error;
	public $dsn;
	public $pdo;
	
	private function __construct() {
		$this->dsn = 'mysql:host=' . self::$db_host . ';port=' . self::$db_port . ';dbname=' . self::$db_name;
		try {
			$this->pdo = new PDO ( $this->dsn, self::$db_username, self::$db_password );
			$this->pdo->setAttribute ( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
		} catch ( PDOException $e ) {
			echo $e->getMessage ();
			exit ();
		}
	}


	private function setError($statement) {
		$tmp = $statement->errorInfo ();
		$this->error = $tmp [2];
	}

	
	public static function getInstance() {
		if (! self::$instance) {
			self::$instance = new Database ();
		}
		return self::$instance;
	}	
	
		public function getError() {
		return $this->error;
	}
	
	
	public function search($table, $field, $value) {
		try {
			
			$sql = "SELECT * FROM " . $table . " WHERE " . $field . " = ? ";
			
			$statement = $this->pdo->prepare ( $sql );
			
			
			if ($statement->execute ( array ($value ) ) == false) {
				$this->setError ( $statement );
				return false;
			}
			
		
			if ($statement->rowCount () == 0) {
				$this->error = "result is empty";
				return false;
			}
		
		} catch ( PDOException $e ) {
			$this->error = $e->getMessage ();
			return false;
		}
		
		return $statement->fetchAll ();
	}
	
	public function delete($table, $field, $value) {
		try {
			
			$sql = "DELETE  FROM " . $table . " WHERE " . $field . " = ?";
			
			$statement = $this->pdo->prepare ( $sql );
			
			
			if ($statement->execute ( array ($value ) ) == false) {
				$this->setError ( $statement );
				
				return false;
			}
			
		
			if ($statement->rowCount () == 0) {
				$this->error = "result is empty";
				
				return false;
			}
		
		} catch ( PDOException $e ) {
			$this->error = $e->getMessage ();
			
			return false;
		}
		
		return true;
	}
	
	
	
public function insert($table, $fields, $values) {
		try {
			
			$sql = 'INSERT INTO ' . $table . '( ';
			
			for($i = 0; $i < count ( $fields ); $i ++) {
				if ($i + 1 != count ( $fields ))
					$sql = $sql . $fields [$i] . ", ";
				else
					$sql = $sql . $fields [$i];
			}
			
			$sql = $sql . ') VALUES ( ';
			
			for($i = 0; $i < count ( $fields ); $i ++) {
				if ($i + 1 != count ( $fields ))
					$sql = $sql . "?, ";
				else
					$sql = $sql . "? )";
			}
			
			$statement = $this->pdo->prepare ( $sql );
			if ($statement->execute ( $values ) == false) {
				$this->setError ( $statement );
				return false;
			}
		
		} catch ( PDOException $e ) {
			$this->error = $e->getMessage ();
			return false;
		}
		
		return true;
	}
	
	
	
		public function update($table, array $fields, array $values) {
		try {
			$sql = "UPDATE " . $table . " SET ";
			
			for($i = 0; $i < count ( $fields ) - 1; $i ++) {
				if ($i + 1 != count ( $fields ) - 1)
					$sql = $sql . " " . $fields [$i] . " = ? ,";
				else
					$sql = $sql . " " . $fields [$i] . " = ? ";
			}
			
			$sql = $sql . "WHERE " . $fields [$i] . " = ? ";
			
			$statement = $this->pdo->prepare ( $sql );
			if ($statement->execute ( $values ) == false) {
				$this->setError ( $statement );
				return false;
			}
		} catch ( PDOException $e ) {
			$this->error = $e->getMessage ();
			return false;
		}
		
		return true;
	}
	
	
	
	
	
	
}