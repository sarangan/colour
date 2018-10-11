<?php
class ModelGalleryGallery extends Model {
	public function addGallery($data) { 
		
		$this->db->query("INSERT INTO `" . DB_PREFIX . "gallery` SET status = '" . $this->db->escape($data['status']) . "', sort_order = '" . (int)$data['sort_order'] . "', width = '" . (int)$data['width'] . "', height = '" . (int)$data['height'] . "', date_added = NOW()");

		$gallery_id = $this->db->getLastId();
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "gallery SET image = '" . $this->db->escape($data['image']) . "' WHERE gallery_id = '" . (int)$gallery_id . "'");
		}
		
		foreach ($data['gallery_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_description SET gallery_id = '" . (int)$gallery_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', top_description = '" . $this->db->escape($value['top_description']) . "', bottom_description = '" . $this->db->escape($value['bottom_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "'");
		}
		
		if (isset($data['gallery_photo'])) {
			foreach ($data['gallery_photo'] as $gallery_photo) {	
				$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_photo SET gallery_id = '" . (int)$gallery_id . "', photo = '" . $this->db->escape(html_entity_decode($gallery_photo['photo'],  ENT_QUOTES, 'UTF-8')) . "', link = '" . $this->db->escape($gallery_photo['link']) . "', sort_order = '" . (int)$gallery_photo['sort_order'] . "', highlight = '" . (isset($gallery_photo['highlight']) ? (int)$gallery_photo['highlight'] : '') . "'");
					
				$gallery_photo_id = $this->db->getLastId();		

				foreach ($gallery_photo['gallery_photo_description'] as $language_id => $gallery_photo_description) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_photo_description SET gallery_photo_id = '" . (int)$gallery_photo_id . "', language_id = '" . (int)$language_id . "', gallery_id = '" . (int)$gallery_id . "', name = '" . $this->db->escape($gallery_photo_description['name']) . "'");
				}
			}						
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'gallery_id=" . (int)$gallery_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		return $gallery_id;
	}

	public function editGallery($gallery_id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "gallery` SET  image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "', width = '" . (int)$data['width'] . "', height = '" . (int)$data['height'] . "' WHERE gallery_id = '" . (int)$gallery_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_description WHERE gallery_id = '" . (int)$gallery_id . "'");

		foreach ($data['gallery_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_description SET gallery_id = '" . (int)$gallery_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', top_description = '" . $this->db->escape($value['top_description']) . "', bottom_description = '" . $this->db->escape($value['bottom_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_photo WHERE gallery_id = '" . (int)$gallery_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_photo_description WHERE gallery_id = '" . (int)$gallery_id . "'");

		if (isset($data['gallery_photo'])) {
			foreach ($data['gallery_photo'] as $gallery_photo) {
				if ($gallery_photo['gallery_photo_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_photo SET gallery_photo_id = '" . (int)$gallery_photo['gallery_photo_id'] . "', gallery_id = '" . (int)$gallery_id . "', photo = '" . $this->db->escape(html_entity_decode($gallery_photo['photo'], ENT_QUOTES, 'UTF-8')) . "', link = '" . $this->db->escape($gallery_photo['link']) . "', sort_order = '" . (int)$gallery_photo['sort_order'] . "', highlight = '" . (isset($gallery_photo['highlight']) ? (int)$gallery_photo['highlight'] : '') . "'");
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_photo SET gallery_id = '" . (int)$gallery_id . "', photo = '" . $this->db->escape(html_entity_decode($gallery_photo['photo'], ENT_QUOTES, 'UTF-8')) . "', link = '" . $this->db->escape($gallery_photo['link']) . "', sort_order = '" . (int)$gallery_photo['sort_order'] . "', highlight = '" . (isset($gallery_photo['highlight']) ? (int)$gallery_photo['highlight'] : '') . "'");
				}

				$gallery_photo_id = $this->db->getLastId();

				foreach ($gallery_photo['gallery_photo_description'] as $language_id => $gallery_photo_description) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_photo_description SET gallery_photo_id = '" . (int)$gallery_photo_id . "', language_id = '" . (int)$language_id . "', gallery_id = '" . (int)$gallery_id . "', name = '" . $this->db->escape($gallery_photo_description['name']) . "'");
				}
			}
		}


		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'gallery_id=" . (int)$gallery_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'gallery_id=" . (int)$gallery_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
	}

	public function deleteGallery($gallery_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "gallery` WHERE gallery_id = '" . (int)$gallery_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_description WHERE gallery_id = '" . (int)$gallery_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_photo WHERE gallery_id = '" . (int)$gallery_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_photo_description WHERE gallery_id = '" . (int)$gallery_id . "'");
		
	}

	public function getGallery($gallery_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'gallery_id=" . (int)$gallery_id . "') AS keyword FROM `" . DB_PREFIX . "gallery` g LEFT JOIN " . DB_PREFIX . "gallery_description gd ON (g.gallery_id = gd.gallery_id) WHERE g.gallery_id = '" . (int)$gallery_id . "' AND gd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getGallerys($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "gallery` g LEFT JOIN " . DB_PREFIX . "gallery_description gd ON (g.gallery_id = gd.gallery_id) WHERE gd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND gd.title LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sort_data = array(
			'gd.title',
			'g.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY gd.title";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows; 
	}

	public function getGalleryDescriptions($gallery_id) {
		$gallery_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_description WHERE gallery_id = '" . (int)$gallery_id . "'");

		foreach ($query->rows as $result) {
			$gallery_data[$result['language_id']] = array(
				'title' 			=> $result['title'],
				'description' 		=> $result['description'],
				'top_description' 	=> $result['top_description'],
				'bottom_description'=> $result['bottom_description'],
				'meta_title'		=> $result['meta_title'],
				'meta_description'	=> $result['meta_description'],
				'meta_keyword'		=> $result['meta_keyword'],
			);
		}

		return $gallery_data;
	}

	public function getGalleryPhoto($gallery_photo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_photo gp LEFT JOIN " . DB_PREFIX . "gallery_photo_description ghd ON (gp.gallery_photo_id = ghd.gallery_photo_id) WHERE gp.gallery_photo_id = '" . (int)$gallery_photo_id . "' AND ghd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getGalleryPhotos($gallery_id) {
		$gallery_photo_data = array();

		$gallery_photo_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_photo gp WHERE gp.gallery_id = '" . (int)$gallery_id . "' ORDER BY gp.sort_order");

		foreach ($gallery_photo_query->rows as $gallery_photo) {
			$gallery_photo_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_photo gp LEFT JOIN " . DB_PREFIX . "gallery_photo_description ghd ON (gp.gallery_photo_id = ghd.gallery_photo_id) WHERE gp.gallery_photo_id = '" . (int)$gallery_photo['gallery_photo_id'] . "'");
		
			$gallery_photo_description_data = array();
			foreach ($gallery_photo_description_query->rows as $gallery_photo_description) {
				$gallery_photo_description_data[$gallery_photo_description['language_id']] = array(
					'name'            => $gallery_photo_description['name'],
				);
			}
			
			$gallery_photo_data[] = array(
				'gallery_photo_id' 			=> $gallery_photo['gallery_photo_id'],
				'photo'           			=> $gallery_photo['photo'],				
				'highlight'     			=> $gallery_photo['highlight'],
				'sort_order'     			=> $gallery_photo['sort_order'],
				'link'     					=> $gallery_photo['link'],
				'gallery_photo_description'	=> $gallery_photo_description_data,
			);
		}


		return $gallery_photo_data;
	}

	public function getGalleryPhotoDescriptions($gallery_id) {
		$gallery_photo_data = array();

		$gallery_photo_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_photo WHERE gallery_id = '" . (int)$gallery_id . "' ORDER BY sort_order");

		foreach ($gallery_photo_query->rows as $gallery_photo) {
			$gallery_photo_description_data = array();

			$gallery_photo_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_photo_description WHERE gallery_photo_id = '" . (int)$gallery_photo['gallery_photo_id'] . "'");

			foreach ($gallery_photo_description_query->rows as $gallery_photo_description) {
				$gallery_photo_description_data[$gallery_photo_description['language_id']] = array('name' => $gallery_photo_description['name']);
			}

			$gallery_photo_data[] = array(
				'gallery_photo_id'          => $gallery_photo['gallery_photo_id'],
				'gallery_photo_description' => $gallery_photo_description_data,
				'image'                    	=> $gallery_photo['image'],
				'highlight'                	=> $gallery_photo['highlight'],
				'sort_order'               	=> $gallery_photo['sort_order']
			);
		}

		return $gallery_photo_data;
	}

	public function getTotalGallerys() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "gallery`");

		return $query->row['total'];
	}

	public function CreateMPGalleryTable() {
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "gallery` (`gallery_id` int(11) NOT NULL AUTO_INCREMENT,`image` varchar(255) NOT NULL,`status` tinyint(4) NOT NULL,`sort_order` int(11) NOT NULL,`width` varchar(10) NOT NULL,`height` varchar(10) NOT NULL,`viewed` int(11) NOT NULL,`date_added` date NOT NULL,`date_modified` datetime NOT NULL,PRIMARY KEY (`gallery_id`)) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0");
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "gallery_description` (`gallery_id` int(11) NOT NULL,`language_id` int(11) NOT NULL,`title` varchar(255) NOT NULL,`description` text NOT NULL,`top_description` text NOT NULL,`bottom_description` text NOT NULL,`meta_title` varchar(255) NOT NULL,`meta_description` text NOT NULL,`meta_keyword` text NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8");
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "gallery_photo` (`gallery_photo_id` int(11) NOT NULL AUTO_INCREMENT,`gallery_id` int(11) NOT NULL,`photo` varchar(255) NOT NULL,`link` varchar(255) NOT NULL,`sort_order` int(11) NOT NULL,`status` tinyint(4) NOT NULL,`highlight` tinyint(4) NOT NULL,PRIMARY KEY (`gallery_photo_id`)) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0");
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "gallery_photo_description` (`gallery_photo_id` int(11) NOT NULL,`gallery_id` int(11) NOT NULL,`language_id` int(11) NOT NULL,`name` varchar(255) NOT NULL,`description` int(11) NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8");
	}
}