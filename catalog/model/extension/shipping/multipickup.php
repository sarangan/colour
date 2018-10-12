<?php
class ModelExtensionShippingMultiPickup extends Model {
	function getQuote($address) {
		$this->load->language('extension/shipping/multipickup');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('multipickup_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->config->get('multipickup_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$quote_data2 = array();
			$row=0;
			
			//get number of store		
			$query = $this->db->query("SELECT count(*) AS a FROM " . DB_PREFIX . "setting WHERE code='multipickup' AND `key` LIKE '%_cost'");

			$data['multiStore_array'] = array();		
			$x = 0; 
			$row=0;

			while($row < $query->row['a']) {
				$response = $this->config->get('multipickup_' . $x . '_status');
			if (!empty($response)) 
			{
				if(($this->config->get('multipickup_' . $x . '_status'))=='10')
			{
				$quote_data2['multipickup' . $x ] = array(
					'name'         => 'multipickup' . $x,
					'code'         => 'multipickup.multipickup' . $x,
					'title'        => $this->config->get('multipickup_' . $x . '_Store_' . $this->config->get('config_language_id')),
					'cost'         => $this->config->get('multipickup_' . $x . '_cost'),
					'sort_order'   => $this->config->get('multipickup_' . $x . '_sort'),
					'tax_class_id' => 0,
					'text'         => $this->currency->format($this->config->get('multipickup_' . $x . '_cost'), $this->session->data['currency'])
					//'text'         => $this->currency->format($this->config->get('multipickup_' . $x . '_cost'))
			);
			}
				$row++;
			}
				$x++;
			} 
			
			usort($quote_data2, function ($a, $b) { return $a["sort_order"] - $b["sort_order"];});
			
			$quote_data = array();
			
			foreach ($quote_data2 as $multiStores)
			
			$quote_data[$multiStores['name']] = array(
					'code'         => $multiStores['code'],
					'title'        => $multiStores['title'],
					'cost'         => $multiStores['cost'],
					'sort_order'   => $multiStores['sort_order'],
					'tax_class_id' => 0,
					'text'         => $multiStores['text']
			);

			$method_data = array(
				'code'       => 'multipickup',
				'title'      => $this->config->get('multipickup_' . $this->config->get('config_language_id')),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('multipickup_sort_order'),
				'error'      => false
			);
		}

		return $method_data;
	}
}