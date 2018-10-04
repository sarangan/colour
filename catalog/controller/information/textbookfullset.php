<?php
class ControllerInformationTextbookfullset extends Controller {

    public function index() {

        // if (!$this->customer->isLogged()) {
        //     $this->session->data['redirect'] = $this->url->link('information/textbookfullset', '', 'SSL');
        //
        //     $this->response->redirect($this->url->link('account/login', '', 'SSL'));
        // }

        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = 'Textbook Full Set';

        //$data['link_ewar_add_air'] = $this->url->link('information/ewarrentyair');

        $data['heading_title'] = 'Textbook Full Set';

        $data['column_left'] = $this->load->controller('common/column_left');
  			$data['column_right'] = $this->load->controller('common/column_right');
  			$data['content_top'] = $this->load->controller('common/content_top');
  			$data['content_bottom'] = $this->load->controller('common/content_bottom');
  			$data['footer'] = $this->load->controller('common/footer');
  			$data['header'] = $this->load->controller('common/header');


        $this->response->setOutput($this->load->view('information/textbookfullset', $data));
    }
}
