<?php


namespace App\Http\Controllers\Backend;

use Session;
use App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Model\Ticket;
use DB;
use Redirect;

class DashboardController extends Controller {
	public function dashboard(Request $request) {
		$userinfo = Session::get('userinfo');
		if (($userinfo['priv'] != "VSUPER") && ($userinfo['priv'] != "VADM")){
			return Redirect::to('/backend/ticket/');
		}

		//TOTAL TICKET
		$total_ticket = Ticket::select(['ticket.id'])->where('ticket.active','=',1)->count();

		//OPEN TICKET
		$open_ticket = Ticket::select(['ticket.id'])->where('ticket.status','=',1)->where('ticket.active', '=', 1)->count();

		//ASSIGN TICKET
		$assign_ticket = Ticket::select(['ticket.id'])->where('ticket.status','=',2)->where('ticket.active', '=', 1)->count();

		//REQUEST TO CLOSE TICKET
		$request_to_close_ticket = Ticket::select(['ticket.id'])->where('ticket.status','=',3)->where('ticket.active', '=', 1)->count();

		//CLOSE TICKET
		$close_ticket = Ticket::select(['ticket.id'])->where('ticket.status','=',4)->where('ticket.active', '=', 1)->count();

        $masalah = Ticket::select(['category.category as nama',DB::raw('count(ticket.id) as jumlah')])
                    ->leftJoin('category','ticket.category_id','=','category.id')
                    ->where('ticket.active','=',1)
                    ->groupBy('ticket.category_id')
					->orderBy('ticket.category_id', 'ASC')
					->get();


		$masalah_assignee = Ticket::select(['ticket.assignee as nama',DB::raw('count(ticket.id) as jumlah')])
					->leftJoin('user_ticket', 'user_ticket.username', 'ticket.assignee')
                    ->where('ticket.active','=',1)
                    ->groupBy('ticket.assignee')
					->orderBy('ticket.assignee', 'ASC')
					->get();

        view()->share('total_ticket', $total_ticket);
        view()->share('open_ticket', $open_ticket);
		view()->share('assign_ticket', $assign_ticket);
		view()->share('request_ticket', $request_to_close_ticket);
		view()->share('close_ticket', $close_ticket);
		view()->share('masalah', $masalah);
		view()->share('masalah_assignee', $masalah_assignee);
		return view ('backend.dashboard');
	}
}