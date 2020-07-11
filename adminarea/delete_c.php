<?php 
	include("db.php"); 
	if(isset($_GET['delete_c'])){
	$delete_id = $_GET['delete_c'];
	$delete_c = "delete from user_info where user_id='$delete_id'"; 
	$run_delete = mysqli_query($con, $delete_c); 
	if($run_delete){
	   echo "<script>alert('A customer has been deleted!')</script>";
	   echo "<script>window.open('index.php?view_customers','_self')</script>";
	   }
	}
?>