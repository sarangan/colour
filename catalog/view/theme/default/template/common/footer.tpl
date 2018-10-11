<footer>
  <div class="container" style="padding-top: 50px;">

    <div class="footer-div">

        <div class="row">
          <?php if ($informations) { ?>
          <div class="col-sm-4 footer-right-bar">
            <h5><?php //echo $text_information; ?></h5>
            <ul class="list-unstyled">
              <?php foreach ($informations as $information) { ?>
              <li class="footer-txt-block"><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
              <?php } ?>
            </ul>
          </div>
          <?php } ?>
          <div class="col-sm-4 footer-right-bar">
            <h5><?php //echo $text_service; ?></h5>
            <ul class="list-unstyled">
              <li class="footer-txt-block"><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
              <li class="footer-txt-block"><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
              <li class="footer-txt-block"><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
              <li class="footer-txt-block"><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
            </ul>
          </div>
          <div class="col-sm-4">
            <h5><?php //echo $text_account; ?></h5>
            <ul class="list-unstyled">

              <li class="footer-txt-block"><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                <li class="footer-txt-block"><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                <li  class="footer-txt-block"><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                <li  class="footer-txt-block"><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            </ul>
          </div>
        </div>

  </div>

    <!-- <hr> -->

    <div class="footer-bottom-wrapper"> <span><?php echo $powered; ?></span><span class="pull-right footer-payment-icons"><i class="fab fa-cc-visa"></i> <i class="fab fa-cc-mastercard"></i> <i class="fab fa-cc-paypal"></i> <i class="fab fa-cc-amex"></i></span></div>

  </div>
</footer>


</body></html>
