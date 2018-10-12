<!--
  Module Name: Price Slider
  Description:Price Slider plugin is one of the best product filter plugin for opencart. It has feature to filter products by
  price range.
  Author: Softech Planet
  Author Email:info@softechplanet.com
  Author URI: http://softechplanet.com
  Version: 1.0
  Tags: product filter, price filter, price slider
-->
<style type="text/css">
.slider-example {
	padding-top: 10px;
	padding-bottom: 55px;
	margin: 35px 0;
}
</style>
<div class="box sidebarFilter panel panel-default"<?php if(isset($price_filter_status) && $price_filter_status == "0") {  echo 'style="display: none"';  }?>  >

	<div class="sidebar-category-title-wrapper">
	  <span class="sidebar-category-title"><?php echo $heading_title; ?></span>
	</div>

	<div class="list-group">
    <div class="list-group-item price-filter">
      <div id="filter-group1"> <span class="min-amount"><?php echo $price_code; ?><?php echo $price_range_min; ?></span><span class="max-amount"><?php echo $price_code; ?><?php echo $price_range_max; ?></span>
        <input id="price-slider" type="text" class="span2" value="" data-slider-min="<?php echo $price_range_min; ?>" data-slider-max="<?php echo $price_range_max; ?>" data-slider-step="5" data-slider-value="[<?php echo (isset($price_range[0]) && $price_range[0]!='')?$price_range[0]:$price_range_min; ?>,<?php echo (isset($price_range[1]) && $price_range[1]!='')?$price_range[1]:$price_range_max; ?>]"/>
      </div>
    </div>
  </div>
</div>
<div class="sidebarFilter-footer panel-footer text-right">
  <button type="button" id="button-filter" class="btn btn-primary"><?php echo $button_filter; ?></button>
</div>
<script>

jQuery(function() {

	$("#price-slider").slider({
		tooltip: 'always'
	});

	$('#button-filter').on('click', function() {
	pr = '';
	price = $('#price-slider').val();
	if(price!='')
	{
		pr = "&pr="+price;
	}
	location = "<?php echo $action; ?>"+pr;
});
});
</script>
