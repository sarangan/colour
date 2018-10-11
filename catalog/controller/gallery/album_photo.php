<?php
class ControllerGalleryAlbumphoto extends Controller {
	private $error = array();

	public function index() {
		if($this->config->get('gallery_setting_status')) {
			$this->load->language('gallery/album_photo');
			
			$this->load->model('gallery/photo');

			$this->load->model('gallery/album');
			
			$this->load->model('tool/image');

			$this->document->setTitle($this->language->get('heading_title'));	

			$this->document->addStyle('catalog/view/javascript/jquery/mgallery/style.css');
			$this->document->addStyle('catalog/view/javascript/jquery/mgallery/simplelightbox.css');
			$this->document->addScript('catalog/view/javascript/jquery/mgallery/simple-lightbox.js');

			if ($this->request->server['HTTPS']) {
				$server = $this->config->get('config_ssl');
			} else {
				$server = $this->config->get('config_url');
			}

			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}

			if ($this->config->get('gallery_setting_albumphoto_limit')) {
				$limit = $this->config->get('gallery_setting_albumphoto_limit');
			} else {
				$limit = 20;
			}
			
			$data['heading_title'] = $this->language->get('heading_title');
			$data['text_no_results'] = $this->language->get('text_no_results');

			$data['display_description'] = $this->config->get('gallery_setting_albumphoto_description');
			$data['cursive_font'] = $this->config->get('gallery_setting_albumphoto_cursive_font');

			$data['breadcrumbs'] = array();
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
			);

			$url = '';			
				
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('gallery/album_photo', $url)
			);	

			$this->load->model('tool/image');
			
			$data['gallerys'] = array();
			
			$filter_data = array(
				'start' => ($page - 1) * $limit,
				'limit' => $limit,
			);
			
			$data['gallerys'] = array();
				
			$gallery_total = $this->model_gallery_album->getTotalGallerys($filter_data);
			$gallery_info = $this->model_gallery_album->getGallery($filter_data);

			foreach ($gallery_info as $album) {
				if($album['width']) {
					$width = $album['width'];
				} else {
					$width = $this->config->get('gallery_setting_albumphoto_width');
				}

				if($album['width']) {
					$height = $album['height'];
				} else {
					$height = $this->config->get('gallery_setting_albumphoto_height');
				}

				$gallery_photos = $this->model_gallery_photo->getAlbumPhotoDescription($album['gallery_id']);
				$photos = array();
				$highlight = false;
				foreach($gallery_photos as $gallery_photo) {
					if($gallery_photo['highlight'] && $highlight == false) {
						if ($gallery_photo['photo']) {
							$image = $this->model_tool_image->resize($gallery_photo['photo'], $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
							$popup = $this->model_tool_image->resize($gallery_photo['photo'], $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
							$popup = $this->model_tool_image->resize('placeholder.png', $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
						}

						$highlight = true;
					} else {
						if ($gallery_photo['photo']) {
							$image = $this->model_tool_image->resize($gallery_photo['photo'], $width, $height);
							$popup = $this->model_tool_image->resize($gallery_photo['photo'], $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $width, $height);
							$popup = $this->model_tool_image->resize('placeholder.png', $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
						}
					}
					
					$photos[] = array(
						'image'		=> $image,
						'popup'		=> $popup,
						'name'		=> $gallery_photo['name'],
						'link'		=> $gallery_photo['link'],
					);
				}

				$data['gallerys'][] = array(
					'gallery_id'   		=> $album['gallery_id'],
					'title'        		=> $album['title'],
					'top_description'   => html_entity_decode($album['top_description'], ENT_QUOTES, 'UTF-8'),
					'photos'       		=> $photos,
				);
			}

			$data['gallery_setting_color'] = $this->config->get('gallery_setting_color'); 

			$url = '';

			$pagination = new Pagination();
			$pagination->total = $gallery_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('gallery/album_photo', $url . '&page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($gallery_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($gallery_total - $limit)) ? $gallery_total : ((($page - 1) * $limit) + $limit), $gallery_total, ceil($gallery_total / $limit));
			
			$data['limit'] = $limit;
					
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if(VERSION < '2.2.0.0') {
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/gallery/album_photo.tpl')) {
			    	$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/gallery/album_photo.tpl', $data));
			   } else {
			   		$this->response->setOutput($this->load->view('default/template/gallery/album_photo.tpl', $data));
			   }
		  	} else{
			   $this->response->setOutput($this->load->view('gallery/album_photo', $data));
			}
		}
	}
}