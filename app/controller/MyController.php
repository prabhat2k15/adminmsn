<?php

namespace app\controller {

use \app\service\R;

    class MyController extends AbstractController
    {

        /**
         * @RequestMapping(url="login",method="POST",type="template")
         * @RequestParams(true)
         */
        public function login($model,$username,$password)
        {
            if($username == "a" && $password == "a"){
              $this->user->setValid(TRUE);
              $this->user->role = "USER";
              $model->assign("username", $username);
              return "index"; // path of smarty tempalte file in view folder
            } else {
              $this->user->setValid(FALSE);
               $model->assign("error", "Wrong credentials");
              return "login"; //path of smarty tempalte file in view folder
            }
        }
       
       /**
         * @RequestMapping(url="logout",method="GET",type="template")
         * @RequestParams(true)
         */
        public function logout($model)
        {
            $this->user->setInvalid();
           $model->assign("error", "Successfully Logged Out");
          return "login"; //path of smarty tempalte file in view folder
            
        }







        /**
         * @RequestMapping(url="myprofile",method="GET",type="template")
         * @RequestParams(true)
         */
        public function myprofile($model)
        {
            if($this->user->isValid()){
              $model->assign("username", $this->user->uname);
              return "user/myprofile"; // 'user/myprofile' is path of smarty tempalte file in view folder
            } else {
              $this->user->setValid(FALSE);
               $model->assign("error", "You need to login to view this page");
              return "login"; // 'login' is path of smarty tempalte file in view folder
            }
        }
        
        /**
         * @RequestMapping(url="info/school/{category}",method="GET",type="json")
         * @RequestParams(true)
         */
        public function schoolinfo($category)
        {
            if($this->user->isValid()){
              return array( "success" => true, "id" => 23,"name"=>"DAV Public School");
            } else {
              return array("success" => false,"error"=> "You need to login to view this info");
            }
        }
    }
}
