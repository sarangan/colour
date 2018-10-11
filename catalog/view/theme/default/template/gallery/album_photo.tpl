<?php echo $header; ?>
<div class="container gallery-photo">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> mgallery-wrap <?php echo $cursive_font ? 'mgallery-fonts' : ''; ?>"><?php echo $content_top; ?>   
      <h2><?php echo $heading_title; ?></h2>
	    <?php if ($gallerys) { ?>
	    	<div class="row">
		        <?php foreach ($gallerys as $gallery) { ?>
		        <div class="col-sm-12">
            <h3 class="mheading_title"><?php echo $gallery['title']; ?></h3>
            <?php if($display_description) { ?>
              <div class="mgallery_info">
						    <?php echo $gallery['top_description']; ?>
              </div>
            <?php } ?>
						<div class="mgallery">
						<?php foreach ($gallery['photos'] as $photo) { ?>
							<div class="image-col">
		    				<div class="image-incol">
		    					<div class="image">
										<img src="<?php echo $photo['image']; ?>" title="<?php echo $photo['name']; ?>" alt="<?php echo $photo['name']; ?>" />
									</div>
									<span class="mgallery-caption left-to-right">
			    					<?php if($photo['link']) { ?>
                      <h5><a href="<?php echo $photo['link']; ?>"><?php echo $photo['name']; ?></a></h5>
                    <?php } else { ?>
                      <h5><?php echo $photo['name']; ?></h5>
                    <?php } ?>
			    					<div class="mgallery-popup">
			    						<a href="<?php echo $photo['popup']; ?>"><i class="fa fa-search-plus" aria-hidden="true"></i></a>
			    					</div>
			    				</span>
								</div>					
							</div>	
						<?php } ?>
						</div>	
					</div>
		        <?php } ?>
	    	</div>
	    <?php } else { ?>  
      <p class="text-center"><?php echo $text_no_results; ?></p>
      <?php } ?>
    <br/>
    <div class="row">
      <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
      <div class="col-sm-6 text-right"><?php echo $results; ?></div>
    </div>
		<?php echo $content_bottom; ?></div>
  	<?php echo $column_right; ?></div>
<script type="text/javascript"><!--
$(function(){
    var $gallery = $('.mgallery-popup a').simpleLightbox();

    $gallery.on('show.simplelightbox', function(){
      console.log('Requested for showing');
    })
    .on('shown.simplelightbox', function(){
      console.log('Shown');
    })
    .on('close.simplelightbox', function(){
      console.log('Requested for closing');
    })
    .on('closed.simplelightbox', function(){
      console.log('Closed');
    })
    .on('change.simplelightbox', function(){
      console.log('Requested for change');
    })
    .on('next.simplelightbox', function(){
      console.log('Requested for next');
    })
    .on('prev.simplelightbox', function(){
      console.log('Requested for prev');
    })
    .on('nextImageLoaded.simplelightbox', function(){
      console.log('Next image loaded');
    })
    .on('prevImageLoaded.simplelightbox', function(){
      console.log('Prev image loaded');
    })
    .on('changed.simplelightbox', function(){
      console.log('Image changed');
    })
    .on('nextDone.simplelightbox', function(){
      console.log('Image changed to next');
    })
    .on('prevDone.simplelightbox', function(){
      console.log('Image changed to prev');
    })
    .on('error.simplelightbox', function(e){
      console.log('No image found, go to the next/prev');
      console.log(e);
    });
  });
//--></script>
</div>
<style type="text/css">
  <?php if (!empty($gallery_setting_color['title_text'])) { ?>
    .mgallery-wrap h2{
      color: <?php echo $gallery_setting_color['title_text']; ?>;
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['album_title_bg'])) { ?>
    .mgallery-wrap .mheading_title{
      background: <?php echo $gallery_setting_color['album_title_bg']; ?>;
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['albumtitle_text'])) { ?>
    .mgallery-wrap .mheading_title{
      color: <?php echo $gallery_setting_color['albumtitle_text']; ?>;
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['photo_hoverbg_color'])) { ?>
    .mgallery .mgallery-caption{
      background: <?php echo $gallery_setting_color['photo_hoverbg_color']; ?>;  
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['photo_tilte_color'])) { ?>
    .mgallery .image-col h5 a, .mgallery .image-col .mgallery-caption h5{
      color: <?php echo $gallery_setting_color['photo_tilte_color']; ?>;  
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['photo_zoomicon_color'])) { ?>
    .mgallery .mgallery-caption .mgallery-popup i{
      color: <?php echo $gallery_setting_color['photo_zoomicon_color']; ?>;
    }
  <?php } ?>
</style>
<?php echo $footer; ?>