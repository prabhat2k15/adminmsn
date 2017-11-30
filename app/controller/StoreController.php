<?php

namespace app\controller {
    use app\service\StoreService;
    use \app\service\R;

    class StoreController extends AbstractController
    {

        /**
         * @Description - Dashoard page for seller
         *
         * @RequestMapping(url="store/view",method="GET",type="template")
         * @RequestParams(true)
         */
        public function view($model = null)
        {
            return 'store/view';
        }

         /**
         * @Description - Dashoard page for seller
         *
         * @RequestMapping(url="store/create",method="POST",type="template")
         * @RequestParams(true)
         */
        public function create($model = null,$name, $address, $city, $state, $country, $pincode, $description, $email, $contact, $website, $type)
        {
            // echo $name. $address. $city. $state. $country. $pincode. $description. $email. $contact. $website. $type;die;
            StoreService::createStore($name, $address, $city, $state, $country, $pincode, $description, $email, $contact, $website, $type);
            $model->assign('msg','Store Created');
            return 'store/view';
        }
    }
}