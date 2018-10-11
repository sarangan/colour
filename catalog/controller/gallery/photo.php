<?php
class ControllerGalleryPhoto extends Controller {
	private $error = array();

	public function index() {
		if($this->config->get('gallery_setting_status')) {
			$this->load->language('gallery/photo');

			$this->load->model('gallery/album');

			$this->load->model('gallery/photo');
			
			$this->load->model('tool/image');
			
			$this->document->addStyle('catalog/view/javascript/jquery/mgallery/style.css');
			$this->document->addStyle('catalog/view/javascript/jquery/mgallery/simplelightbox.css');
			$this->document->addScript('catalog/view/javascript/jquery/mgallery/simple-lightbox.js');

			$data['cursive_font'] = $this->config->get('gallery_setting_photo_cursive_font');

			$data['gallery_setting_color'] = $this->config->get('gallery_setting_color'); 

			$data['text_share'] = $this->language->get('text_share');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
			);

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_album'),
				'href' => $this->url->link('gallery/album', ''. $url, true)
			);

			if (isset($this->request->get['gallery_id'])) {
				$gallery_id = (int)$this->request->get['gallery_id'];
			} else {
				$gallery_id = 0;
			}

			$gallery_info = $this->model_gallery_album->getGalleryinfo($gallery_id);
			if ($gallery_info) {
				$url = '';

				if (isset($this->request->get['gallery_id'])) {
					$url .= '&gallery_id=' . $this->request->get['gallery_id'];
				}

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $gallery_info['title'],
					'href' => $this->url->link('gallery/photo', '' . $url, true)
				);
				
				$this->document->setTitle($gallery_info['title']);
				$this->document->addLink($this->url->link('gallery/photo', 'gallery_id=' . $this->request->get['gallery_id']), 'canonical');

				$data['heading_title'] = $gallery_info['title'];
				$data['top_description'] = html_entity_decode($gallery_info['top_description'], ENT_QUOTES, 'UTF-8');
				$data['bottom_description'] = html_entity_decode($gallery_info['bottom_description'], ENT_QUOTES, 'UTF-8');

				$data['photos'] = array();
				$results = $this->model_gallery_photo->getAlbumPhotoDescription($this->request->get['gallery_id']);	
				$highlight = false;
				foreach ($results as $result) {
					if($result['highlight'] && $highlight == false) {
						if ($result['photo']) {
							$image = $this->model_tool_image->resize($result['photo'], $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
							$popup = $this->model_tool_image->resize($result['photo'], $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
							$popup = $this->model_tool_image->resize('placeholder.png', $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
						}

						$highlight = true;
					} else {
						if ($result['photo']) {
							$image = $this->model_tool_image->resize($result['photo'], $this->config->get('gallery_setting_photo_width'), $this->config->get('gallery_setting_photo_height'));
							$popup = $this->model_tool_image->resize($result['photo'], $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));					
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('gallery_setting_photo_width'), $this->config->get('gallery_setting_photo_height'));
							$popup = $this->model_tool_image->resize('placeholder.png', $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
						}
					}

					$data['photos'][] = array(
						'thumb' 	=> $image,
						'popup' 	=> $popup,
						'name' 		=> $result['name'],
						'link' 		=> $result['link']
					);
				}

				$data['social_status'] = $this->config->get('gallery_setting_social_status');

				/*og meta tags starts*/
				$this->document->setgalleryMpMeta(array(
					'attribute' => 'property',
					'attribute_value' => 'og:title',
					'content' => $gallery_info['title'],
				));
				$this->document->setgalleryMpMeta(array(
					'attribute' => 'property',
					'attribute_value' => 'og:description',
					'content' =>  htmlspecialchars($gallery_info['meta_description'], ENT_QUOTES, 'UTF-8') ,
				));
				$this->document->setgalleryMpMeta(array(
					'attribute' => 'property',
					'attribute_value' => 'og:url',
					'content' => $this->url->link('gallery/photo', 'gallery_id=' . $this->request->get['gallery_id']),
				));

				if ($gallery_info['image']) {
					$popup = $this->model_tool_image->resize($gallery_info['image'], $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
				} else {
					$popup = $this->model_tool_image->resize('no_image.png', $this->config->get('gallery_setting_popup_width'), $this->config->get('gallery_setting_popup_height'));
				}
				
				$this->document->setgalleryMpMeta(array(
					'attribute' 		=> 'property',
					'attribute_value' 	=> 'og:image',
					'content' 			=> $popup,
				));

				$data['current_url'] = $this->url->link('gallery/photo', 'gallery_id=' . $this->request->get['gallery_id'], true);


				$this->model_gallery_album->updateViewed($this->request->get['gallery_id']);

				$data['column_left'] = $this->load->controller('common/column_left');
				$data['column_right'] = $this->load->controller('common/column_right');
				$data['content_top'] = $this->load->controller('common/content_top');
				$data['content_bottom'] = $this->load->controller('common/content_bottom');
				$data['footer'] = $this->load->controller('common/footer');
				$data['header'] = $this->load->controller('common/header');

				if(VERSION < '2.2.0.0') {
					if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/gallery/photo.tpl')) {
				    	$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/gallery/photo.tpl', $data));
				   } else {
				   		$this->response->setOutput($this->load->view('default/template/gallery/photo.tpl', $data));
				   }
			  	} else {
				   $this->response->setOutput($this->load->view('gallery/photo', $data));
				}
			} else {
				$url = '';

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $this->language->get('text_error'),
					'href' => $this->url->link('gallery/photo', 'gallery_id=' . $gallery_id . $url),
				);

				$this->document->setTitle($this->language->get('text_error'));

				$data['heading_title'] = $this->language->get('text_error');

				$data['text_error'] = $this->language->get('text_error');

				$data['button_continue'] = $this->language->get('button_continue');

				$data['continue'] = $this->url->link('common/home');

				$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

				$data['column_left'] = $this->load->controller('common/column_left');
				$data['column_right'] = $this->load->controller('common/column_right');
				$data['content_top'] = $this->load->controller('common/content_top');
				$data['content_bottom'] = $this->load->controller('common/content_bottom');
				$data['footer'] = $this->load->controller('common/footer');
				$data['header'] = $this->load->controller('common/header');

				if(VERSION < '2.2.0.0') {
					if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				    	$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
				   } else {
				   		$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
				   }
			  	} else {
				   $this->response->setOutput($this->load->view('error/not_found', $data));
				}
			}
		}
	}
}