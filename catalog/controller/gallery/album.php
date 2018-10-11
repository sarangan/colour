<?php
class ControllerGalleryAlbum extends Controller {
	private $error = array();

	public function index() {
		if($this->config->get('gallery_setting_status')) {
			$this->load->language('gallery/album');
			
			$this->load->model('gallery/album');
			
			$this->load->model('tool/image');	

			$this->document->setTitle($this->language->get('heading_title'));

			$data['heading_title'] = $this->language->get('heading_title');
			$data['text_no_results'] = $this->language->get('text_no_results');
			$data['text_viewed'] = $this->language->get('text_viewed');

			$this->document->addStyle('catalog/view/javascript/jquery/mgallery/style.css');

			$data['gallery_setting_album_description'] = $this->config->get('gallery_setting_album_description'); 
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}
			
			if ($this->config->get('gallery_setting_album_limit')) {
				$limit = $this->config->get('gallery_setting_album_limit');
			} else {
				$limit = 20;
			}
			
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
				'href' => $this->url->link('gallery/album', $url)
			);				

			$this->load->model('tool/image');
			
			$data['gallerys'] = array();
			
			$filter_data = array(
				'start' => ($page - 1) * $limit,
				'limit' => $limit,
			);

			$data['text_photos'] = $this->language->get('text_photos');

			$gallery_total = $this->model_gallery_album->getTotalGallerys($filter_data);
				
			$gallery_info = $this->model_gallery_album->getGallery($filter_data);
			
			foreach ($gallery_info as $gallery) {			
				if ($gallery) {
					if ($gallery['image']) {
						$image = $this->model_tool_image->resize($gallery['image'], $this->config->get('gallery_setting_album_width'), $this->config->get('gallery_setting_album_height'));
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('gallery_setting_album_width'), $this->config->get('gallery_setting_album_height'));
					}

					$data['gallerys'][] = array(
						'gallery_id'  => $gallery['gallery_id'],
						'viewed'  	  => $gallery['viewed'],
						'image'       => $image,
						'title'        => $gallery['title'],
						'total_photos' => $this->model_gallery_album->getTotalGalleryPhotos($gallery['gallery_id']),
						'description' => html_entity_decode($gallery['description'], ENT_QUOTES, 'UTF-8'),
						'href'        => $this->url->link('gallery/photo', 'gallery_id=' . $gallery['gallery_id'] . $url)
					);
				}
			}
			
			$data['gallery_setting_color'] = $this->config->get('gallery_setting_color'); 
			
			$url = '';

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $gallery_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('gallery/album', $url . '&page={page}');

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
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/gallery/album.tpl')) {
			    	$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/gallery/album.tpl', $data));
			   } else {
			   		$this->response->setOutput($this->load->view('default/template/gallery/album.tpl', $data));
			   }
		  	} else{
			   $this->response->setOutput($this->load->view('gallery/album', $data));
			}
		}
	}
}