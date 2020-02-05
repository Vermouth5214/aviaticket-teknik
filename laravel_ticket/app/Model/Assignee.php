<?php 

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Assignee extends Model {
	protected $table = 'assignee';
	protected $hidden = ['created_at', 'updated_at'];
	
}