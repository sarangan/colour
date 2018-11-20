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

      <form method="post" action="<?php echo $post_action; ?>">
      <div class="row div-extra-wrapper-table">

        <?php if($products && count($products)) { ?>

            <table class="table textbookfullset-tbl">

              <thead>
                <tr>
                  <td><strong><input type="checkbox" name="textbookfullset_selectall" id="textbookfullset_selectall"></strong></td>
                  <td><strong>Subject</strong></td>
                  <td><strong>Tittle of book</strong></td>
                  <td><strong>Publisher</strong></td>
                  <td><strong>Price</strong></td>
                </tr>
              </thead>

              <tbody>

                <?php foreach ($products as $product) { ?>
                  <tr>
                    <td>
                      <?php
                      $product_price = 0;
                      if ($product['price']) {
                        if (!$product['special']) {
                          $product_price = $product['price'];
                        }
                        else{
                          $product_price = $product['special'];
                        }
                      }
                      ?>
                      <input type="checkbox" class="textbookfullsetchks" name="textbookfullsetchk[]" value="<?php echo $product['product_id']  . ';'.  $product_price ; ?>">
                    </td>
                    <td><?php echo $product['subject']; ?></td>
                    <td><?php echo $product['name']; ?></td>
                    <td><?php echo $product['publisher']; ?></td>
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

          <?php } ?>


      </div>

      <div class="row div-extra-wrapper">

        <?php if($products && count($products)) { ?>
            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
              <strong>Total Price :</strong> <span id="total-price-textbookfullset">0</span>
            </div>

            <div class="col-sm-3 pull-right">

                <button type="submit" id="btn-add-cart-textbook-fullset" class="button-colour button-colour-secondary" style="width: 100%; padding: 7px;">Add to cart</button>

            </div>

        <?php }
            else{
         ?>

         <div class="col-sm-12">
           <strong>Please redefine your search!</strong>
         </div>

         <?php
              }
          ?>


      </div>

        </form>


      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>

<script>

$(function() {

  var selected_checkboxes = [];

  $("#textbookfullset_selectall").click(function () {
     //$(".textbookfullsetchks").prop('checked', $(this).prop('checked'));

     var status = this.checked; // "select all" checked status
      $('.textbookfullsetchks').each(function(){ //iterate all listed checkbox items
          this.checked = status; //change ".checkbox" checked status
          var chk_value = $(this).val() || '';
          if(chk_value){
            if(status){
              selectAllCkh(chk_value);
            }
            else{
              deSelectAllChk(chk_value);
            }
          }

      });

        //console.log(selected_checkboxes);

 });

 $(".textbookfullsetchks").change(function() {

   var chk_value = $(this).val() || '';
   if(chk_value){

     if(this.checked) {
       selectAllCkh(chk_value);
     }
     else{
       deSelectAllChk(chk_value);
     }

   }

    //console.log(selected_checkboxes);
  });


  /*$('#btn-add-cart-textbook-fullset').click(function() {

    // for(var i = 0, l = selected_checkboxes.length; i < l ; i++ ){
    //   //cart.add( selected_checkboxes[i].id.toString() , 1);
    //
    // }

    var product_ids = [];
    for(var i = 0, l = selected_checkboxes.length; i < l ; i++ ){
      product_ids.push( selected_checkboxes[i].id );
    }
    console.log(product_ids);
    cart.addbulk(product_ids);
  });*/


  function selectAllCkh(chk_value){
    var chk_arr_val =  chk_value.split(';');
    if(Array.isArray(chk_arr_val) ){
      var chk_product_id = chk_arr_val[0];
      var chk_product_price = chk_arr_val[1];

      if(chk_product_id){
        var add_ok = true;
        for(var i = 0, l = selected_checkboxes.length; i < l ; i++ ){

          if(selected_checkboxes[i].id == chk_product_id){
            add_ok = false;
            break;
          }

        }
        if(add_ok){

          selected_checkboxes.push(
            {
              id: chk_product_id,
              price: chk_product_price
            }
          );

          calculateTotal(chk_product_price);

        }
      }

    }

  }


  function deSelectAllChk(chk_value){

    for(var i = 0, l = selected_checkboxes.length; i < l ; i++ ){
        var chk_arr_val =  chk_value.split(';');
        if(Array.isArray(chk_arr_val) ){
          var chk_product_id = chk_arr_val[0];

          if(selected_checkboxes[i].id == chk_product_id){
            selected_checkboxes.splice(i, 1);
            calculateTotal();
            break;
          }

        }

    }

  }


  function calculateTotal(){
    var total_price = 0;
    for(var i = 0, l = selected_checkboxes.length; i < l ; i++ ){
      total_price += Number(selected_checkboxes[i].price.replace('$', '') );
    }

    $('#total-price-textbookfullset').text(total_price.toFixed(2));

  }



});


</script>

<?php echo $footer; ?>
