<?php
class ControllerGalleryGallerysetting extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('gallery/gallery_setting');

		$this->document->addStyle('view/javascript/modulepoints/colorpicker/css/bootstrap-colorpicker.css');
		$this->document->addScript('view/javascript/modulepoints/colorpicker/js/bootstrap-colorpicker.js');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		
		$this->load->model('gallery/gallery');
		
		$this->model_gallery_gallery->CreateMPGalleryTable();

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('gallery_setting', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('gallery/gallery_setting', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_gsetting'] = $this->language->get('text_gsetting');
		$data['text_colors'] = $this->language->get('text_colors');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_countphoto'] = $this->language->get('entry_countphoto');
		$data['entry_photo_limit'] = $this->language->get('entry_photo_limit');
		$data['entry_album_limit'] = $this->language->get('entry_album_limit');
		$data['entry_popup'] = $this->language->get('entry_popup');
		$data['entry_album_image'] = $this->language->get('entry_album_image');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_photo_image'] = $this->language->get('entry_photo_image');
		$data['entry_albumphoto_description'] = $this->language->get('entry_albumphoto_description');
		$data['entry_album_description'] = $this->language->get('entry_album_description');
		$data['entry_albumphoto_limit'] = $this->language->get('entry_albumphoto_limit');
		$data['entry_social_status'] = $this->language->get('entry_social_status');
		$data['entry_cursive_font'] = $this->language->get('entry_cursive_font');

		//Colors

		$data['entry_color_title_text'] = $this->language->get('entry_color_title_text');
		$data['entry_color_albumtitle_text'] = $this->language->get('entry_color_albumtitle_text');
		$data['entry_albumtitle_bg'] = $this->language->get('entry_albumtitle_bg');
		$data['entry_photo_tilte_color'] = $this->language->get('entry_photo_tilte_color');
		$data['entry_photo_zoomicon_color'] = $this->language->get('entry_photo_zoomicon_color');
		$data['entry_photo_hoverbg_color'] = $this->language->get('entry_photo_hoverbg_color');
		$data['entry_albumsapge_title_text'] = $this->language->get('entry_albumsapge_title_text');
		$data['entry_albums_detail_text'] = $this->language->get('entry_albums_detail_text');
		$data['entry_sharethis_bg'] = $this->language->get('entry_sharethis_bg');
		$data['entry_sharethis_color'] = $this->language->get('entry_sharethis_color');
		$data['entry_albums_wrapbg'] = $this->language->get('entry_albums_wrapbg');
		$data['entry_extitle_bgcolor'] = $this->language->get('entry_extitle_bgcolor');
		$data['entry_extitle_textcolor'] = $this->language->get('entry_extitle_textcolor');
		$data['entry_extitle_bordercolor'] = $this->language->get('entry_extitle_bordercolor');
		$data['entry_exview_all_color'] = $this->language->get('entry_exview_all_color');
		$data['entry_carousel_arrow_bgcolor'] = $this->language->get('entry_carousel_arrow_bgcolor');
		$data['entry_carousel_arrow_color'] = $this->language->get('entry_carousel_arrow_color');
		
		
		$data['help_album_image'] = $this->language->get('help_album_image');
		$data['help_photo_image'] = $this->language->get('help_photo_image');
		$data['help_popup'] = $this->language->get('help_popup');
		

		$data['fieldset_general'] = $this->language->get('fieldset_general');
		$data['fieldset_album_page'] = $this->language->get('fieldset_album_page');
		$data['fieldset_photo_page'] = $this->language->get('fieldset_photo_page');
		$data['fieldset_albumn_photo'] = $this->language->get('fieldset_albumn_photo');
		$data['fieldset_albumn_allphoto'] = $this->language->get('fieldset_albumn_allphoto');
		$data['fieldset_albumns'] = $this->language->get('fieldset_albumns');
		$data['fieldset_sharethis'] = $this->language->get('fieldset_sharethis');
		$data['fieldset_extension'] = $this->language->get('fieldset_extension');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['album_limit'])) {
			$data['error_album_limit'] = $this->error['album_limit'];
		} else {
			$data['error_album_limit'] = '';
		}
		
		if (isset($this->error['albumphoto_limit'])) {
			$data['error_albumphoto_limit'] = $this->error['albumphoto_limit'];
		} else {
			$data['error_albumphoto_limit'] = '';
		}
		
		if (isset($this->error['popup_size'])) {
			$data['error_popup_size'] = $this->error['popup_size'];
		} else {
			$data['error_popup_size'] = '';
		}
		
		if (isset($this->error['photo_size'])) {
			$data['error_photo_size'] = $this->error['photo_size'];
		} else {
			$data['error_photo_size'] = '';
		}

		if (isset($this->error['albumphoto_size'])) {
			$data['error_albumphoto_size'] = $this->error['albumphoto_size'];
		} else {
			$data['error_albumphoto_size'] = '';
		}

		if (isset($this->error['album_size'])) {
			$data['error_album_size'] = $this->error['album_size'];
		} else {
			$data['error_album_size'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('gallery/gallery_setting', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('gallery/gallery_setting', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		$module_info = $this->model_setting_setting->getSetting('gallery_setting');

		if (isset($this->request->post['gallery_setting_status'])) {
			$data['gallery_setting_status'] = $this->request->post['gallery_setting_status'];
		} else if(isset($module_info['gallery_setting_status'])) {
			$data['gallery_setting_status'] = $module_info['gallery_setting_status'];
		} else {
			$data['gallery_setting_status'] = '';
		}

		if (isset($this->request->post['gallery_setting_album_limit'])) {
			$data['gallery_setting_album_limit'] = $this->request->post['gallery_setting_album_limit'];
		} else if(isset($module_info['gallery_setting_album_limit'])) {
			$data['gallery_setting_album_limit'] = $module_info['gallery_setting_album_limit'];
		} else {
			$data['gallery_setting_album_limit'] = 20;
		}

		if (isset($this->request->post['gallery_setting_popup_width'])) {
			$data['gallery_setting_popup_width'] = $this->request->post['gallery_setting_popup_width'];
		} else if(isset($module_info['gallery_setting_popup_width'])) {
			$data['gallery_setting_popup_width'] = $module_info['gallery_setting_popup_width'];
		} else {
			$data['gallery_setting_popup_width'] = 500;
		}	

		if (isset($this->request->post['gallery_setting_color'])) {
			$data['gallery_setting_color'] = $this->request->post['gallery_setting_color'];
		} else if(isset($module_info['gallery_setting_color'])) {
			$data['gallery_setting_color'] = $module_info['gallery_setting_color'];
		} else {
			$data['gallery_setting_color'] = array();
		}

		if (isset($this->request->post['gallery_setting_popup_height'])) {
			$data['gallery_setting_popup_height'] = $this->request->post['gallery_setting_popup_height'];
		} else if(isset($module_info['gallery_setting_popup_height'])) {
			$data['gallery_setting_popup_height'] = $module_info['gallery_setting_popup_height'];
		} else {
			$data['gallery_setting_popup_height'] = 729;
		}

		if (isset($this->request->post['gallery_setting_social_status'])) {
			$data['gallery_setting_social_status'] = $this->request->post['gallery_setting_social_status'];
		} else if(isset($module_info['gallery_setting_social_status'])) {
			$data['gallery_setting_social_status'] = $module_info['gallery_setting_social_status'];
		} else {
			$data['gallery_setting_social_status'] = 1;
		}

		if (isset($this->request->post['gallery_setting_album_width'])) {
			$data['gallery_setting_album_width'] = $this->request->post['gallery_setting_album_width'];
		} else if(isset($module_info['gallery_setting_album_width'])) {
			$data['gallery_setting_album_width'] = $module_info['gallery_setting_album_width'];
		} else {
			$data['gallery_setting_album_width'] = 213;
		}

		if (isset($this->request->post['gallery_setting_album_height'])) {
			$data['gallery_setting_album_height'] = $this->request->post['gallery_setting_album_height'];
		} else if(isset($module_info['gallery_setting_album_height'])) {
			$data['gallery_setting_album_height'] = $module_info['gallery_setting_album_height'];
		} else {
			$data['gallery_setting_album_height'] = 310;
		}

		if (isset($this->request->post['gallery_setting_photo_width'])) {
			$data['gallery_setting_photo_width'] = $this->request->post['gallery_setting_photo_width'];
		} else if(isset($module_info['gallery_setting_photo_width'])) {
			$data['gallery_setting_photo_width'] = $module_info['gallery_setting_photo_width'];
		} else {
			$data['gallery_setting_photo_width'] = 213;
		}

		if (isset($this->request->post['gallery_setting_photo_height'])) {
			$data['gallery_setting_photo_height'] = $this->request->post['gallery_setting_photo_height'];
		} else if(isset($module_info['gallery_setting_photo_height'])) {
			$data['gallery_setting_photo_height'] = $module_info['gallery_setting_photo_height'];
		} else {
			$data['gallery_setting_photo_height'] = 310;
		}

		if (isset($this->request->post['gallery_setting_albumphoto_description'])) {
			$data['gallery_setting_albumphoto_description'] = $this->request->post['gallery_setting_albumphoto_description'];
		} else if(isset($module_info['gallery_setting_albumphoto_description'])) {
			$data['gallery_setting_albumphoto_description'] = $module_info['gallery_setting_albumphoto_description'];
		} else {
			$data['gallery_setting_albumphoto_description'] = 1;
		}

		if (isset($this->request->post['gallery_setting_album_description'])) {
			$data['gallery_setting_album_description'] = $this->request->post['gallery_setting_album_description'];
		} else if(isset($module_info['gallery_setting_album_description'])) {
			$data['gallery_setting_album_description'] = $module_info['gallery_setting_album_description'];
		} else {
			$data['gallery_setting_album_description'] = 1;
		}
		

		if (isset($this->request->post['gallery_setting_albumphoto_width'])) {
			$data['gallery_setting_albumphoto_width'] = $this->request->post['gallery_setting_albumphoto_width'];
		} else if(isset($module_info['gallery_setting_albumphoto_width'])) {
			$data['gallery_setting_albumphoto_width'] = $module_info['gallery_setting_albumphoto_width'];
		} else {
			$data['gallery_setting_albumphoto_width'] = 213;
		}

		if (isset($this->request->post['gallery_setting_albumphoto_height'])) {
			$data['gallery_setting_albumphoto_height'] = $this->request->post['gallery_setting_albumphoto_height'];
		} else if(isset($module_info['gallery_setting_albumphoto_height'])) {
			$data['gallery_setting_albumphoto_height'] = $module_info['gallery_setting_albumphoto_height'];
		} else {
			$data['gallery_setting_albumphoto_height'] = 310;
		}

		if (isset($this->request->post['gallery_setting_albumphoto_limit'])) {
			$data['gallery_setting_albumphoto_limit'] = $this->request->post['gallery_setting_albumphoto_limit'];
		} else if(isset($module_info['gallery_setting_albumphoto_limit'])) {
			$data['gallery_setting_albumphoto_limit'] = $module_info['gallery_setting_albumphoto_limit'];
		} else {
			$data['gallery_setting_albumphoto_limit'] = 20;
		}

		if (isset($this->request->post['gallery_setting_photo_cursive_font'])) {
			$data['gallery_setting_photo_cursive_font'] = $this->request->post['gallery_setting_photo_cursive_font'];
		} else if(isset($module_info['gallery_setting_photo_cursive_font'])) {
			$data['gallery_setting_photo_cursive_font'] = $module_info['gallery_setting_photo_cursive_font'];
		} else {
			$data['gallery_setting_photo_cursive_font'] = '';
		}
		
		if (isset($this->request->post['gallery_setting_albumphoto_cursive_font'])) {
			$data['gallery_setting_albumphoto_cursive_font'] = $this->request->post['gallery_setting_albumphoto_cursive_font'];
		} else if(isset($module_info['gallery_setting_albumphoto_cursive_font'])) {
			$data['gallery_setting_albumphoto_cursive_font'] = $module_info['gallery_setting_albumphoto_cursive_font'];
		} else {
			$data['gallery_setting_albumphoto_cursive_font'] = '';
		}

		$data['mtabs'] = $this->load->controller('gallery/mtabs');
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('gallery/gallery_setting.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'gallery/gallery_setting')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['gallery_setting_album_limit']) {
			$this->error['album_limit'] = $this->language->get('error_album_limit');
		}

		if (!$this->request->post['gallery_setting_albumphoto_limit']) {
			$this->error['albumphoto_limit'] = $this->language->get('error_albumphoto_limit');
		}

		if (!$this->request->post['gallery_setting_popup_width'] || !$this->request->post['gallery_setting_popup_height']) {
			$this->error['popup_size'] = $this->language->get('error_popup_size');
		}

		if (!$this->request->post['gallery_setting_photo_width'] || !$this->request->post['gallery_setting_photo_height']) {
			$this->error['photo_size'] = $this->language->get('error_photo_size');
		}

		if (!$this->request->post['gallery_setting_albumphoto_width'] || !$this->request->post['gallery_setting_albumphoto_height']) {
			$this->error['albumphoto_size'] = $this->language->get('error_albumphoto_size');
		}

		if (!$this->request->post['gallery_setting_album_width'] || !$this->request->post['gallery_setting_album_height']) {
			$this->error['album_size'] = $this->language->get('error_album_size');
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}
}