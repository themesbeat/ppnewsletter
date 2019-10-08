<?php
/**
 * <ModuleName> => cheque
 * <FileName> => validation.php
 * Format expected: <ModuleName><FileName>ModuleFrontController
 */

include('MailChimp.php'); 
use \DrewM\MailChimp\MailChimp;

class ppnewslettersubmitModuleFrontController extends ModuleFrontController
{


	public function __construct(){
		parent::__construct();
		
	}

	public function init(){
		parent::init();
	}


	public function initContent()
	{

		parent::initContent();

		// In the template, we need the vars paymentId & paymentStatus to be defined
	  	$this->context->smarty->assign(
	    array(
	      'fname' => Tools::getValue('fname'),	    
	      'email' => Tools::getValue('email'),
	    ));

		
		

		$api_key='52e935b088e493ccc309edac067a9814-us6';
		$list_id = '1e83389e58';

		$MailChimp = new MailChimp($api_key);
		
	 

		$result = $MailChimp->post("lists/$list_id/members", [
						'email_address' => Tools::getValue('email'),	
						'FNAME'=>Tools::getValue('fname'), 									
						'status'        => 'subscribed',
					]);

		if ($MailChimp->success()) {
			// //print_r($result);	
			// //$this->context->smarty->assign('result', $result);
			// Configuration::updateValue('RESULT', $result);
			// $message = Configuration::get('RESULT');		
			// $this->context->smarty->assign('message', $message);
		} else {
			//echo $MailChimp->getLastError();
			//$this->context->smarty->assign('result', $MailChimp->getLastError(););
		}

	  	// Will use the file modules/cheque/views/templates/front/validation.tpl
	  	$this->setTemplate('module:ppnewsletter/views/templates/front/submit.tpl');
	}

}

?>