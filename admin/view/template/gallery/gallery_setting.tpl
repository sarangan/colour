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
        <h3 class="panel-title">
          <i class="fa fa-cog"></i> 
          <?php echo $text_edit; ?></h3>
        <div class="pull-right">
        <button type="submit" form="form-account" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-danger"><i class="fa fa-save"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      </div>
      <div class="panel-body">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $text_gsetting; ?></a></li>
          <li><a href="#tab-colors" data-toggle="tab"><?php echo $text_colors; ?></a></li>
        </ul>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-account" class="form-horizontal">
        <div class="tab-content">            
          <div class="tab-pane active" id="tab-general">
          <?php if ($error_warning) { ?>
          <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>
          <?php } ?>
          <?php if ($success) { ?>
          <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>
          <?php } ?>
          <fieldset>
            <h3><?php echo $fieldset_general; ?></h3>
            <div class="form-group mp-buttons">
              <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
              <div class="col-sm-3">
                <div class="btn-group btn-group-justified" data-toggle="buttons">
                  <label class="btn btn-primary <?php echo !empty($gallery_setting_status) ? 'active' : ''; ?>">
                    <input type="radio" name="gallery_setting_status" value="1" <?php echo (!empty($gallery_setting_status)) ? 'checked="checked"' : ''; ?> />
                    <?php echo $text_enabled; ?>                            
                  </label>
                  <label class="btn btn-primary <?php echo empty($gallery_setting_status) ? 'active' : ''; ?>">
                    <input type="radio" name="gallery_setting_status" value="0" <?php echo (empty($gallery_setting_status)) ? 'checked="checked"' : ''; ?> />
                    <?php echo $text_disabled; ?>                            
                  </label>
                </div>
              </div>
            </div>
            <div class="form-group mp-buttons">
              <label class="col-sm-2 control-label"><?php echo $entry_social_status; ?></label>
              <div class="col-sm-3">
                <div class="btn-group btn-group-justified" data-toggle="buttons">
                  <label class="btn btn-primary <?php echo !empty($gallery_setting_social_status) ? 'active' : ''; ?>">
                    <input type="radio" name="gallery_setting_social_status" value="1" <?php echo (!empty($gallery_setting_social_status)) ? 'checked="checked"' : ''; ?> />
                    <?php echo $text_yes; ?>                            
                  </label>
                  <label class="btn btn-primary <?php echo empty($gallery_setting_social_status) ? 'active' : ''; ?>">
                    <input type="radio" name="gallery_setting_social_status" value="0" <?php echo (empty($gallery_setting_social_status)) ? 'checked="checked"' : ''; ?> />
                    <?php echo $text_no; ?>                            
                  </label>
                </div>
              </div>
            </div>            
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-popup_width"><span data-toggle="tooltip" title="<?php echo $help_popup; ?>"><?php echo $entry_popup; ?></span></label>
              <div class="col-sm-5">
                <div class="input-group">
                  <input type="text" name="gallery_setting_popup_width" value="<?php echo $gallery_setting_popup_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-popup_width" class="form-control" />                  
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                  </span>
                </div>
                <?php if ($error_popup_size) { ?>
                <div class="text-danger"><?php echo $error_popup_size; ?></div>
                <?php } ?>
              </div>
              <div class="col-sm-5">
                <div class="input-group">
                  <input type="text" name="gallery_setting_popup_height" value="<?php echo $gallery_setting_popup_height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-popup_height" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                  </span></div>
              </div>
            </div>
          </fieldset>
          <br/><br/><br/><br/>
          <fieldset>
            <h3><?php echo $fieldset_album_page; ?></h3>            
            <div class="form-group hide mp-buttons">
              <label class="col-sm-2 control-label"><?php echo $entry_album_description; ?></label>
              <div class="col-sm-3">
                <div class="btn-group btn-group-justified" data-toggle="buttons">
                  <label class="btn btn-primary <?php echo !empty($gallery_setting_album_description) ? 'active' : ''; ?>">
                    <input type="radio" name="gallery_setting_album_description" value="1" <?php echo (!empty($gallery_setting_album_description)) ? 'checked="checked"' : ''; ?> />
                    <?php echo $text_yes; ?>                            
                  </label>
                  <label class="btn btn-primary <?php echo empty($gallery_setting_album_description) ? 'active' : ''; ?>">
                    <input type="radio" name="gallery_setting_album_description" value="0" <?php echo (empty($gallery_setting_album_description)) ? 'checked="checked"' : ''; ?> />
                    <?php echo $text_no; ?>                            
                  </label>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_album_limit; ?></label>
              <div class="col-sm-10">
                <input type="text" name="gallery_setting_album_limit" value="<?php echo $gallery_setting_album_limit; ?>" placeholder="<?php echo $entry_album_limit; ?>"class="form-control" />
                <?php if ($error_album_limit) { ?>
                <div class="text-danger"><?php echo $error_album_limit; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_album_image; ?>"><?php echo $entry_album_image; ?></span></label>
              <div class="col-sm-5">
                <div class="input-group">
                  <input type="text" name="gallery_setting_album_width" value="<?php echo $gallery_setting_album_width; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                  </span></div>
                <?php if ($error_album_size) { ?>
                <div class="text-danger"><?php echo $error_album_size; ?></div>
                <?php } ?>
              </div>
              <div class="col-sm-5">
                <div class="input-group">
                  <input type="text" name="gallery_setting_album_height" value="<?php echo $gallery_setting_album_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                  </span></div>
              </div>
            </div>
          </fieldset>
          <br/><br/><br/><br/>
          <fieldset>
            <h3><?php echo $fieldset_photo_page; ?></h3>
            <div class="form-group mp-buttons">
              <label class="col-sm-2 control-label"><?php echo $entry_cursive_font; ?></label>
              <div class="col-sm-3">
                <div class="btn-group btn-group-justified" data-toggle="buttons">
                  <label class="btn btn-primary <?php echo !empty($gallery_setting_photo_cursive_font) ? 'active' : ''; ?>">
                    <input type="radio" name="gallery_setting_photo_cursive_font" value="1" <?php echo (!empty($gallery_setting_photo_cursive_font)) ? 'checked="checked"' : ''; ?> />
                    <?php echo $text_yes; ?>                            
                  </label>
                  <label class="btn btn-primary <?php echo empty($gallery_setting_photo_cursive_font) ? 'active' : ''; ?>">
                    <input type="radio" name="gallery_setting_photo_cursive_font" value="0" <?php echo (empty($gallery_setting_photo_cursive_font)) ? 'checked="checked"' : ''; ?> />
                    <?php echo $text_no; ?>                            
                  </label>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_photo_image; ?>"><?php echo $entry_photo_image; ?></span></label>
              <div class="col-sm-5">
                <div class="input-group">
                  <input type="text" name="gallery_setting_photo_width" value="<?php echo $gallery_setting_photo_width; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                  </span></div>
                <?php if ($error_photo_size) { ?>
                <div class="text-danger"><?php echo $error_photo_size; ?></div>
                <?php } ?>
              </div>
              <div class="col-sm-5">
                <div class="input-group">
                  <input type="text" name="gallery_setting_photo_height" value="<?php echo $gallery_setting_photo_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                  </span></div>
              </div>
            </div>
          </fieldset>
          <br/><br/><br/><br/>
          <fieldset>
            <h3><?php echo $fieldset_albumn_photo; ?></h3>            
            <div class="form-group mp-buttons">
              <label class="col-sm-2 control-label"><?php echo $entry_cursive_font; ?></label>
              <div class="col-sm-3">
                <div class="btn-group btn-group-justified" data-toggle="buttons">
                  <label class="btn btn-primary <?php echo !empty($gallery_setting_albumphoto_cursive_font) ? 'active' : ''; ?>">
                    <input type="radio" name="gallery_setting_albumphoto_cursive_font" value="1" <?php echo (!empty($gallery_setting_albumphoto_cursive_font)) ? 'checked="checked"' : ''; ?> />
                    <?php echo $text_yes; ?>                            
                  </label>
                  <label class="btn btn-primary <?php echo empty($gallery_setting_albumphoto_cursive_font) ? 'active' : ''; ?>">
                    <input type="radio" name="gallery_setting_albumphoto_cursive_font" value="0" <?php echo (empty($gallery_setting_albumphoto_cursive_font)) ? 'checked="checked"' : ''; ?> />
                    <?php echo $text_no; ?>                            
                  </label>
                </div>
              </div>
            </div>
            <div class="form-group mp-buttons">
              <label class="col-sm-2 control-label"><?php echo $entry_albumphoto_description; ?></label>
              <div class="col-sm-3">
                <div class="btn-group btn-group-justified" data-toggle="buttons">
                  <label class="btn btn-primary <?php echo !empty($gallery_setting_albumphoto_description) ? 'active' : ''; ?>">
                    <input type="radio" name="gallery_setting_albumphoto_description" value="1" <?php echo (!empty($gallery_setting_albumphoto_description)) ? 'checked="checked"' : ''; ?> />
                    <?php echo $text_yes; ?>                            
                  </label>
                  <label class="btn btn-primary <?php echo empty($gallery_setting_albumphoto_description) ? 'active' : ''; ?>">
                    <input type="radio" name="gallery_setting_albumphoto_description" value="0" <?php echo (empty($gallery_setting_albumphoto_description)) ? 'checked="checked"' : ''; ?> />
                    <?php echo $text_no; ?>                            
                  </label>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_albumphoto_limit; ?></label>
              <div class="col-sm-10">
                <input type="text" name="gallery_setting_albumphoto_limit" value="<?php echo $gallery_setting_albumphoto_limit; ?>" placeholder="<?php echo $entry_albumphoto_limit; ?>" class="form-control" />
                <?php if ($error_albumphoto_limit) { ?>
                <div class="text-danger"><?php echo $error_albumphoto_limit; ?></div>
                <?php } ?>
              </div>
            </div>  
            <div class="form-group">
              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_photo_image; ?>"><?php echo $entry_photo_image; ?></span></label>
              <div class="col-sm-5">
                <div class="input-group">
                  <input type="text" name="gallery_setting_albumphoto_width" value="<?php echo $gallery_setting_albumphoto_width; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                  </span></div>
                <?php if ($error_albumphoto_size) { ?>
                <div class="text-danger"><?php echo $error_albumphoto_size; ?></div>
                <?php } ?>
              </div>
              <div class="col-sm-5">
                <div class="input-group">
                  <input type="text" name="gallery_setting_albumphoto_height" value="<?php echo $gallery_setting_albumphoto_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                  </span></div>
              </div>
            </div>
          </fieldset>
          </div> 
          <div class="tab-pane" id="tab-colors"> 
            <fieldset>
              <h3><?php echo $fieldset_albumn_allphoto; ?></h3> 
              <div class="form-group">
                <div class="col-sm-6">
                  <label class="control-label" for="input-color_title_text"><?php echo $entry_color_title_text; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[title_text]" value="<?php echo !empty($gallery_setting_color['title_text']) ? $gallery_setting_color['title_text']:''; ?>" placeholder="<?php echo $entry_color_title_text; ?>" id="input-color_title_text" class="form-control" />     
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="control-label" for="input-color_title_text"><?php echo $entry_albumtitle_bg; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[album_title_bg]" value="<?php echo !empty($gallery_setting_color['album_title_bg']) ? $gallery_setting_color['album_title_bg']:''; ?>" placeholder="<?php echo $entry_albumtitle_bg; ?>" id="input-color_album_title_bg" class="form-control" />     
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="control-label" for="input-color_title_text"><?php echo $entry_color_albumtitle_text; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[albumtitle_text]" value="<?php echo !empty($gallery_setting_color['albumtitle_text']) ? $gallery_setting_color['albumtitle_text']:''; ?>" placeholder="<?php echo $entry_color_albumtitle_text; ?>" id="input-color_albumtitle_text" class="form-control" />     
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="control-label" for="input-photo_tilte_color"><?php echo $entry_photo_tilte_color; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[photo_tilte_color]" value="<?php echo !empty($gallery_setting_color['photo_tilte_color']) ? $gallery_setting_color['photo_tilte_color']:''; ?>" placeholder="<?php echo $entry_photo_tilte_color; ?>" id="input-photo_tilte_color" class="form-control" />     
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="control-label" for="input-photo_zoomicon_color"><?php echo $entry_photo_zoomicon_color; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[photo_zoomicon_color]" value="<?php echo !empty($gallery_setting_color['photo_zoomicon_color']) ? $gallery_setting_color['photo_zoomicon_color']:''; ?>" placeholder="<?php echo $entry_photo_zoomicon_color; ?>" id="input-photo_zoomicon_color" class="form-control" />     
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="control-label" for="input-photo_hoverbg_color"><?php echo $entry_photo_hoverbg_color; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[photo_hoverbg_color]" value="<?php echo !empty($gallery_setting_color['photo_hoverbg_color']) ? $gallery_setting_color['photo_hoverbg_color']:''; ?>" placeholder="<?php echo $entry_photo_hoverbg_color; ?>" id="input-photo_hoverbg_color" class="form-control" />     
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
              </div>
            </fieldset>
            <fieldset>
              <h3><?php echo $fieldset_albumns; ?></h3> 
              <div class="form-group">
                <div class="col-sm-6">
                  <label class="control-label" for="input-albumsapge_title_text"><?php echo $entry_albumsapge_title_text; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[albumsapge_title_text]" value="<?php echo !empty($gallery_setting_color['albumsapge_title_text']) ? $gallery_setting_color['albumsapge_title_text']:''; ?>" placeholder="<?php echo $entry_albumsapge_title_text; ?>" id="input-albumsapge_title_text" class="form-control" />     
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="control-label" for="input-albums_detail_text"><?php echo $entry_albums_detail_text; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[albums_detail_text]" value="<?php echo !empty($gallery_setting_color['albums_detail_text']) ? $gallery_setting_color['albums_detail_text']:''; ?>" placeholder="<?php echo $entry_albums_detail_text; ?>" id="input-albums_detail_text" class="form-control" />     
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="control-label" for="input-albums_wrapbg"><?php echo $entry_albums_wrapbg; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[albums_wrapbg]" value="<?php echo !empty($gallery_setting_color['albums_wrapbg']) ? $gallery_setting_color['albums_wrapbg']:''; ?>" placeholder="<?php echo $entry_albums_wrapbg; ?>" id="input-albums_wrapbg" class="form-control" />
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
              </div>
            </fieldset>  
            <fieldset>
              <h3><?php echo $fieldset_sharethis; ?></h3> 
              <div class="form-group">
                <div class="col-sm-6">
                  <label class="control-label" for="input-sharethis_bg"><?php echo $entry_sharethis_bg; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[sharethis_bg]" value="<?php echo !empty($gallery_setting_color['sharethis_bg']) ? $gallery_setting_color['sharethis_bg']:''; ?>" placeholder="<?php echo $entry_sharethis_bg; ?>" id="input-sharethis_bg" class="form-control" />  
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="control-label" for="input-sharethis_bg"><?php echo $entry_sharethis_color; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[sharethis_color]" value="<?php echo !empty($gallery_setting_color['sharethis_color']) ? $gallery_setting_color['sharethis_color']:''; ?>" placeholder="<?php echo $entry_sharethis_color; ?>" id="input-sharethis_color" class="form-control" />  
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
              </div>
            </fieldset>  
            <fieldset>
              <h3><?php echo $fieldset_extension; ?></h3> 
              <div class="form-group">
                <div class="col-sm-6">
                  <label class="control-label" for="input-extitle_bgcolor"><?php echo $entry_extitle_bgcolor; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[extitle_bgcolor]" value="<?php echo !empty($gallery_setting_color['extitle_bgcolor']) ? $gallery_setting_color['extitle_bgcolor']:''; ?>" placeholder="<?php echo $entry_extitle_bgcolor; ?>" id="input-extitle_bgcolor" class="form-control" />  
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="control-label" for="input-extitle_textcolor"><?php echo $entry_extitle_textcolor; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[extitle_textcolor]" value="<?php echo !empty($gallery_setting_color['extitle_textcolor']) ? $gallery_setting_color['extitle_textcolor']:''; ?>" placeholder="<?php echo $entry_extitle_textcolor; ?>" id="input-extitle_textcolor" class="form-control" />  
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="control-label" for="input-extitle_bordercolor"><?php echo $entry_extitle_bordercolor; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[extitle_bordercolor]" value="<?php echo !empty($gallery_setting_color['extitle_bordercolor']) ? $gallery_setting_color['extitle_bordercolor']:''; ?>" placeholder="<?php echo $entry_extitle_bordercolor; ?>" id="input-extitle_bordercolor" class="form-control" />  
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="control-label" for="input-exview_all_color"><?php echo $entry_exview_all_color; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[exview_all_color]" value="<?php echo !empty($gallery_setting_color['exview_all_color']) ? $gallery_setting_color['exview_all_color']:''; ?>" placeholder="<?php echo $entry_exview_all_color; ?>" id="input-exview_all_color" class="form-control" />  
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="control-label" for="input-carousel_arrow_bgcolor"><?php echo $entry_carousel_arrow_bgcolor; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[carousel_arrow_bgcolor]" value="<?php echo !empty($gallery_setting_color['carousel_arrow_bgcolor']) ? $gallery_setting_color['carousel_arrow_bgcolor']:''; ?>" placeholder="<?php echo $entry_carousel_arrow_bgcolor; ?>" id="input-carousel_arrow_bgcolor" class="form-control" />  
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="control-label" for="input-carousel_arrow_color"><?php echo $entry_carousel_arrow_color; ?></label>
                  <div class="colorpicker colorpicker-component input-group">
                    <input type="text" name="gallery_setting_color[carousel_arrow_color]" value="<?php echo !empty($gallery_setting_color['carousel_arrow_color']) ? $gallery_setting_color['carousel_arrow_color']:''; ?>" placeholder="<?php echo $entry_carousel_arrow_color; ?>" id="input-carousel_arrow_color" class="form-control" />  
                    <span class="input-group-addon"><i></i></span>              
                  </div>
                </div>
              </div>
            </fieldset>
          </div>
        </div> 
        </form> 
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$(function() { $('.colorpicker').colorpicker(); });
//--></script>
<?php echo $footer; ?>