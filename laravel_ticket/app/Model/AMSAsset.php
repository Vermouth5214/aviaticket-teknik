<?php 

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class AMSAsset extends Model {
	protected $table = 'masset';
    protected $connection = 'DB-AMS';	
}