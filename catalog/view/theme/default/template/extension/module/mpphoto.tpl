<div class="mgallery" id="mphoto<?php echo $module; ?>">
  <?php if($extitle) { ?>
  <h3 class="mheading_title">
    <span><?php echo $heading_title; ?></span>
    <a href="<?php echo $view; ?>"><?php echo $text_view; ?></a>
  </h3>
  <?php } ?>
  <?php if($carousel) { ?>
    <div id="mphoto-carousel<?php echo $module; ?>" class="owl-carousel mphoto-carousel mgallery clearfix">  
      <?php foreach ($photos as $photo) { ?>
      <div class="mgallery-thumb transition">
        <div class="image-col">
          <div class="image-incol">
            <div class="image">
              <a title="<?php echo $photo['name']; ?>"> <img src="<?php echo $photo['image']; ?>" class="img-responsive" title="<?php echo $photo['name']; ?>" alt="<?php echo $photo['name']; ?>" /></a>
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
      </div>
    <?php } ?>  
    </div>
  <?php } else { ?>
  <div class="mgallery-sub">
    <?php foreach ($photos as $photo) { ?>
      <div class="mgallery-thumb transition">
        <div class="image-col">
          <div class="image-incol">
            <div class="image">
              <a title="<?php echo $photo['name']; ?>"> <img src="<?php echo $photo['image']; ?>" class="img-responsive" title="<?php echo $photo['name']; ?>" alt="<?php echo $photo['name']; ?>" /></a>
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
              <div class="mgallery-share hide">
                <i class="fa fa-facebook" aria-hidden="true"></i>
                <i class="fa fa-twitter" aria-hidden="true"></i>
                <i class="fa fa-instagram" aria-hidden="true"></i>
              </div>
            </span>
          </div>      
        </div> 
      </div>
    <?php } ?>
  </div>
  <?php } ?>
</div>  
<style type="text/css">
  <?php if (!empty($gallery_setting_color['photo_hoverbg_color'])) { ?>
    #mphoto<?php echo $module; ?>.mgallery .mgallery-caption{
      background: <?php echo $gallery_setting_color['photo_hoverbg_color']; ?>;  
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['photo_tilte_color'])) { ?>
    #mphoto<?php echo $module; ?>.mgallery .image-col h5 a, #mphoto<?php echo $module; ?>.mgallery .image-col h5{
      color: <?php echo $gallery_setting_color['photo_tilte_color']; ?>;  
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['photo_zoomicon_color'])) { ?>
    #mphoto<?php echo $module; ?>.mgallery .mgallery-caption .mgallery-popup i{
      color: <?php echo $gallery_setting_color['photo_zoomicon_color']; ?>;
    }
  <?php } ?>

  <?php if (!empty($gallery_setting_color['extitle_bgcolor'])) { ?>
    #mphoto<?php echo $module; ?>.mgallery .mheading_title span{
      background: <?php echo $gallery_setting_color['extitle_bgcolor']; ?>; 
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['extitle_textcolor'])) { ?>
    #mphoto<?php echo $module; ?>.mgallery .mheading_title span{
      color: <?php echo $gallery_setting_color['extitle_textcolor']; ?>; 
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['extitle_bordercolor'])) { ?>
    #mphoto<?php echo $module; ?> .mgallery-wrap .mheading_title, .mgallery .mheading_title{
      border-color: <?php echo $gallery_setting_color['extitle_bordercolor']; ?>; 
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['exview_all_color'])) { ?>
    #mphoto<?php echo $module; ?>.mgallery .mheading_title a{
      color: <?php echo $gallery_setting_color['exview_all_color']; ?>; 
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['carousel_arrow_bgcolor'])) { ?>
    #mphoto<?php echo $module; ?> .malbum-carousel .owl-controls .owl-buttons [class*="owl-"], #mphoto<?php echo $module; ?> .mphoto-carousel .owl-controls .owl-buttons [class*="owl-"]{
      background: <?php echo $gallery_setting_color['carousel_arrow_bgcolor']; ?>; 
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['carousel_arrow_color'])) { ?>
    #mphoto<?php echo $module; ?> .malbum-carousel .owl-controls .owl-buttons i, #mphoto<?php echo $module; ?> .mphoto-carousel .owl-controls .owl-buttons i{
      color: <?php echo $gallery_setting_color['carousel_arrow_color']; ?>; 
    }
  <?php } ?>
</style>
<?php if($carousel) { ?>
<script type="text/javascript"><!--
$('#mphoto-carousel<?php echo $module; ?>').owlCarousel({
  items: '<?php echo $limit; ?>',
	autoPlay: 2000,
	loop:true,
  navigation: true,
	navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
	pagination: false,
  responsive : {
    0 : {
        items: 2
    },
    480 : {
        items: 3
    },
    640 : {
        items: 3
    },
    768 : {
        items: 4
    }
  }
});
--></script>
<?php } ?>

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
--></script>