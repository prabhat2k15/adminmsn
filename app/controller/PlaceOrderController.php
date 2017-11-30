<?php

namespace app\controller {

use \app\service\R;
use \Goutte\Client;

    class PlaceOrderController extends AbstractController
    {
    	/**
           * @RequestMapping(url="order/view",type="template")
           * @RequestParams(true)
        */
       public function orderview()
       {

       	  $url = 'https://www.jabong.com/customer/account/login/';//https://www.jabong.com/Sangria-Band-Collar-Anarkali-With-Full-Sleeves-Embroidery-On-Yoke-300227810.html';
       	  echo 'client requested';
            $client  = new Client(); 
            $crawler = $client->request('GET', $url);
            echo 'link selected';
            // $crawler = $client->click($crawler->selectLink('SIGN IN')->link());
            echo 'sign in link clicked';
            $form 	 = $crawler->selectButton('SIGN IN')->form();
            $crawler = $client->submit($form,array('email'=>'prabhat2k15@gmail.com',
            									'password'=>'mstreet1234'));
            echo 'form submitted';

print_r($crawler);
   //          $crawler->filter('.flash-error')->each(function ($node) {
			//     print $node->text()."\n";
			// });

           return 'searchview';
       }

/*
$crawler = $client->request('GET', 'https://github.com/');
$crawler = $client->click($crawler->selectLink('Sign in')->link());
$form = $crawler->selectButton('Sign in')->form();
$crawler = $client->submit($form, array('login' => 'fabpot', 'password' => 'xxxxxx'));
$crawler->filter('.flash-error')->each(function ($node) {
    print $node->text()."\n";
});
*/



       //SERVICES


   }
}