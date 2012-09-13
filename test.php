<?php
 echo '<pre>';
echo "Hello this is a test script";
 echo '</pre>';

 
 
 
require_once('database.php');
global $error;
global $db;

//#1
$db = database::getInstance();

 
 
 
 
 
  // select !!!!!
 
 	// $sql = "SELECT * FROM " . $table . " WHERE " . $field . " = ? ";
	
function test_search( $table, $field, $value ){
global $error;
global $db;

//#2
     $result = $db->search( $table, $field, $value );
     if( $result == false )
     {
         $error = $db->getError();
		 return false;
     }
     else{
       return $result;
     }	   
  
}
  
  $r = test_search('user', 'account', 'user' );
  if ($r == false) {
     echo "error occur!\n";  
     echo $error;
	 }
  else {
  echo "search 'user' result:\n";
  echo '<pre>';
  print_r($r);
  echo '</pre>';
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  // insert !!!!!
    
  
  //$sql = 'INSERT INTO ' . $table . '( ';
  //$sql = $sql . ') VALUES ( ';
  

function test_insert( $table, $fields, $values  ) {
global $error;
global $db;

	$result=$db->insert( $table , $fields , $values );

    if( $result == false ) {   
	  $error=$db->getError();
	  return false;
	}
	else {
	return true;
   }
  
}


  $r = test_insert('user', array("account","password","name","email"), array("user3","pwd","jason3","jason3@qq.com") );
  if ($r == false) {
  echo "error occur!";
     echo $error;
	 }
  else{ 
  echo "insert 'user3' successful!</br>";
  }
  
  
  
  
  
  
  // delete!!!
  
  
  
    //sql = "DELETE  FROM " . $table . " WHERE " . $field . " = ?";

function test_delete($table, $field, $value) {
  	global $error;
global $db;


		$result = $db->delete ( $table, $field, $value );
		 if( $result == false ) {
			$errors = $db->getError ();
			return false;
		}
		else {
		return true;
		}
	}
	
  
   $r = test_delete('user', 'account', 'user2' );
  if ($r == false) {
  echo "error occur!";
     echo $error;
	 }
  else{ 
  echo "delete 'user2' successful!</br>";
  }
  
  
  
  
  
  // update !!!!
  
  
  
  
  //$sql = "UPDATE " . $table . " SET ";
 // $sql = $sql . "WHERE " . $fields [$i] . " = ? ";
  
function update( $table, $fields, $values){
global $error;
global $db;

    $result = $db->update( $table , $fields, $values );


    if ( $result == false ){
        $error = $db->getError();
        return false;
	}
	else {
         return true;  
  }
  
}


  $r = update('user', array( 'name', 'email','account' ), array( 'user3_new_name', 'user3_new_email', 'user3'));
if ($r == false) 
   {
   echo "error occur!";
   echo $error;
  }
  else {
  echo "update 'user3' successful!</br>";
  }
  
  
  
  