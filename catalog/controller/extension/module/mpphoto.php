<?php
class ControllerExtensionModuleMpphoto extends Controller {
	public function index($setting) {
		if($this->config->get('gallery_setting_status')) {
			$this->load->language('extension/module/mpphoto');
			static $module = 0;
			
			$this->load->model('gallery/photo');
			$this->load->model('tool/image');

			$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
			$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
			
			$this->document->addStyle('catalog/view/javascript/jquery/mgallery/style.css');
			$this->document->addStyle('catalog/view/javascript/jquery/mgallery/simplelightbox.css');
			$this->document->addScript('catalog/view/javascript/jquery/mgallery/simple-lightbox.js');

			$data['heading_title'] = isset($setting['photo_description'][$this->config->get('config_language_id')]['title']) ? $setting['photo_description'][$this->config->get('config_language_id')]['title'] : $this->language->get('heading_title');

			$data['limit'] = !empty($setting['limit']) ? $setting['limit'] : 5;
			$data['carousel'] = !empty($setting['carousel']) ? $setting['carousel'] : '';
			$data['extitle'] = !empty($setting['extitle']) ? $setting['extitle'] : '';

			$data['photos'] = array();

			if($data['carousel']) {
				$photos = $this->model_gallery_photo->getPhotosByGallery($setting['gallery_id']);
			} else {
				$photos = $this->model_gallery_photo->getPhotosByGallery($setting['gallery_id'], $setting['limit']);
			}
			
			foreach ($photos as $photo_info) {
				if ($photo_info['photo']) {
					$image = $this->model_tool_image->resize($photo_info['photo'], $setting['width'], $setting['height']);
					
					$popup = $this->model_tool_image->resize($photo_info['photo'], $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					
					$popup = $this->model_tool_image->resize('placeholder.png', $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
				}

				$data['photos'][] = array(
					'gallery_id'  	=> $photo_info['gallery_id'],
					'name'  		=> $photo_info['name'],
					'link'  		=> $photo_info['link'],
					'image'       	=> $image,
					'popup' 		=> $popup
				);					
			}

			$data['module'] = $module++;

			$data['gallery_setting_color'] = $this->config->get('gallery_setting_color'); 

			$data['text_view'] = $this->language->get('text_view');
			$data['view'] = $this->url->link('gallery/album_photo', '', true);

			if ($data['photos']) {
				if(VERSION < '2.2.0.0') {
					if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/photo.tpl')) {
						return $this->load->view($this->config->get('config_template') . '/template/module/photo.tpl', $data);
					} else {
						return $this->load->view('default/template/module/photo.tpl', $data);
					}
				} else if(VERSION == '2.2.0.0') {
					return $this->load->view('module/photo', $data);
				} else{
					return $this->load->view('extension/module/mpphoto', $data);
				}
			}
		}
	}
}