<?php
/*
  Module Name: Price Slider
  Description:Price Slider plugin is one of the best product filter plugin for opencart. It has feature to filter products by
  price range.
  Author: Softech Planet
  Author Email:ifno@softechplanet.com
  Author URI: http://softechplanet.com
  Version: 1.0
  Tags: product filter, price filter, price slider
 */
class ControllerExtensionModulePriceSlider extends Controller {

    private $error = array();

    public function index() {  

        $this->load->language('extension/module/price_slider');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('setting/setting');
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('price_slider', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
        }
        $data['heading_title'] = $this->language->get('heading_title');
		$data['text_price_limits'] = $this->language->get('text_price_limits');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['entry_heading'] = $this->language->get('entry_heading');
        $data['entry_price_range'] = $this->language->get('entry_price_range');
        $data['author_info'] = $this->language->get('author_info');
        $data['entry_status_price'] = $this->language->get('entry_status_price');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/price_slider', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('extension/module/price_slider', 'token=' . $this->session->data['token'], true);
        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

        if (isset($this->request->post['price_slider_heading'])) {
            $data['price_slider_heading'] = $this->request->post['price_slider_heading'];
        } else {
            $data['price_slider_heading'] = $this->config->get('price_slider_heading');
        }

        if (isset($this->request->post['price_slider_status'])) {
            $data['price_slider_status'] = $this->request->post['price_slider_status'];
        } else {
            $data['price_slider_status'] = $this->config->get('price_slider_status');
        }

        if (isset($this->request->post['price_slider_range'])) {
            $data['price_slider_range'] = $this->request->post['price_slider_range'];
        } else {
            $data['price_slider_range'] = $this->config->get('price_slider_range');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $this->response->setOutput($this->load->view('extension/module/price_slider', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'extension/module/price_slider')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        return !$this->error;
    }

}
