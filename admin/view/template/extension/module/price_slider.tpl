<!-- 
  Module Name: Price Slider
  Description:Price Slider plugin is one of the best product filter plugin for opencart. It has feature to filter products by
  price range.
  Author: Softech Planet
  Author Email:ifno@softechplanet.com
  Author URI: http://softechplanet.com
  Version: 1.0
  Tags: product filter, price filter, price slider
-->
<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-price_slider" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-manufacturer1" class="form-horizontal">
      <div class="form-group">
        <label class="col-sm-2 control-label" for="input-heading"><?php echo $entry_heading; ?></label>
        <div class="col-sm-10">
          <input type="text" name="price_slider_heading" value="<?php
                                       echo $price_slider_heading;
                                       ?>" placeholder="<?php
                                       echo $entry_heading;
                                       ?>" id="price_slider_heading" class="form-control" required/>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label" for="input-price-range"><?php echo $entry_price_range ?></label>
        <div class="col-sm-10">
          <input name="price_slider_range" id="input-price-range" value ="<?php echo $price_slider_range ?>" class="form-control" placeholder="<?php echo $text_price_limits ?>" />
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label" for="input-price-status"><?php echo $entry_status_price; ?></label>
        <div class="col-sm-10">
          <select name="price_slider_status" id="input-price-status" class="form-control form-magic-setting">
            <?php if ($price_slider_status) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select>
        </div>
      </div>
    </form>
    <div class="author_info text-center"><?php echo $author_info; ?></div>
  </div>
</div>
<?php echo $footer; ?>