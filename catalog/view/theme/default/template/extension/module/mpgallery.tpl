<div class="mgallery mgallery-ext-ablum" id="mgallery-<?php echo $module; ?>">
  <?php if($extitle) { ?>
  <h3 class="mheading_title">
    <span><?php echo $heading_title; ?></span>
    <a href="<?php echo $view; ?>"><?php echo $text_view; ?></a>
  </h3>
  <?php } ?>
  <?php if($carousel) { ?>
  <div id="malbum-carousel<?php echo $module; ?>" class="owl-carousel malbum-carousel mgallery clearfix">
    <?php foreach ($gallerys as $gallery) { ?>
      <div class="mgallery-layout">
        <div class="mgallery-thumb transition clearfix">
          <div class="image"><a class="" href="<?php echo $gallery['href']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $gallery['thumb']; ?>" class="img-responsive" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>      
          <div class="caption">
            <h4><?php echo $gallery['title']; ?></h4>
            <div class="mtotal"><?php echo $gallery['total_photos']; ?> <?php echo $text_photos; ?></div>
            <div class="malbum-viewed"><?php echo $text_viewed; ?>: <?php echo $gallery['viewed']; ?></div>
          </div>
        </div>
      </div>
    <?php } ?>
  </div>
  <?php } else { ?>
  <div class="mgallery-sub">
    <div class="mgallery malbum-nocarousel clearfix">
      <?php foreach ($gallerys as $gallery) { ?>
        <div class="mgallery-layout ">
          <div class="mgallery-thumb transition clearfix">
            <div class="image"><a class="" href="<?php echo $gallery['href']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $gallery['thumb']; ?>" class="img-responsive" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>      
            <div class="caption">
              <h4><?php echo $gallery['title']; ?></h4>
              <div class="mtotal"><?php echo $text_photos; ?> <?php echo $gallery['total_photos']; ?> </div>
              <div class="malbum-viewed"><?php echo $text_viewed; ?>: <?php echo $gallery['viewed']; ?></div>
            </div>
          </div>
        </div>
      <?php } ?>
    </div>
  </div>
  <?php } ?>
</div>
<style type="text/css">
  <?php if (!empty($gallery_setting_color['albums_detail_text'])) { ?>
    #mgallery-<?php echo $module; ?>.mgallery .caption, .mgallery .caption h4{
      color: <?php echo $gallery_setting_color['albums_detail_text']; ?>;
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['albums_wrapbg'])) { ?>
    #mgallery-<?php echo $module; ?>.mgallery .mgallery-thumb{
      background: <?php echo $gallery_setting_color['albums_wrapbg']; ?>;
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['extitle_bgcolor'])) { ?>
    #mgallery-<?php echo $module; ?>.mgallery .mheading_title span{
      background: <?php echo $gallery_setting_color['extitle_bgcolor']; ?>; 
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['extitle_textcolor'])) { ?>
    #mgallery-<?php echo $module; ?>.mgallery .mheading_title span{
      color: <?php echo $gallery_setting_color['extitle_textcolor']; ?>; 
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['extitle_bordercolor'])) { ?>
    #mgallery-<?php echo $module; ?> .mgallery-wrap .mheading_title, .mgallery .mheading_title{
      border-color: <?php echo $gallery_setting_color['extitle_bordercolor']; ?>; 
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['exview_all_color'])) { ?>
    #mgallery-<?php echo $module; ?>.mgallery .mheading_title a{
      color: <?php echo $gallery_setting_color['exview_all_color']; ?>; 
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['carousel_arrow_bgcolor'])) { ?>
    #mgallery-<?php echo $module; ?> .malbum-carousel .owl-controls .owl-buttons [class*="owl-"], #mgallery-<?php echo $module; ?> .mphoto-carousel .owl-controls .owl-buttons [class*="owl-"]{
      background: <?php echo $gallery_setting_color['carousel_arrow_bgcolor']; ?>; 
    }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['carousel_arrow_color'])) { ?>
    #mgallery-<?php echo $module; ?> .malbum-carousel .owl-controls .owl-buttons i, #mgallery-<?php echo $module; ?> .mphoto-carousel .owl-controls .owl-buttons i{
      color: <?php echo $gallery_setting_color['carousel_arrow_color']; ?>; 
    }
  <?php } ?>
</style>
<?php if($carousel) { ?>
<script type="text/javascript"><!--
$('#malbum-carousel<?php echo $module; ?>').owlCarousel({
  items: '<?php echo $limit; ?>',
  autoPlay: 2000,
  loop:true,
  navigation: true,
  navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
  pagination: false,
  responsive : {
    0 : {
        items: 1
    },
    480 : {
        items: 2
    },
    768 : {
        items: 2
    }
  }
});
--></script>
<?php } ?>