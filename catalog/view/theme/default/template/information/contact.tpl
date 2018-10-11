<?php echo $header; ?>
<div class="container">
  <!-- <ul class="breadcrumb">
    <?php //foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php //echo $breadcrumb['href']; ?>"><?php //echo $breadcrumb['text']; ?></a></li>
    <?php //} ?>
  </ul> -->
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 class="category-top-title"><?php echo $heading_title; ?></h1>
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <?php if ($geocode)  {
          $geoarr = explode(',',$geocode);
          ?>
        <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank">
          <!-- <img src="image/catalog/images/location.png" alt="8 Kaki Bukit Rd 2" class="img-category-banner"/> -->
          <iframe src="<?php echo 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.730959630194!2d' . $geoarr[0] .'!3d'. $geoarr[1] .'!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMcKwMjAnMTUuNyJOIDEwM8KwNTMnNTQuMiJF!5e0!3m2!1sen!2ssg!4v1539223514247'; ?> " width="100%" height="auto" class="img-category-banner" frameborder="0" style="border:0" allowfullscreen></iframe>

        </a>
      <?php } else { ?>
        <img src="image/catalog/images/location.png" alt="8 Kaki Bukit Rd 2" class="img-category-banner"/>

      <?php } ?>
      </div>

      <!-- <h3><?php //echo $text_location; ?></h3> -->

      <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

        <div>
            <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                <strong>Address</strong>
            </div>
            <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
              <strong style="color:#f21371;"><?php echo $store; ?></strong><br/>
              <address class="contact-text">
                <?php echo $address; ?>
              </address>
            </div>
        </div>

        <div>
            <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                <strong><?php echo $text_telephone; ?></strong>
            </div>
            <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 contact-text">
              <?php echo $telephone; ?>
            </div>
        </div>

        <?php if ($fax) { ?>
          <div>
              <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                  <strong><?php echo $text_fax; ?></strong>
              </div>
              <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 contact-text">
                <?php echo $fax; ?>
              </div>
          </div>
        <?php } ?>

        <?php if ($comment) { ?>
          <div>
              <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                  <strong>Email</strong>
              </div>
              <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 contact-text">
                <a class="contact-text" href="mailto:<?php echo $comment; ?>" target="_top"><?php echo $comment; ?></a>
              </div>
          </div>
        <?php } ?>

      </div>

      <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
          <fieldset>
            <strong><?php echo $text_contact; ?></strong>

            <div class="row" style="margin-bottom:10px; margin-top: 10px;">
              <div class="col-sm-6 col-xs-12">
                <div class="required">
                    <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" placeholder="<?php echo $entry_name; ?>"/>
                    <?php if ($error_name) { ?>
                    <div class="text-danger"><?php echo $error_name; ?></div>
                    <?php } ?>
                </div>
              </div>

              <div class="col-sm-6 col-xs-12">
                <div class="required">
                    <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control"  placeholder="<?php echo $entry_email; ?>"/>
                    <?php if ($error_email) { ?>
                    <div class="text-danger"><?php echo $error_email; ?></div>
                    <?php } ?>
                </div>
              </div>
          </div>

            <div class="form-group required">
              <div class="col-sm-12">
                <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control" placeholder="<?php echo $entry_enquiry; ?>"><?php echo $enquiry; ?></textarea>
                <?php if ($error_enquiry) { ?>
                <div class="text-danger"><?php echo $error_enquiry; ?></div>
                <?php } ?>
              </div>
            </div>

            <?php echo $captcha; ?>

          </fieldset>

          <div class="buttons">
            <div>
              <input class="btn btn-primary button-colour contact-btn" type="submit" value="<?php echo $button_submit; ?>" />
              <input class="btn btn-primary button-colour contact-btn" type="reset" value="CLEAR" />
            </div>
          </div>

        </form>

      </div>


      <?php if ($locations && false) { ?>
      <h3><?php echo $text_store; ?></h3>
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
                <?php if ($location['image']) { ?>
                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                  <address>
                  <?php echo $location['address']; ?>
                  </address>
                  <?php if ($location['geocode']) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                  <?php echo $location['telephone']; ?><br />
                  <br />
                  <?php if ($location['fax']) { ?>
                  <strong><?php echo $text_fax; ?></strong><br>
                  <?php echo $location['fax']; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  <?php if ($location['open']) { ?>
                  <strong><?php echo $text_open; ?></strong><br />
                  <?php echo $location['open']; ?><br />
                  <br />
                  <?php } ?>
                  <?php if ($location['comment']) { ?>
                  <strong><?php echo $text_comment; ?></strong><br />
                  <?php echo $location['comment']; ?>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>



      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
