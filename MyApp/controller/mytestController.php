<?php

class mytestController extends Controller{
	
	public function indexAction(){
		return "Hello world !";
	}
	
	public function secondAction(){
		return __FILE__;
	}
}