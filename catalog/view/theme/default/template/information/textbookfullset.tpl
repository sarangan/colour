<?php echo $header; ?>
<div class="container">
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


      <form action="<?php echo $action; ?>" method="post" accept-charset="utf-8" enctype="multipart/form-data" class="form-horizontal">
        <div class="row div-extra-wrapper">

          <div class="col-sm-1">
            <strong>School</strong>
          </div>

          <div class="col-sm-6">
              <select name="input-search-school" id="input-search-school" class="form-control no-radious">
                <?php
                   foreach ($schools as $school) { ?>
                      <option value="<?php echo $school['filter_id']; ?>" <?php echo $school['filter_id'] == $input_school ? 'selected="selected"' : ''; ?>><?php echo $school['name']; ?>
                      </option>
                <?php } ?>
              </select>
          </div>

        </div>

        <div class="row div-extra-wrapper">

          <div class="col-sm-1">
            <strong>Levels</strong>
          </div>

          <div class="col-sm-6">
              <select name="input-search-level" id="input-search-level" class="form-control no-radious">
                <option value="---">---</option>
                <?php
                   foreach ($levels as $level) { ?>
                      <option value="<?php echo $level['filter_id']; ?>" <?php echo $level['filter_id'] == $input_level ? 'selected="selected"' : ''; ?>><?php echo $level['name']; ?>
                      </option>
                <?php } ?>
              </select>
          </div>

        </div>

        <div class="row div-extra-wrapper">

          <div class="col-sm-1">
            <strong>Streams</strong>
          </div>

          <div class="col-sm-6">
              <select name="input-search-stream" id="input-search-stream" class="form-control no-radious" >
                <option value="---">---</option>
                <?php
                   foreach ($streams as $stream) { ?>
                      <option value="<?php echo $stream['filter_id']; ?>" <?php echo $stream['filter_id'] == $input_stream ? 'selected="selected"' : ''; ?>><?php echo $stream['name']; ?>
                      </option>
                <?php } ?>
              </select>
          </div>

        </div>

        <div class="row div-extra-wrapper">
          <div class="col-sm-1">
          </div>
          <div class="col-sm-3">
            <button type="submit" class="button-colour" style="width: 100%; padding: 7px;">Search</button>
          </div>

        </div>

      </form>


      <div class="row div-extra-wrapper">

        <table class="table">

          <thead>
            <tr>
              <td><strong>Select all</strong></td>
              <td><strong>Subject</strong></td>
              <td><strong>Tittle of book</strong></td>
              <td><strong>Publisher</strong></td>
              <td><strong>Price</strong></td>
            </tr>
          </thead>

          <tbody>

            <?php foreach ($products as $product) { ?>
              <tr>
                <td>check</td>
                <td><?php echo $product['jan']; ?></td>
                <td><?php echo $product['location']; ?></td>
                <td><?php echo $product['name']; ?></td>
                <td><?php echo $product['mpn']; ?></td>
                <td>
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
                <td>
              </tr>
            <?php } ?>
          </tbody>
  
        </table>


      </div>



      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<?php echo $footer; ?>
