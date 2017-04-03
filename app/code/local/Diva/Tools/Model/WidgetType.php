<?php
class Diva_Tools_Model_WidgetType {
/**
  * Available widget option
  * @return array
  */
  public function toOptionArray() {
    return array(
      array('value' => 'social', 'label' => 'Social information'),
      array('value' => 'contact_com', 'label' => 'Commercial Contact'),
      array('value' => 'contact_tech', 'label' => 'Technical Contact'),
    );
  }
}