<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Reg extends CI_Controller
{

    function add()
    {
	
        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->load->model('reg_model');

        // if model good successfull worked
        if ($this->reg_model->add()) {
            echo 'Data was added successfully';
        } 
        else {
            $this->load->view('header');
            $this->load->view('reg');
            $this->load->view('footer');
        }
    }   
    function login()
    {
        session_start();
        $this->load->model('reg_model');
        @$login = $_POST['login'];
        @$password = $_POST['password'];
        
        if($_SESSION["is_auth"] == true) {
            $this->load->view('header');
            $this->load->view('login_success');
            $this->load->view('footer');
            return;
            
        }
        
        if ($this->reg_model->check_login($login, $password) ) {
            
         $_SESSION["is_auth"] = true; //Делаем пользователя авторизованным
            $_SESSION["login"] = $login; //Записываем в сессию логин пользователя
            $this->load->view('header');
            $this->load->view('login_success');
            $this->load->view('footer');
            
        } else { //Логин и пароль не подошел
            $data['id'] = $this->reg_model->check_login($login, $password);
            $this->load->view('header');
            $this->load->view('login', $data);
            $this->load->view('footer');
            
            $_SESSION["is_auth"] = false;
            return false; 
        }
        
        
    }
    
         
    function logout(){
        session_start();
        $_SESSION["is_auth"] = false;
        
        $this->load->view('header');
        $this->load->view('login', $data);
        $this->load->view('footer');
    }  
        

    
}
