<?php
class ControllerInformationTextbookfullset extends Controller {

    public function index() {

        // if (!$this->customer->isLogged()) {
        //     $this->session->data['redirect'] = $this->url->link('information/textbookfullset', '', 'SSL');
        //
        //     $this->response->redirect($this->url->link('account/login', '', 'SSL'));
        // }

        $this->load->model('catalog/textbookfullset');
        $this->load->model('tool/image');
        // $this->load->model('catalog/product');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = 'Textbook Full Set';

        //$data['link_ewar_add_air'] = $this->url->link('information/ewarrentyair');

        $data['heading_title'] = 'Textbook Full Set';

        $data['action'] = $this->url->link('information/textbookfullset');

        $data['column_left'] = $this->load->controller('common/column_left');
  			$data['column_right'] = $this->load->controller('common/column_right');
  			$data['content_top'] = $this->load->controller('common/content_top');
  			$data['content_bottom'] = $this->load->controller('common/content_bottom');
  			$data['footer'] = $this->load->controller('common/footer');
  			$data['header'] = $this->load->controller('common/header');


        $results_schools = $this->model_catalog_textbookfullset->getSchools();

        $data['schools']= array();

  			foreach ($results_schools as $result_school) {
          $data['schools'][] = array(
            'filter_id'       => $result_school['filter_id'],
            'filter_group_id' => $result_school['filter_group_id'],
    				'name'            => $result_school['name']
          );
        }

        $results_levels = $this->model_catalog_textbookfullset->getLevels();

        $data['levels']= array();

  			foreach ($results_levels as $results_level) {
          $data['levels'][] = array(
            'filter_id'     => $results_level['filter_id'],
            'filter_group_id'     => $results_level['filter_group_id'],
    				'name'          => $results_level['name']
          );
        }


        $results_streams = $this->model_catalog_textbookfullset->getStreams();

        $data['streams']= array();

  			foreach ($results_streams as $results_stream) {
          $data['streams'][] = array(
            'filter_id'     => $results_stream['filter_id'],
            'filter_group_id'     => $results_stream['filter_group_id'],
    				'name'          => $results_stream['name']
          );
        }


        $input_school = '';
        $input_level = '';
        $input_stream = '';

        if (isset($this->request->post['input-search-school'])) {
    			$input_school = $this->request->post['input-search-school'];
    		}

        if (isset($this->request->post['input-search-level'])) {
    			$input_level = $this->request->post['input-search-level'];
    		}

        if (isset($this->request->post['input-search-stream'])) {
    			$input_stream = $this->request->post['input-search-stream'];
    		}

        if( $input_level == '---' ){
          $input_level = '';
        }

        if( $input_stream == '---' ){
          $input_stream = '';
        }

        $data['input_school'] = $input_school;
        $data['input_level'] = $input_level;
        $data['input_stream'] = $input_stream;

        $data['products'] = array();

        $results = $this->model_catalog_textbookfullset->getProducts($input_school, $input_level, $input_stream);

        foreach ($results as $result) {
    			if ($result['image']) {
    				$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
    			} else {
    				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
    			}

    			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
    				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
    			} else {
    				$price = false;
    			}

    			if ((float)$result['special']) {
    				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
    			} else {
    				$special = false;
    			}

    			if ($this->config->get('config_tax')) {
    				$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
    			} else {
    				$tax = false;
    			}

    			if ($this->config->get('config_review_status')) {
    				$rating = (int)$result['rating'];
    			} else {
    				$rating = false;
    			}

    			$data['products'][] = array(
    				'product_id'  => $result['product_id'],
    				'thumb'       => $image,
    				'name'        => $result['name'],
    				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
    				'price'       => $price,
    				'special'     => $special,
    				'tax'         => $tax,
    				'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
    				'rating'      => $result['rating'],
    				'date_added'  => $result['date_added'],
            'publisher'  => $result['mpn'],
            'subject'  => $result['location'],
    				'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
    			);
    		}


        $this->response->setOutput($this->load->view('information/textbookfullset', $data));
    }
}
