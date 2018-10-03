<?php
/*
  Module Name: Price Slider
  Description:Price Slider plugin is one of the best product filter plugin for opencart. It has feature to filter products by
  price range.
  Author: Softech Planet
  Author Email:info@softechplanet.com
  Author URI: http://softechplanet.com
  Version: 1.0
  Tags: product filter, price filter, price slider
 */

class ControllerExtensionModulePriceSlider extends Controller {

    public function index() { 
        $this->load->language('extension/module/price_slider');
        $data['heading_title'] = $this->language->get('heading_title');
        $this->load->model('extension/module/price_slider');
        $data['button_filter'] = $this->language->get('button_filter');
        $this->document->addScript('catalog/view/theme/default/template/extension/module/price_slider/js/jquery.min.js');
        $this->document->addScript('catalog/view/theme/default/template/extension/module/price_slider/js/bootstrap-slider.js');
        $this->document->addStyle('catalog/view/theme/default/template/extension/module/price_slider/css/bootstrap-slider.css');
        if (isset($this->request->get['filter'])) {
            $filter = $this->request->get['filter'];
        } else {
            $filter = '';
        }
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'p.sort_order';
        }
        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }
        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        if (isset($this->request->get['limit'])) {
            $limit = (int) $this->request->get['limit'];
        } else {
            $limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
        }
        if (isset($this->request->get['path'])) {
            if (stristr($this->request->get['path'], '_') === FALSE) {
                $parts = $this->request->get['path'];
                $category_id = $this->request->get['path'];
            } else {
                $path = '';
                $parts = explode('_', (string) $this->request->get['path']);
                $category_id = '';
                $category_id = (int) array_pop($parts);
            }
            $data['price_slider_status'] = $this->config->get('price_slider_status');
            if (!isset($price_slider)) {
                $price_slider = array();
            }
           
			if (isset($this->request->get['pr'])) {
				$data['price_range'] = explode(',', $this->request->get['pr']);
			} else {
				$data['price_range'] = array();
			}

			if (version_compare(VERSION, '2.2.0.0', '<') == true) {
				$pcode = $this->currency->getCode();
			} else {
				$pcode = $this->session->data['currency'];
			}

			if ($this->currency->getSymbolLeft($pcode)) {
				$code = $this->currency->getSymbolLeft($pcode);
				$data['right_code'] = false;
			} else {
				$code = $this->currency->getSymbolRight($pcode);
				$data['right_code'] = true;
			}

            $data['price_code'] = $code;
			
			$url = '';
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			$data['action'] = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url));
			
			if (!$this->config->get('price_slider_range')) {
				$range = explode('-', '0-0');
			} else {
				$range = explode('-', $this->config->get('price_slider_range'));
			}
			$data['price_range_min'] = $range[0];
			$data['price_range_max'] = $range[1];
            return $this->load->view('extension/module/price_slider/price_slider', $data);
            }
        }
}
