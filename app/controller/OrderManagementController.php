<?php

namespace app\controller {

use \app\service\R;
use \app\service\OrderService;

    class OrderManagementController extends AbstractController
    {

        /**
         * @RequestMapping(url="oms/view",method="GET",type="template")
         * @RequestParams(true)
         * @Role - US
         */
        public function omsview($model)
        {
            $res=OrderService::getAllOrder(2);
            // echo '<pre>';
            // echo $res[0]->date.'-'.date('d-m-Y',$res[0]->date);//
            // print_r($res);die;
            $model->assign('res',$res);
            $model->assign('count',count($res));
        	return 'order/view';
        }
        /**
         * @RequestMapping(url="oms/invoice",method="GET",type="template")
         * @RequestParams(true)
         * @Role - US
         */
        public function invoice($model,$orderid)
        {
            if(is_null($orderid)){
                return 'order/view';
            }
           $res=OrderService::getOrder($orderid);
           // echo '<pre>';
           // print_r($res);die;
           $model->assign('res',$res);
         return 'order/invoice';
        } 
    }
}