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
      <div class="panel-heading clearfix">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>        
        <div class="pull-right">
        <button type="submit" form="form-gallery" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-danger"><i class="fa fa-save"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      </div>
      <div class="panel-body">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-gallery" class="form-horizontal">
          <?php if ($error_warning) { ?>
          <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>
          <?php } ?>
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-languagesetting" data-toggle="tab"><?php echo $tab_languagesetting; ?></a></li>
            <li><a href="#tab-albumsetting" data-toggle="tab"><?php echo $tab_albumsetting; ?></a></li>
            <li><a href="#tab-photo" data-toggle="tab"><?php echo $tab_photo; ?></a></li>
          </ul>
          <div class="tab-content">            
						<div class="tab-pane" id="tab-albumsetting">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
                <div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
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
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                  <?php if ($error_keyword) { ?>
                  <div class="text-danger"><?php echo $error_keyword; ?></div>
                  <?php } ?>
                </div>
              </div>
            </div>
            <div class="tab-pane active" id="tab-languagesetting">
							<ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab">
                	<?php if(VERSION >= '2.2.0.0') { ?>
                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                    <?php } else{ ?>
                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                    <?php } ?>
                  <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="gallery_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($gallery_description[$language['language_id']]) ? $gallery_description[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_title[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_title[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group hide">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="gallery_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($gallery_description[$language['language_id']]['description']) ? $gallery_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-top-description<?php echo $language['language_id']; ?>"><?php echo $entry_top_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="gallery_description[<?php echo $language['language_id']; ?>][top_description]" placeholder="<?php echo $entry_description; ?>" id="input-top-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($gallery_description[$language['language_id']]['top_description']) ? $gallery_description[$language['language_id']]['top_description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-bottom-description<?php echo $language['language_id']; ?>"><?php echo $entry_bottom_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="gallery_description[<?php echo $language['language_id']; ?>][bottom_description]" placeholder="<?php echo $entry_description; ?>" id="input-bottom-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($gallery_description[$language['language_id']]['bottom_description']) ? $gallery_description[$language['language_id']]['bottom_description'] : ''; ?></textarea>
                    </div>
                  </div>
                  
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="gallery_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($gallery_description[$language['language_id']]) ? $gallery_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_meta_title[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="gallery_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($gallery_description[$language['language_id']]) ? $gallery_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                    <div class="col-sm-10">
                      <textarea name="gallery_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($gallery_description[$language['language_id']]) ? $gallery_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>              
            </div>
						<div class="tab-pane" id="tab-photo">              
              <div class="table-responsive">
                <table id="photo-value" class="table table-striped table-bordered table-hover">
  								<thead>
  									<tr>
  										<td class="text-left required"><?php echo $entry_title; ?></td>
                      <td class="text-left"><?php echo $entry_photo; ?></td>
                      <td class="text-center"><?php echo $entry_link; ?></td>
  										<td class="text-center"><?php echo $entry_highlight; ?></td>
  										<td class="text-right"><?php echo $entry_sort_order; ?></td>
  										<td></td>
  									</tr>
  								</thead>
  								<tbody>
  								<?php $gallery_photo_row = 0; ?>
  								<?php foreach ($gallery_photos as $gallery_photo) { ?>
  								<tr id="photo-value-row<?php echo $gallery_photo_row; ?>">
  									<td class="text-left"><input type="hidden" name="gallery_photo[<?php echo $gallery_photo_row; ?>][gallery_photo_id]" value="<?php echo $gallery_photo['gallery_photo_id']; ?>" />
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon">
                    	<?php if(VERSION >= '2.2.0.0') { ?>
                      <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                      <?php } else{ ?>
                      <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                      <?php } ?>
                    </span>
                      <input type="text" name="gallery_photo[<?php echo $gallery_photo_row; ?>][gallery_photo_description][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($gallery_photo['gallery_photo_description'][$language['language_id']]) ? $gallery_photo['gallery_photo_description'][$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
                    </div>
                    <?php if (isset($error_gallery_photo[$gallery_photo_row][$language['language_id']])) { ?>
                    <div class="text-danger"><?php echo $error_gallery_photo[$gallery_photo_row][$language['language_id']]; ?></div>
                    <?php } ?>
                    <?php } ?></td>
  									<td class="text-left"><a href="" id="thumb-photo<?php echo $gallery_photo_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $gallery_photo['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                      <input type="hidden" name="gallery_photo[<?php echo $gallery_photo_row; ?>][photo]" value="<?php echo $gallery_photo['photo']; ?>" id="input-photo<?php echo $gallery_photo_row; ?>" /></td>
                    <td class="text-right"><input type="text" name="gallery_photo[<?php echo $gallery_photo_row; ?>][link]" value="<?php echo $gallery_photo['link']; ?>" class="form-control" /></td>
                    <td class="text-center" width="15%">
                        <input type="checkbox" name="gallery_photo[<?php echo $gallery_photo_row; ?>][highlight]" class="highlight" value="1" <?php echo (!empty($gallery_photo['highlight'])) ? 'checked="checked" data-highlight="1"' : 'data-highlight="0"'; ?> />
                    </td>
  									<td class="text-right"><input type="text" name="gallery_photo[<?php echo $gallery_photo_row; ?>][sort_order]" value="<?php echo $gallery_photo['sort_order']; ?>" class="form-control" /></td>
  									<td class="text-left"><button type="button" onclick="$('#photo-value-row<?php echo $gallery_photo_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
  								</tr>
  								<?php $gallery_photo_row++; ?>
  								<?php } ?>
  							</tbody>
  							<tfoot>
                  <tr>
                    <td colspan="5"></td>
                    <td class="text-left"><button type="button" onclick="addGalleryphoto();" data-toggle="tooltip" title="<?php echo $button_photo_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                  </tr>
                </tfoot>
              </table>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_photo_image; ?></label>
                <div class="col-sm-5">
                	<div class="input-group">
                  <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control" />                  
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                  </span></div>
                </div>
                <div class="col-sm-5">
                	<div class="input-group">
                  <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />                  
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                  </span></div>
                </div>
              </div>
              <div class="form-group">
              	<label class="col-sm-2 control-label">&nbsp;</label>
                <div class="col-sm-10">
              		<div class="alert alert-info"><i class="fa fa-question-circle"></i> <?php echo $help_photo_image; ?></div>
            		</div>
            </div>
          </div>
        </form>	
      </div>
    </div>
  </div>
	<script type="text/javascript"><!--
		$('#language a:first').tab('show');	
		$('#option a:first').tab('show');
//--></script>
<script type="text/javascript"><!--
var gallery_photo_row = <?php echo $gallery_photo_row; ?>;

function addGalleryphoto() {
	html  = '<tr id="photo-value-row' + gallery_photo_row + '">';	
    html += '  <td class="text-left"><input type="hidden" name="gallery_photo[' + gallery_photo_row + '][gallery_photo_id]" value="" />';
	 <?php foreach ($languages as $language) { ?>
			html += '    <div class="input-group">';
			html += '      <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" name="gallery_photo[' + gallery_photo_row + '][gallery_photo_description][<?php echo $language['language_id']; ?>][name]" value="" placeholder="<?php echo $entry_title; ?>" class="form-control" />';
			html += '    </div>';
	<?php } ?>
	html += '  </td>';
    html += '  <td class="text-left"><a href="" id="thumb-photo' + gallery_photo_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="gallery_photo[' + gallery_photo_row + '][photo]" value="" id="input-photo' + gallery_photo_row + '" /></td>';
  html += '  <td class="text-right"><input type="text" name="gallery_photo[' + gallery_photo_row + '][link]" value="" placeholder="<?php echo $entry_link; ?>" class="form-control" /></td>';
    html += '  <td class="text-center" width="15%"><input type="checkbox" name="gallery_photo['+ gallery_photo_row +'][highlight]" class="highlight" data-highlight="0" value="1" /></td>';
	html += '  <td class="text-right"><input type="text" name="gallery_photo[' + gallery_photo_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#photo-value-row' + gallery_photo_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';	
	
	$('#photo-value tbody').append(html);
	
	gallery_photo_row++;
}


$(document).delegate('.highlight', 'change', function() {
  // Remove HighLight
  $('.highlight').each(function() {
    if($(this).attr('data-highlight') == 1) {
      $(this).prop('checked', false);    
      $(this).attr('data-highlight', 0);
    }
  });

   // Remove Me if false
   if($(this).prop('checked') == false) {
    $(this).prop('checked', false);
    $(this).attr('data-highlight', 0);
   }

   // Remove Me if true
   if($(this).prop('checked') == true) {
    $(this).prop('checked', true);
    $(this).attr('data-highlight', 1);
   }
});
//--></script>
<?php if(VERSION <= '2.2.0.0') { ?>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $language['language_id']; ?>').summernote({ height: 300 });
$('#input-bottom-description<?php echo $language['language_id']; ?>').summernote({ height: 300 });
$('#input-top-description<?php echo $language['language_id']; ?>').summernote({ height: 300 });
<?php } ?>
//--></script>
<?php } else { ?>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
<?php } ?>
</div>
<?php echo $footer; ?>