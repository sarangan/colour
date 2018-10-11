<?php
class ControllerGalleryMtabs extends Controller {
	public function index() {

		$this->load->language('gallery/mtabs');

		$this->document->addStyle('view/stylesheet/modulepoints/gallery.css');
		
		$data['list'] = $this->url->link('gallery/gallery', 'token=' . $this->session->data['token'], true);
		$data['add'] = $this->url->link('gallery/gallery/add', 'token=' . $this->session->data['token'], true);
		$data['msetting'] = $this->url->link('gallery/gallery_setting', 'token=' . $this->session->data['token'], true);

		if (VERSION > '2.2.0.0') {
			$data['extension'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		} else {
			$data['extension'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);
		}

		$data['text_menu_list'] = $this->language->get('text_menu_list');
		$data['text_menu_theme'] = $this->language->get('text_menu_theme');
		$data['text_add_menu'] = $this->language->get('text_add_menu');
		$data['text_settings'] = $this->language->get('text_settings');
		$data['text_extension'] = $this->language->get('text_extension');
		
		if(isset($this->request->get['route']) && ($this->request->get['route'] == 'extension/module/mpgallery' || $this->request->get['route'] == 'extension/module/mpphoto')) {
			$data['extension_menu'] = 'extension/extension';
		}else if(isset($this->request->get['route']) && ($this->request->get['route'] == 'module/mpgallery' || $this->request->get['route'] == 'module/mpphoto')) {
			$data['extension_menu'] = 'extension/module';
		} else {
			$data['extension_menu'] = false;
		}

		if(isset($this->request->get['route']) && $this->request->get['route'] == 'gallery/gallery') {
			$data['list_menu'] = true;
		} else{
			$data['list_menu'] = false;
		}

		if(isset($this->request->get['route']) && $this->request->get['route'] == 'gallery/gallery_setting') {
			$data['setting_menu'] = true;
		} else{
			$data['setting_menu'] = false;
		}

		if(isset($this->request->get['route']) && $this->request->get['route'] == 'gallery/gallery/add') {
			$data['new_menu'] = true;
		} else{
			$data['new_menu'] = false;
		}
		
		$data['color_tab'] = false;
		if(isset($this->request->get['c'])) {
			$data['color_tab'] = true;
		}

		return $this->load->view('gallery/mtabs.tpl', $data);
	}
}
