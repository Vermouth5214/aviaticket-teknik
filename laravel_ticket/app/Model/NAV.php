<?php 

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class NAV extends Model {
	protected $table = 'nav';
	protected $hidden = ['created_at', 'updated_at'];
	
}