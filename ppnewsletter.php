 <?php
/*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaPatron
*  @copyright  2017-2019 Presta Patron
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License 
*/

if (!defined('_PS_VERSION_')) {
  exit;
}


class Ppnewsletter extends Module {
	public function __construct() {
		$this->name = 'ppnewsletter';
	    $this->tab = 'front_office_features';
	    $this->version = '1.0.0';
	    $this->author = 'Presta Patron';
	    $this->need_instance = 0;
	    $this->ps_versions_compliancy = array('min' => '1.7.0.0', 'max' => _PS_VERSION_); 
	    $this->bootstrap = true;
	 
	    parent::__construct();
	 
	    $this->displayName = $this->l('Newsletter PopUp');
	    $this->description = $this->l('Displays a newsletter popup in your store');
	}


	public function install(){
		if (Shop::isFeatureActive()) {
		    Shop::setContext(Shop::CONTEXT_ALL);
		}
	

		return parent::install() && 
			$this->registerHook('displayFooter') && 	
			$this->registerHook('displayBackOfficeHeader')  &&			
			$this->registerHook('header');
	}


	public function uninstall() {
		
		return parent::uninstall();
	}


	public function processConfiguration() {
		if (Tools::isSubmit('saveppnewsletter')) {
			$enable_newsletter = Tools::getValue('enable_newsletter');			
			Configuration::updateValue('ENABLE_NEWSLETTER', $enable_newsletter);

			$newsletter_type = Tools::getValue('newsletter_type');			
			Configuration::updateValue('NEWSLETTER_TYPE', $newsletter_type);

			$start_date = Tools::getValue('start_date');			
			Configuration::updateValue('START_DATE', $start_date);

			$end_date = Tools::getValue('end_date');			
			Configuration::updateValue('END_DATE', $end_date);

		}	

		if (Tools::isSubmit('saveppnewsletterdesign')) {
			$newsletter_design = Tools::getValue('newsletter_design');			
			Configuration::updateValue('NEWSLETTER_DESIGN', $newsletter_design);

			$newsletter_bgcolor = Tools::getValue('newsletter_bgcolor');			
			Configuration::updateValue('NEWSLETTER_BGCOLOR', $newsletter_bgcolor);

			$button_bgcolor = Tools::getValue('button_bgcolor');			
			Configuration::updateValue('BUTTON_BGCOLOR', $button_bgcolor);


			$button_text_color = Tools::getValue('button_text_color');			
			Configuration::updateValue('BUTTON_TEXT_COLOR', $button_text_color);


			$button_hover_color = Tools::getValue('button_hover_color');			
			Configuration::updateValue('BUTTON_HOVER_COLOR', $button_hover_color);


			$button_hover_text_color = Tools::getValue('button_hover_text_color');			
			Configuration::updateValue('BUTTON_HOVER_TEXT_COLOR', $button_hover_text_color);

			$image_location = Tools::getValue('image_location');			
			Configuration::updateValue('IMAGE_LOCATION', $image_location);



		
			$uploaddir = _PS_BASE_URL_.$this->_path . 'views\images/';
			$file_name = $this->_path . 'views\images'.DIRECTORY_SEPARATOR.basename($_FILES['main_image']['name']);
			
			$uploadfile = dirname(__FILE__).DIRECTORY_SEPARATOR.'views\images'.DIRECTORY_SEPARATOR.basename($_FILES['main_image']['name']);


			if ($_FILES['main_image']['name']) {
				move_uploaded_file($_FILES['main_image']['tmp_name'], $uploadfile);
				$main_image = $_FILES['main_image']['tmp_name'];
			}			
			Configuration::updateValue('MAIN_IMAGE', $file_name);		

			$newsletter_text = Tools::getValue('newsletter_text');					
			Configuration::updateValue('NEWSLETTER_TEXT', $newsletter_text, true);

		}


	



	}




	public function assignConfiguration() {
			$enable_newsletter = Configuration::get('ENABLE_NEWSLETTER');		
			$this->context->smarty->assign('enable_newsletter', $enable_newsletter);

			$newsletter_type = Configuration::get('NEWSLETTER_TYPE');		
			$this->context->smarty->assign('newsletter_type', $newsletter_type);

			$start_date = Configuration::get('START_DATE');		
			$this->context->smarty->assign('start_date', $start_date);

			$end_date = Configuration::get('END_DATE');		
			$this->context->smarty->assign('end_date', $end_date);


			$newsletter_design = Configuration::get('NEWSLETTER_DESIGN');		
			$this->context->smarty->assign('newsletter_design', $newsletter_design);

			$newsletter_bgcolor = Configuration::get('NEWSLETTER_BGCOLOR');		
			$this->context->smarty->assign('newsletter_bgcolor', $newsletter_bgcolor);

			$button_bgcolor = Configuration::get('BUTTON_BGCOLOR');		
			$this->context->smarty->assign('button_bgcolor', $button_bgcolor);


			$button_text_color = Configuration::get('BUTTON_TEXT_COLOR');		
			$this->context->smarty->assign('button_text_color', $button_text_color);

			$button_hover_color = Configuration::get('BUTTON_HOVER_COLOR');		
			$this->context->smarty->assign('button_hover_color', $button_hover_color);

			$button_hover_text_color = Configuration::get('BUTTON_HOVER_TEXT_COLOR');		
			$this->context->smarty->assign('button_hover_text_color', $button_hover_text_color);

			$main_image = Configuration::get('MAIN_IMAGE');		
			$this->context->smarty->assign('main_image', $main_image);

			$newsletter_text = Configuration::get('NEWSLETTER_TEXT');		
			$this->context->smarty->assign('newsletter_text', $newsletter_text);

			$image_location = Configuration::get('IMAGE_LOCATION');		
			$this->context->smarty->assign('image_location', $image_location);

			
		}


	public function getContent() {		
		$this->processConfiguration();
		$this->assignConfiguration();				
		return $this->display(__FILE__, '/views/templates/admin/getContent.tpl');
	}




	public function hookDisplayHeader() {	
		$this->assignConfiguration();	

		$this->context->controller->addCSS($this->_path.'views/css/ppnewsletter.css');	
		$this->context->controller->addJS($this->_path.'views/js/ppnewsletter.js');		

		  
		$this->context->controller->addJS($this->_path.'views/js/list-builder.js');
		
		return $this->display(__FILE__, 'displayHeader.tpl');
	}

	

	 public function hookDisplayBackOfficeHeader($params){
	 	//PrestaShop UI Kit
       	$this->context->controller->addCSS($this->_path.'views/css/bootstrap-prestashop-ui-kit.css');
       	$this->context->controller->addJS($this->_path.'views/js/prestashop-ui-kit.js');

       	$this->context->controller->addCSS($this->_path.'views/css/ppnewsletter-admin.css');       	
		
       	$this->context->controller->addJS($this->_path.'views/js/jscolor.js');
       	$this->context->controller->addJS($this->_path.'views/js/ppnewsletter-admin.js');	
		
		//File Upload with Preview
       	$this->context->controller->addCSS($this->_path.'views/css/file-upload-with-preview.min.css');
       	$this->context->controller->addJS($this->_path.'views/js/file-upload-with-preview.min.js');

       	$this->context->controller->addJS(_PS_BASE_URL_.__PS_BASE_URI__.'js/tiny_mce/tinymce.min.js');
    }



}				