<?php 
session_start();
?>
<!DOCTYPE>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<script src="js/jquery2.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<title>Login Form</title>
        <link rel="stylesheet" href="styles/login_style.css" media="all" /> 
	</head>
<body>
	<div class="container-fliud">
    <div class="login">
    <h2 style="color:white; text-align:center;"><?php echo @$_GET['logged_out']; ?></h2>
        <h1>Admin Login</h1>
        <form method="post" action="login.php">
            <input type="text" name="email" placeholder="Email" required="required" />
            <input type="password" name="password" placeholder="Password" required="required" />
            <button type="submit" class="btn btn-default btn-block btn-large" name="login">Login</button>
        </form>
    </div>
	</div>
</body>
</html>

<?php 
    include("db.php"); 
	if(isset($_POST['login'])){
		$email = mysqli_real_escape_string($con, $_POST['email']);
		$pass = mysqli_real_escape_string($con, $_POST['password']);
        $sel_user = "select * from admins where user_email='$email' AND user_pass='$pass'";
        $run_user = mysqli_query($con, $sel_user); 
        $check_user = mysqli_num_rows($run_user); 
        if($check_user==1){
            $_SESSION['user_email']=$email; 
            echo "<script>window.open('index.php?logged_in=You have successfully Logged in!','_self')</script>";
        }
        else {
            echo "<script>alert('Password or Email is wrong, try again!')</script>";
        }
	}
?>