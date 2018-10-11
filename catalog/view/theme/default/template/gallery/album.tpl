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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>


    <div class="category-top-banner-wrapper">
      <h1 class="category-top-title"><?php echo $heading_title; ?></h1>
    </div>

	<?php if ($gallerys) { ?>
      <div class="row">
        <?php foreach ($gallerys as $gallery) { ?>

          <div class="col-sm-3 col-xs-6">
            <a class="mablum-thumbnail" href="<?php echo $gallery['href']; ?>" title="<?php echo $gallery['title'] ?>">
              <img src="<?php echo $gallery['image']; ?>" title="<?php echo $gallery['title'] ?>" alt="<?php echo $gallery['title'] ?>"  style="width: 100%; height: auto;"/>
            </a>
            <h4 class="album-title"><?php echo $gallery['title'] ?></h4>
          </div>

          <!-- <div class="mtotal"><?php //echo $text_photos; ?> <?php //echo $gallery['total_photos']; ?> </div>
          <div class="malbum-viewed"><?php //echo $text_viewed; ?>: <?php //echo $gallery['viewed']; ?></div> -->


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
</div>
<style type="text/css">
  <?php if (!empty($gallery_setting_color['albumsapge_title_text'])) { ?>
  h2{
    color: <?php echo $gallery_setting_color['albumsapge_title_text']; ?>;
  }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['albums_detail_text'])) { ?>
  .mgallery-album .mablum .caption, .mgallery-album .mablum h4{
    color: <?php echo $gallery_setting_color['albums_detail_text']; ?>;
  }
  <?php } ?>
  <?php if (!empty($gallery_setting_color['albums_wrapbg'])) { ?>
  .mgallery-album .inner-mablum{
    background: <?php echo $gallery_setting_color['albums_wrapbg']; ?>;
  }
  <?php } ?>
</style>
<?php echo $footer; ?>
