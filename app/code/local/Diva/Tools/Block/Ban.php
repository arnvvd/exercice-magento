<?php
class Diva_Tools_Block_Ban extends Mage_Core_Block_Abstract implements Mage_Widget_Block_Interface {
/**
  * Render widget html content
  * @return string
  */

  protected function _toHtml() {
    $out = ''; 
   
    $widget_options = $this->getData('diva_widget_options');
    $widget_title = $this->getData('diva_widget_title');
    $widget_desc = $this->getData('diva_widget_desc');
    $widget_link = $this->getData('diva_widget_link');

    if (empty($widget_options)) {
      return $out;
    }
      
    $widget_options_exploded = explode(',', $widget_options);
      
    if (is_array($widget_options_exploded) && count($widget_options_exploded)) {
      foreach ($widget_options_exploded as $item) {
        if($item == 'contact_com') {
            $out .= '
                <h2>'.($widget_title?$widget_title:$this->__('Commercial contact')).'</h2>
                <p>'.($widget_desc?$widget_desc:$this->__('For all your commercial questions')).'</p>
                <ul>
                    <li>'.$this->__('Shipping & order informations').'</li>
                    <li>'.$this->__('Return & availability').'</li>
                    <li>'.$this->__('Manufacturing & design proposals').'</li>
                </ul><a title="'.$this->__('Contact-us').'" class="button" href="'.($widget_link?$widget_link:'/contact').'"><span><span>'.$this->__('Contact-us').'</span></span></a>
            ';
        }elseif($item == 'contact_tech') {
            $out .= '
                    <h2>'.($widget_title?$widget_title:$this->__('Technical contact')).'</h2>
                    <p>'.($widget_desc?$widget_desc:$this->__('For all your technicals informations')).'</p>
                    <ul>
                        <li>'.$this->__('Website utilisation & reports').'</li>
                        <li>'.$this->__('Technical product informations').'</li>
                        <li>'.$this->__('Manufacturing informations').'</li>
                    </ul><a title="'.$this->__('Contact-us').'" class="button" href="'.($widget_link?$widget_link:'/contact').'"><span><span>'.$this->__('Contact-us').'</span></span></a>
                ';
        }else{ // social
            $out .= '
              <h2>'.($widget_title?$widget_title:$this->__('Join us on social networks')).'</h2>
              <ul>
                  <li><a href="http://twitter.com/" target="_blank" title="Share on Twitter" class="link-twitter">Share on Twitter</a></li>
                  <li><a href="http://facebook.com/" target="_blank" title="Share on Facebook" class="link-facebook">Share on Facebook</a></li>
                  <li><a href="/blog" target="_blank" title="See our blog" class="link-blog">See our blog</a></li>
              </ul>
          ';
        }
      }
    }
     // test return Mage::getSingleton('core/layout')->createBlock('core/template')->setTemplate('path/to/file.phtml')->toHtml(); (car aucune des classe précédente implemente setTemplate !)
     // or $this->setTemplate('catalog/product/widget/new/content/new_grid.phtml');
    return $out;
  }
}