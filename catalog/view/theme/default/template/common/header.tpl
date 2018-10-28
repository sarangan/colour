<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600,700,800" rel="stylesheet">


<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>

<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>

<script src="catalog/view/javascript/common.js" type="text/javascript"></script>

<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

<!--link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" /-->
<!-- <link href="catalog/view/javascript/font-awesome2/css/all.min.css" rel="stylesheet" type="text/css" /> -->
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>



<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<script>

function toggleSearch(){
  var element = document.getElementById("menu-search-box");
  element.classList.toggle("searchbox-open");
}

</script>
<body class="<?php echo $class; ?>">
<nav id="top">
  <div class="container">
      <span class="top-bar-text hidden-xs">FREE SHIPPING OVER SGD200</span>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li><a href='#'><span class="top-bar-text">FACEBOOK</span></a></li>
        <li><span class="top-bar-text hidden-xs">|</span></li>
        <li><a href='#'><span class="top-bar-text">INSTAGRAM</span></a></li>
      </ul>
    </div>
  </div>
</nav>
<header>

  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
    </div>
  </div>


</header>
<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">

        <li><a href="<?php echo $link_new_arrivals; ?>">New arrivals</a></li>

        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Products</a>

          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <ul class="list-unstyled">
                <?php

                foreach ($categories as $category) {

                    if( !empty($category['filter']) ){

                      $filter_name = $category['filter'][0]['filter'][0]['name'];

                          if( strtoupper($filter_name) == strtoupper("Products") ){

                                  if (!empty($category['name']) ) { ?>

                                  <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                      <?php
                                }

                          }

                        }
              } ?>
              </ul>
            </div>
        </li>

        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Education Material</a>


          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <ul class="list-unstyled">
                <?php

                foreach ($categories as $category) {

                    if( !empty($category['filter']) ){

                      $filter_name = $category['filter'][0]['filter'][0]['name'];

                          if( strtoupper($filter_name) == strtoupper("Education Material") ){

                                  if (!empty($category['name']) ) { ?>

                                  <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                      <?php
                                }

                          }

                        }
              } ?>

                <li><a href="<?php echo $textbook_fullset; ?>">Textbook full set</a></li>
              </ul>
            </div>
          </div>




        </li>

        <li><a href="<?php echo $link_promotion; ?>">Promotions</a></li>
        <li><a href="<?php echo $link_gallery; ?>">Gallery</a></li>

        <?php if(false){ ?>
        <?php foreach ($categories as $category ) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>

        <?php } ?>


      </ul>

      <div class="top-action-menu"><img src="image/catalog/images/menu-search.png" class="menu-search-icon"  onclick="toggleSearch()"/>

        <div class="col-sm-4 search-box" id="menu-search-box"><?php echo $search; ?>
        </div>

      </div>
      <div class="top-action-menu"><?php echo $cart; ?></div>

    </div>



  </nav>
</div>
<?php } ?>
