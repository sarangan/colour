<?php echo $header; ?>
<div class="container">

  <div class="category-top-banner-wrapper">
    <h1 class="category-top-title"><?php echo $heading_title; ?></h1>
  </div>


  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

      <?php if ($products) { ?>

      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-6">
          <div class="product-thumb">

            <?php if ($product['special']) { ?>
              <span class="product-label label-sale">Sale</span>
            <?php }?>

            <?php
                  if(!$product['special']){
                    echo '<span class="product-label label-new">New</span>';
                  }
                  else{
                    echo '<span class="product-label label-new got-sale-label">New</span>';
                  }
            ?>

            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>

            <a class="product-overlay-link-wrapper" href="<?php echo $product['href']; ?>">
              <div class="product-overlay">

                  <div class="product-text">
                    <a href="<?php echo $product['href']; ?>" class="overlay-product-title"><?php echo $product['name']; ?></a>
                    <br/>
                    <?php echo $product['description']; ?>

                    <br/>
                    <?php if ($product['price']) { ?>
                    <p class="price">
                      <?php if (!$product['special']) { ?>
                      <span class="overlay-product-price"><?php echo $product['price']; ?></span>
                      <?php } else { ?>
                      <span class="overlay-product-price"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                      <?php } ?>
                      <?php if ($product['tax']) { ?>
                      <span class="overlay-product-price"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                      <?php } ?>
                    </p>
                    <?php } ?>

                  </div>

              </div>
            </a>

            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>" class="overlay-product-title"><?php echo $product['name']; ?></a></h4>

                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <div class="button-group">
                <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fas fa-exchange-alt"></i></button>
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
