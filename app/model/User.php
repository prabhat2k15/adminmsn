<?php

namespace app\model {

    /**
     * Description of User, it basically extends AbstractUser and implemetns atleast two methods
     *
     * @Model(sessionUser)
     */
    class User extends AbstractUser
    {

        public $IS_MOD = false;

        public function configure()
        {
            //One time per request
        }

        public function on_auth_success($user)
        {
            //After login is done succesfully
        }

        public function auth($username, $passowrd)
        {
            if ($username == "lalit" && $passowrd == "pass") {
                $this->role = "ADMIN";
                $this->setValid();
                header('Location: /userinfo');
                exit();
            } else if ($username == "prabhat" && $passowrd == "pass") {
                $this->role = "USER";
                $this->setValid();
                header('Location: /userinfo');
                exit();
            }
            return $this->isValid();
        }

        public function basicAuth()
        {
            $this->configure();
            if (!$this->isValid()) {
                header('Location: /login');
                exit();
                return false;
            } else {
                return true;
            }
//            return $this->setUser("101", "someone@some.com", array(
//                "somedata" => "somevalue"
//            ));
        }

        public function unauth()
        {
            $this->configure();
            $this->setInValid();
            header('Location: /login');
            exit();
        }
    }
}
