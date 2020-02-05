<?php 

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model {
	protected $table = 'ticket';

	public function user()
    {
        return $this->belongsTo('App\Model\UserTicket', 'user_created', 'username');
    }	
	
}