<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Reg_model extends CI_Model {

    var $table = 'users';
    var $key_id = 'id';
    var $add_rules = array(
        array(
            'field' => 'login', 
            'label' => 'E-mail', 
            'rules' => 'required'
        ),
        array(
            'field' => 'password', 
            'label' => 'Пароль', 
            'rules' => 'required'
        ),
        array(
            'field' => 'password2', 
            'label' => 'Пароль повтор', 
            'rules' => 'required'
        ),
     );


    function __construct(){
        parent::__construct();
    }
    
    
      function check_login($login, $password){
          
       //    $query = $this->db->query("SELECT * FROM `users` WHERE  `login` = '".$login."' AND `password` = '".$password."'");

           
      //     foreach ($query->result() as $row) {
      //         $id = $row->id;
      //     }
           
     //    if($query->result()) {
     //        return 'sfasdf';
     //    } else {
     //       return  FALSE;
     //    }   
            $data['login'] = strip_tags($data['login']);
            $data['login'] = htmlspecialchars($data['login']);
            $data['login'] = mysql_escape_string($data['login']);
            
            $data['password'] = strip_tags($data['password']);
            $data['password'] = htmlspecialchars($data['password']);
            $data['password'] = mysql_escape_string($data['password']);
            
          
        $condition = "login = '$login' AND password = '$password'";
        $this->db->select('*');
        $this->db->from('users');
        $this->db->where($condition);
        $this->db->limit(1);
        $query = $this->db->get();

        if ($query->num_rows() == 1) {
            return true;
        } else {
            return false;
}       

          
        
        
    }    


    /**
     * add data
     */

    function add(){
        
        
        // set rules of validation
        $this->form_validation->set_rules($this->add_rules);

        // if validate success worked
        if($this->form_validation->run()){
            
            // create array of fields to be added into database - added only those fields that appear in the list of validation
            $data = array();

            // we must get array like this $data['name'] = 'fireworks cs6 essential training';
            foreach ($this->add_rules as $one) {
                // build key for array $data. For example - $f = Array['field'];
                $f = $one['field'];
                // get value for array $data from input of form $data[Array['field']] = 'fireworks cs6 essential training';
                $data[$f] = $this->input->post($f); 
            }
            
            if($data['password'] != $data['password2']) {
                return FALSE;
            }
            $data['registration_date'] = $created_date = date("Y-m-d H:i:s");
            $data['inviter_id'] = '1';
            
            $last_users_id = $this->db->query("SELECT MAX(`id`) as max_id FROM `users`");

            foreach($last_users_id->result() as $row) { 
                $data['role_id'] = '1';
                $data['contact_id'] = '1';
                $data['place_id'] = '1';
            }    
            unset($data['password2']);
            
            $data['login'] = strip_tags($data['login']);
            $data['login'] = htmlspecialchars($data['login']);
            $data['login'] = mysql_escape_string($data['login']);
            
            $data['password'] = strip_tags($data['password']);
            $data['password'] = htmlspecialchars($data['password']);
            $data['password'] = mysql_escape_string($data['password']);
            
            $this->db->query("SET foreign_key_checks = 0");
            $this->db->insert($this->table, $data);
            return $this->db->insert_id();
        }
        else{
            return FALSE;
        }     
    }
}
