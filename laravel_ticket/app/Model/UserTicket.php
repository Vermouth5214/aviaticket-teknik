<?php

namespace App\Model;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class UserTicket extends Authenticatable
{
	protected $table = 'user_ticket';

}