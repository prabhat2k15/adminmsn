<?php
namespace app\service {

  class StoreService
  {
   

    public static function createStore($name, $address, $city, $state, $country, $pincode, $description, $email, $contact, $website, $type)
    {
    	$store=R::findOneOrDispense('store');
    	$store->name=$name;
    	$store->address=$address;
    	$store->city=$city;
    	$store->state=$state;
    	$store->country=$country;
    	$store->pincode=$pincode;
    	$store->description=$description;
    	$store->email=$email;
    	$store->contact=$contact;
    	$store->website=$website;
    	$store->type=$type;
    	$id=R::store($store);
    	return $id;
    }
  }
}