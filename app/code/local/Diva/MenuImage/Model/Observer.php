<?php 
class Diva_MenuImage_Model_Observer
{
    /* Events driven functions */
    public function pageBlockHtmlTopmenuGethtmlBefore(Varien_Event_Observer $observer)
    {
        $blockOverride = $observer->getEvent()->getBlock();
        $menuOverride = $observer->getMenu();
        $categories = Mage::helper('catalog/category')->getStoreCategories();

        $this->_addFullCatInfoToMenu($categories, $menuOverride, $blockOverride, true);
    }

    public function catalogCategoryCollectionLoadBefore(Varien_Event_Observer $observer)
    {
        $categoryCollection = $observer->getEvent()->getCategoryCollection();
        $categoryCollection->addAttributeToSelect('image'); 
    }

    public function catalogCategoryFlatLoadnodesBefore(Varien_Event_Observer $observer)
    {
        $observer->getSelect()
        ->columns(
            array('image')
        );
    }

    /* Protected */
    protected function _addFullCatInfoToMenu($categories, $menuOverride, $menuBlock, $addTags = false)
    {
        $categoryModel = Mage::getModel('catalog/category');

        foreach ($categories as $category) {
            if (!$category->getIsActive()) {
                continue;
            }

            $nodeId = 'category-node-' . $category->getId();

            $categoryModel->setId($category->getId());
            if ($addTags) {
                $menuBlock->addModelTags($categoryModel);
            }

            $tree = $menuOverride->getTree();

            $categoryData = array(
                'name' => $category->getName(),
                'id' => $nodeId,
                'url' => Mage::helper('catalog/category')->getCategoryUrl($category),
                'is_active' => $this->_isActiveMenuCategory($category),
                'image' => $category->getImage()
            );



            //Mage::getSingleton('customer/session')->addNotice("Var_export : <pre>".var_export($category->getName(),true)."</pre>"  );


            $categoryNode = new Varien_Data_Tree_Node($categoryData, 'id', $tree, $menuOverride);
            $menuOverride->addChild($categoryNode);

            $flatHelper = Mage::helper('catalog/category_flat');
            if ($flatHelper->isEnabled() && $flatHelper->isBuilt(true)) {
                $subcategories = (array)$category->getChildrenNodes();
            } else {
                $subcategories = $category->getChildren();
            }

            $this->_addFullCatInfoToMenu($subcategories, $categoryNode, $menuBlock, $addTags);
        }
    }

    protected function _isActiveMenuCategory($category)
    {
        $catalogLayer = Mage::getSingleton('catalog/layer');
        if (!$catalogLayer) {
            return false;
        }

        $currentCategory = $catalogLayer->getCurrentCategory();
        if (!$currentCategory) {
            return false;
        }

        $categoryPathIds = explode(',', $currentCategory->getPathInStore());
        return in_array($category->getId(), $categoryPathIds);
    }


}
