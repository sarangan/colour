<?php
class ControllerExtensionModuleMpgallery extends Controller {
	public function index($setting) {
		if($this->config->get('gallery_setting_status')) {
			$this->load->language('extension/module/mpgallery');
			static $module = 0;

			$data['text_photos'] = $this->language->get('text_photos');
			$data['text_viewed'] = $this->language->get('text_viewed');
			
			$this->load->model('gallery/album');
			$this->load->model('tool/image');

			$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
			$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
			
			$this->document->addStyle('catalog/view/javascript/jquery/mgallery/style.css');
			$this->document->addStyle('catalog/view/javascript/jquery/mgallery/simplelightbox.css');
			$this->document->addScript('catalog/view/javascript/jquery/mgallery/simple-lightbox.js');

			$data['heading_title'] = isset($setting['gall_description'][$this->config->get('config_language_id')]['title']) ? $setting['gall_description'][$this->config->get('config_language_id')]['title'] : $this->language->get('heading_title');

			$data['gallerys'] = array();

			$data['limit'] = !empty($setting['limit']) ? $setting['limit'] : 5;
			$data['carousel'] = !empty($setting['carousel']) ? $setting['carousel'] : '';
			$data['extitle'] = !empty($setting['extitle']) ? $setting['extitle'] : '';	


			if(!empty($data['carousel'])) {
				$gallerys = $setting['gallery'];
			} else {
				if($setting['limit']) {
					$gallerys = array_slice($setting['gallery'], 0, (int)$setting['limit']);
				} else{
					$gallerys = $setting['gallery'];
				}
			}

			if($gallerys) {
				foreach ($gallerys as $gallery_id) {
					$gallery_info = $this->model_gallery_album->getGalleryinfo($gallery_id);
					if ($gallery_info) {
						if ($gallery_info['image']) {
							$image = $this->model_tool_image->resize($gallery_info['image'], $setting['width'], $setting['height']);
							$popup = $this->model_tool_image->resize($gallery_info['image'], $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
							$popup = $this->model_tool_image->resize('placeholder.png', $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
						}
						
						$data['gallerys'][] = array(
							'gallery_id'  => $gallery_info['gallery_id'],
							'viewed'  	  => $gallery_info['viewed'],
							'thumb'       => $image,
							'popup'       => $popup,
							'title'        => $gallery_info['title'],
							'total_photos' => $this->model_gallery_album->getTotalGalleryPhotos($gallery_id),
							'description' => utf8_substr(strip_tags(html_entity_decode($gallery_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_gallery_description_length')) . '..',						
							'href'        => $this->url->link('gallery/photo', 'gallery_id=' . $gallery_info['gallery_id'])
						);
					}
				}
			}
			
			$data['module'] = $module++;

			$data['gallery_setting_color'] = $this->config->get('gallery_setting_color'); 

			$data['text_view'] = $this->language->get('text_view');
			$data['view'] = $this->url->link('gallery/album', '', true);

			if ($data['gallerys']) {
				if(VERSION < '2.2.0.0') {
					if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/gallery.tpl')) {
						return $this->load->view($this->config->get('config_template') . '/template/module/gallery.tpl', $data);
					} else {
						return $this->load->view('default/template/module/gallery.tpl', $data);
					}
				} else if(VERSION == '2.2.0.0') {
					return $this->load->view('module/gallery', $data);
				} else{
					return $this->load->view('extension/module/mpgallery', $data);
				}
			}
		}
	}
}