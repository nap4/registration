<html>
<head>
<title> Регистрация пользователя</title>
</head>
<body>
<?php 
if (FALSE) { // Если пользователь авторизован, приветствуем:  
    echo "Здравствуйте, ";
    echo "<br/><br/><a href='?is_exit=1'>Выйти</a>"; //Показываем кнопку выхода
} 
else { //Если не авторизован, показываем форму ввода логина и пароля
?>


<?=$this->validation->error_string; ?>

    <form action="add" method="POST">

<h5>E-mail</h5>
<input type="text" name="login" value="" size="50" />

<h5>Пароль</h5>
<input type="text" name="password" value="" size="50" />

<h5>Подтверждение пароля</h5>
<input type="text" name="password2" value="" size="50" />
<br /><br />
<input type="submit" value="Отправить" />

</form>

</body>
</html>
<?php } ?>