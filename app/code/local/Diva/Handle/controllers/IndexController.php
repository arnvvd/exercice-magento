<?php

class Diva_Handle_IndexController extends Mage_Core_Controller_Front_Action {        
    public function indexAction() {
	Mage::getSingleton('core/session')->addSuccess('IndexAction launched.');
	$this->loadLayout();
	$this->getLayout()->getBlock('head')->setTitle($this->__('Profile'));
	$this->getLayout()->getBlock('root')->setTemplate('page/1column.phtml');

	/*$block = $this->getLayout()->createBlock(
		'Mage_Core_Block_Template',
		'created_block_custom',
		array('template' => 'custom/profile.phtml')
	);
	$block->setMyValue("Value to pass to phtml");*/
	$this->getLayout()->getBlock('content')->append($block);
	$this->renderLayout();
    }
    public function startAction() {
        echo 'StartAction launched.';
    }
}

?>
