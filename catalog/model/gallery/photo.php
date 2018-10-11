<?php
class ModelGalleryPhoto extends Model {	
	public function getPhoto($gallery_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery g LEFT JOIN " . DB_PREFIX . "gallery_description gd ON (g.gallery_id = gd.gallery_id) WHERE g.gallery_id = '" . (int)$gallery_id . "' AND gd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND g.status = '1'");
		
		if ($query->num_rows) {
			return array(
				'gallery_id'       => $query->row['gallery_id'],
				'image'            => $query->row['image'],				
				'status'           => $query->row['status'],				
				'description'      => $query->row['description'],
				'sort_order'       => $query->row['sort_order'],				
				'date_modified'    => $query->row['date_modified'],				
				'language_id'      => $query->row['language_id'],					
				'title'            => $query->row['title'],					
				'date_added'       => $query->row['date_added']
			);
		} else {
			return false;
		}
	}
	
	public function getPhotoDescription($gallery_id) {		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_photo gp LEFT JOIN " . DB_PREFIX . "gallery_photo_description gpd ON (gp.gallery_photo_id = gpd.gallery_photo_id) WHERE gp.gallery_id = '" . (int)$gallery_id . "' AND gpd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY gp.sort_order ASC");
		return $query->rows;
	}

	public function getAlbumPhotoDescription($gallery_id) {		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_photo gp LEFT JOIN " . DB_PREFIX . "gallery_photo_description gpd ON (gp.gallery_photo_id = gpd.gallery_photo_id) WHERE gp.gallery_id = '" . (int)$gallery_id . "' AND gpd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY gp.highlight DESC, gp.sort_order ASC");
		
		return $query->rows;
	}

	public function getPhotosByGallery($gallery_id, $limit = '') {
		$start = 0;

		$sql = "SELECT * FROM " . DB_PREFIX . "gallery_photo gp LEFT JOIN " . DB_PREFIX . "gallery_photo_description gpd ON (gp.gallery_photo_id = gpd.gallery_photo_id) WHERE gp.gallery_id = '" . (int)$gallery_id . "' AND gpd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY gp.sort_order ASC";

		if ($limit) {
			$sql .= " LIMIT " . (int)$start . "," . (int)$limit;
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}
	
	public function getGalleryPhotos($gallery_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_photo gp WHERE gp.gallery_id = '" . (int)$gallery_id . "' ORDER BY gp.sort_order ASC");

		return $query->rows;
	}
}