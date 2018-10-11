<div class="m-menu-tabs">
  <ul class="list-inline clearfix">      
    <li>
        <a rel="extension_menu" href="<?php echo $extension; ?>" data-tab="#tab-general" class="extension_menu">
            <i class="fa fa-puzzle-piece fw" aria-hidden="true"></i>
            <span><?php echo $text_extension; ?></span>
        </a>
    <li>
        <a href="<?php echo $msetting; ?>" data-tab="#tab-general" class="setting_menu">
            <i class="fa fa-cog" aria-hidden="true"></i>
            <span><?php echo $text_settings; ?></span>
        </a>
    </li>
    </li>
    <li>
    	<a href="<?php echo $add; ?>" class="new_menu">
	    	<i class="fa fa-plus" aria-hidden="true"></i>
	    	<span><?php echo $text_add_menu; ?></span>
	    </a>
    </li>    
    <li>
        <a href="<?php echo $list; ?>" class="menu_list">
            <i class="fa fa-list" aria-hidden="true"></i> 
            <span><?php echo $text_menu_list; ?></span>
        </a>
    </li>
  </ul>
</div>
<script type="text/javascript">
$(document).ready(function() {
    // Set last page opened on the menu
    var extension_menu = '<?php echo $extension_menu; ?>';
    if(extension_menu) {
        sessionStorage.setItem('gallery_tabs', $('.extension_menu').attr('href'));
    }

    var list_menu = '<?php echo $list_menu; ?>';
    if(list_menu) {
        sessionStorage.setItem('gallery_tabs', $('.menu_list').attr('href'));
    }

    var setting_menu = '<?php echo $setting_menu; ?>';
    if(setting_menu) {
        sessionStorage.setItem('gallery_tabs', $('.setting_menu').attr('href'));
    }

    var new_menu = '<?php echo $new_menu; ?>';
    if(new_menu) {
        sessionStorage.setItem('gallery_tabs', $('.new_menu').attr('href'));
    }


    $('.m-menu-tabs a[href]').on('click', function() {
        sessionStorage.setItem('gallery_tabs', $(this).attr('href'));
    });

    if (!sessionStorage.getItem('gallery_tabs')) {
        $('.m-menu-tabs a').first().addClass('active');
    } else {
        $('.m-menu-tabs a[href=\'' + sessionStorage.getItem('gallery_tabs') + '\']').parents('li').addClass('active');
    }


    <?php if($color_tab) { ?>
    $('a[href="#tab-colors"]').trigger('click');
    <?php } ?>
  
    $('.settings-nav-tabs a').on('click', function() {
        var href = $(this).attr('href');
        $('.m-menu-tabs ul > li').removeClass('active');
        $.each($('.m-menu-tabs ul > li'), function() {
            var tab = $(this).find('a').attr('data-tab');
            if(tab==href) {
                $(this).addClass('active');
            }
        });
    });

});
</script>