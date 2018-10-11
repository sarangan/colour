<?php echo $header; ?><?php echo $column_left; ?>
<div id="content" class="m-menu-wrap">
  <div class="container-fluid">
    <div class="page-header">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
    <?php echo $mtabs; ?>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>        
        <div class="pull-right">
        <button type="submit" form="form-mpphoto" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-danger"><i class="fa fa-save"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mpphoto" class="form-horizontal">
          <?php if ($error_warning) { ?>
          <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>
          <?php } ?>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>          
          <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_title; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group">
                <span class="input-group-addon">
                <?php if(VERSION >= '2.2.0.0') { ?>
                <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                <?php } else { ?>
                <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                <?php } ?>
                </span>
                <input type="text" name="photo_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($photo_description[$language['language_id']]) ? $photo_description[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
              </div>
              <?php if (isset($error_title[$language['language_id']])) { ?>
              <div class="text-danger"><?php echo $error_title[$language['language_id']]; ?></div>
              <?php } ?>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-photo"><span data-toggle="tooltip" title="<?php echo $help_photo; ?>"><?php echo $entry_photo; ?></span></label>
							<div class="col-sm-10">
								<input type="text" name="photo_name" value="<?php echo $photo_name; ?>" placeholder="<?php echo $entry_photo; ?>" id="input-photo" class="form-control" />
                  <input type="hidden" name="gallery_id" value="<?php echo $gallery_id; ?>" />
									<?php if ($error_photo_name) { ?>
										<div class="text-danger"><?php echo $error_photo_name; ?></div>
									<?php } ?>
							</div>                
           </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group mp-buttons">
            <label class="col-sm-2 control-label"><?php echo $entry_carousel; ?></label>
            <div class="col-sm-3">
              <div class="btn-group btn-group-justified" data-toggle="buttons">
                <label class="btn btn-primary <?php echo !empty($carousel) ? 'active' : ''; ?>">
                  <input type="radio" name="carousel" value="1" <?php echo (!empty($carousel)) ? 'checked="checked"' : ''; ?> />
                  <?php echo $text_yes; ?>                            
                </label>
                <label class="btn btn-primary <?php echo empty($carousel) ? 'active' : ''; ?>">
                  <input type="radio" name="carousel" value="0" <?php echo (empty($carousel)) ? 'checked="checked"' : ''; ?> />
                  <?php echo $text_no; ?>                            
                </label>
              </div>
            </div>
          </div>
          <div class="form-group mp-buttons">
            <label class="col-sm-2 control-label"><?php echo $entry_extitle; ?></label>
            <div class="col-sm-3">
              <div class="btn-group btn-group-justified" data-toggle="buttons">
                <label class="btn btn-primary <?php echo !empty($extitle) ? 'active' : ''; ?>">
                  <input type="radio" name="extitle" value="1" <?php echo (!empty($extitle)) ? 'checked="checked"' : ''; ?> />
                  <?php echo $text_yes; ?>                            
                </label>
                <label class="btn btn-primary <?php echo empty($extitle) ? 'active' : ''; ?>">
                  <input type="radio" name="extitle" value="0" <?php echo (empty($extitle)) ? 'checked="checked"' : ''; ?> />
                  <?php echo $text_no; ?>                            
                </label>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
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
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('input[name=\'photo_name\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=gallery/gallery/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['title'],
						value: item['gallery_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'photo_name\']').val(item['label']);
		$('input[name=\'gallery_id\']').val(item['value']);
	}
});
//--></script>
</div>
<?php echo $footer; ?>
