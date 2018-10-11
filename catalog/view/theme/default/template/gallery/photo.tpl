<?php echo $header; ?>
<div class="container">
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
    <div id="content" class="<?php echo $class; ?> <?php echo $cursive_font ? 'mgallery-fonts' : ''; ?>"><?php echo $content_top; ?>

      <div class="category-top-banner-wrapper">
        <h1 class="category-top-title"><?php echo $heading_title; ?></h1>
      </div>

    	<!-- <h3 class="mheading_title"><?php //echo $heading_title; ?></h3>
  		<div class="mgallery_info"><?php //echo $top_description; ?></div> -->

      <?php if($social_status) { ?>
      <div class="row">
        <div class="col-sm-12 col-xs-12">
          <div class="mgallery-share">
            <h3><?php echo $text_share; ?></h3>
            <!-- AddThis Button BEGIN -->
            <div class="sharethis-inline-share-buttons"></div>
            <script type="text/javascript" src="//platform-api.sharethis.com/js/sharethis.js#property=5a2534c91b1181001358780e&product=inline-share-buttons"></script>
            <!-- AddThis Button END -->
          </div>
        </div>
      </div>
      <?php } ?>

    	<div class="row">
				<?php if ($photos) { ?>
    		<?php foreach ($photos as $photo) { ?>

          <div class="col-sm-3 col-xs-6">
            <a title="<?php echo $photo['name']; ?>">
              <img src="<?php echo $photo['thumb']; ?>" class="img-responsive" title="<?php echo $photo['name']; ?>" alt="<?php echo $photo['name']; ?>" />
            </a>
            <div class="mgallery-popup">
              <a href="<?php echo $photo['popup']; ?>" class="popup-gallery-overlay"></a>
            </div>
            <!-- <i class="fa fa-search-plus" aria-hidden="true"></i> -->

              <?php if($photo['link']) { ?>
                <a href="<?php echo $photo['link']; ?>"><h4 class="album-title"></h4></a>
              <?php } else { ?>
                  <h4 class="album-title"><?php echo $photo['name']; ?></h4>
              <?php } ?>

          </div>


    		<?php } ?>
     		<?php } ?>
		</div>


		<!-- <div class="mgallery_info"><?php //echo $bottom_description; ?></div> -->

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
    .mheading_title{
      color: <?php echo $gallery_setting_color['title_text']; ?>;
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
  <?php if (!empty($gallery_setting_color['sharethis_bg'])) { ?>
    .mgallery-share{
      background: <?php echo $gallery_setting_color['sharethis_bg']; ?>;
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['sharethis_color'])) { ?>
    .mgallery-share h3{
      color: <?php echo $gallery_setting_color['sharethis_color']; ?>;
    }
  <?php } ?>
</style>
<?php echo $footer; ?>
