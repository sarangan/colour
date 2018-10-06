<?php
class ControllerInformationMaterial extends Controller {

    public function index() {
        $this->load->language('product/category');
        $this->load->model('catalog/material');
        $this->load->model('tool/image');

        $filter = '';

        if (isset($this->request->get['filter'])) {
    			$filter = $this->request->get['filter'];
    		} else {
    			$filter = '';
    		}

        switch ($filter) {
          case 15:
            $this->document->setTitle('Textbook');
            $data['heading_title'] = 'Textbook';
            break;

            case 16:
              $this->document->setTitle('Assessment');
              $data['heading_title'] = 'Assessment';
              break;

            case 17:
                $this->document->setTitle('Story book');
                $data['heading_title'] = 'Story book';
                break;

            case 18:
              $this->document->setTitle('Stationery-Exercise book');
              $data['heading_title'] = 'Stationery &amp; Exercise book';
              break;

          default:
            # code...
            break;
        }


        $data['text_refine'] = $this->language->get('text_refine');
  			$data['text_empty'] = $this->language->get('text_empty');
  			$data['text_quantity'] = $this->language->get('text_quantity');
  			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
  			$data['text_model'] = $this->language->get('text_model');
  			$data['text_price'] = $this->language->get('text_price');
  			$data['text_tax'] = $this->language->get('text_tax');
  			$data['text_points'] = $this->language->get('text_points');
  			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
  			$data['text_sort'] = $this->language->get('text_sort');
  			$data['text_limit'] = $this->language->get('text_limit');

  			$data['button_cart'] = $this->language->get('button_cart');
  			$data['button_wishlist'] = $this->language->get('button_wishlist');
  			$data['button_compare'] = $this->language->get('button_compare');
  			$data['button_continue'] = $this->language->get('button_continue');
  			$data['button_list'] = $this->language->get('button_list');
  			$data['button_grid'] = $this->language->get('button_grid');

        $data['column_left'] = $this->load->controller('common/column_left');
  			$data['column_right'] = $this->load->controller('common/column_right');
  			$data['content_top'] = $this->load->controller('common/content_top');
  			$data['content_bottom'] = $this->load->controller('common/content_bottom');
  			$data['footer'] = $this->load->controller('common/footer');
  			$data['header'] = $this->load->controller('common/header');

        if (isset($this->request->get['page'])) {
    			$page = $this->request->get['page'];
    		} else {
    			$page = 1;
    		}

        $data['products'] = array();

        if($filter){

          $results = $this->model_catalog_material->getProducts_material($filter);

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

        }



        $this->response->setOutput($this->load->view('information/material', $data));
    }



}
