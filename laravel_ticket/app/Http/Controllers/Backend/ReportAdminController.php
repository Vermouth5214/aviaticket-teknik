<?php

namespace App\Http\Controllers\Backend;

use Session;
use Illuminate\Http\Request;
use App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use App\Model\Ticket;
use App\Model\Category;
use App\Model\Assignee;
use App\Model\UserTicket;
use App\Model\Comment;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Redirect;
use Datatables;
use App\Exports\GeneralReportAdmin;
use Excel;


class ReportAdminController extends Controller
{
    public function general_report(Request $request)
    {
        //
        $userinfo = Session::get('userinfo');
        
        $status = 999;
        $category = 999;
        $closeby = 999;
        $assignee = 999;
        $overdue = 999;
    	$startDate = "01"."-".date('m-Y');
        $endDate = date('d-m-Y');
        $mode = "limited";
        $user_type = 999;
        $user_agen = 999;
        $category_list = Category::where('active', '>', 0)->orderBy('id','ASC')->pluck('category','id')->prepend('All','999')->toArray();
        $assignee_list = Assignee::select([DB::raw('user_ticket.name as Nama'),'assignee.name'])->leftJoin('user_ticket','assignee.name','user_ticket.username')->where('active', '>', 0)->pluck('Nama','name')->prepend('All','999')->toArray();        
        $user_agen_list = UserTicket::select(['reldag', DB::raw('CONCAT(reldag, " - ", name) as full_name')])->where('tipe', 'AGEN')->pluck('full_name', 'reldag')->prepend('All','999')->toArray();
        //jika sls tampilkan sesuai areanya
        if ($userinfo['priv'] == "SLS"){
            $user_agen_list = UserTicket::select(['reldag', DB::raw('CONCAT(reldag, " - ", name) as full_name')])->where('tipe','AGEN')->where('area', $userinfo['area'])->pluck('full_name', 'reldag')->prepend('All','999')->toArray();
        }


        if (isset($_GET["startDate"]) || isset($_GET["endDate"]) || isset($_GET["status"]) || isset($_GET["mode"])){
			if ((isset($_GET['startDate'])) && ($_GET['startDate'] != "")){
				$startDate = $_GET["startDate"];
			}
			if ((isset($_GET['endDate'])) && ($_GET['endDate'] != "")){
				$endDate = $_GET["endDate"];
            }
			if ((isset($_GET['status'])) && ($_GET['status'] != "")){
				$status = $_GET["status"];
            }
			if (isset($_GET["category"])){
				$category = $_GET['category'];
            }
			if (isset($_GET["assignee"])){
				$assignee = $_GET['assignee'];
            }
			if (isset($_GET["closeby"])){
				$closeby = $_GET['closeby'];
            }
			if (isset($_GET["overdue"])){
				$overdue = $_GET['overdue'];
            }
			if (isset($_GET["mode"])){
				$mode = $_GET['mode'];
            }
			if (isset($_GET["user_type"])){
				$user_type = $_GET['user_type'];
            }
			if (isset($_GET["user_agen"])){
				$user_agen = $_GET['user_agen'];
            }
        }

        if (isset($_GET['export'])){
            return Excel::download(new GeneralReportAdmin($startDate, $endDate, $status, $category, $assignee, $closeby, $overdue, $mode, $user_type, $user_agen), 'General Report.xlsx');
        }

		view()->share('startDate',$startDate);
		view()->share('endDate',$endDate);
        view()->share('category',$category);
        view()->share('assignee',$assignee);
        view()->share('closeby',$closeby);
        view()->share('overdue',$overdue);
        view()->share('mode',$mode);
        view()->share('status',$status);
        view()->share('user_type',$user_type);
        view()->share('user_agen',$user_agen);

        view()->share('category_list',$category_list);
        view()->share('assignee_list',$assignee_list);
        view()->share('user_agen_list', $user_agen_list);        

		return view ('backend.report.general_report_admin');
    }

	public function general_report_datatable() {
        $userinfo = Session::get('userinfo');
        $status = 999;
        $closeby = 999;
        $overdue = 999;
        $category = 999;
        $assignee = 999;
    	$startDate = "01"."-".date('m-Y');
        $endDate = date('d-m-Y');
        $mode = "limited";
        $user_type = 999;
        if (isset($_GET["startDate"]) || isset($_GET["endDate"]) || isset($_GET["status"]) || isset($_GET["mode"])){
			if ((isset($_GET['startDate'])) && ($_GET['startDate'] != "")){
				$startDate = $_GET["startDate"];
			}
			if ((isset($_GET['endDate'])) && ($_GET['endDate'] != "")){
				$endDate = $_GET["endDate"];
            }
			if ((isset($_GET['status'])) && ($_GET['status'] != "")){
				$status = $_GET["status"];
            }
			if (isset($_GET["category"])){
				$category = $_GET['category'];
            }
			if (isset($_GET["assignee"])){
				$assignee = $_GET['assignee'];
            }
			if (isset($_GET["closeby"])){
				$closeby = $_GET['closeby'];
            }
			if (isset($_GET["overdue"])){
				$overdue = $_GET['overdue'];
            }
			if (isset($_GET["mode"])){
				$mode = $_GET['mode'];
            }
			if (isset($_GET["user_type"])){
				$user_type = $_GET['user_type'];
            }
			if (isset($_GET["user_agen"])){
				$user_agen = $_GET['user_agen'];
            }

        }
        
        $data = Ticket::select(['ticket.*','assignee_t.name as user_assignee','request_close_t.name as user_request', 'answer_t.name as user_answer','category.category AS category','user_ticket.name AS creator', 
        DB::raw('
        ifnull
        (
            datediff(date_add(ticket.start, interval left(ticket.prioritas,1)-0 day)
            , ticket.close_date),0) as overdue
        '),
        DB::raw('
        ifnull
        (
            datediff(date_add(ticket.start, interval left(ticket.prioritas,1)-0 day)
            , CURDATE()),0) as overdue_2
        ')

        ])
        ->leftJoin('user_ticket','ticket.user_created','=','user_ticket.username')
        ->leftJoin('user_ticket as assignee_t','ticket.assignee','=','assignee_t.username')
        ->leftJoin('user_ticket as request_close_t','ticket.user_request_close','=','request_close_t.username')
        ->leftJoin('user_ticket as answer_t','ticket.user_jawab','=','answer_t.username')
        ->leftJoin('category','ticket.category_id','=','category.id')
        ->where('ticket.active', '!=', 0);

        //SLS 
        //jika SLS lihat semua areanya
        //ga perlu ditambahi query plus punyanya sendiri karena sudah satu area
        if ($userinfo['priv'] == "SLS"){
            $data = $data->where('user_ticket.area','=',$userinfo['area']);
        }

        //DSD
        //jika DSD lihat semua agen dan SLS dan punyanya sendiri
        if ($userinfo['priv'] == "DSD"){
            $data = $data->whereRaw("(user_ticket.tipe = 'AGEN' or user_ticket.user_level = 'SLS' or ticket.reldag = '".$userinfo['reldag']."' )");
        }

        //cek mode
        if ($mode != "all"){
            $data = $data->where('ticket.created_at','>=', date('Y-m-d 00:00:00',strtotime($startDate)));
            $data = $data->where('ticket.created_at','<=',date('Y-m-d 23:59:59',strtotime($endDate)));
        }

        if ($status != 999){
            $data = $data->where('ticket.status','=', $status);
        }

        if ($category != 999){
            $data = $data->where('ticket.category_id','=', $category);
        } 

        if ($assignee != 999){
            $data = $data->where('ticket.assignee','=',$assignee);
        }

        if ($closeby == 1){
            //close by user
            $data = $data->where('ticket.status','=', 4)->where('ticket.user_close','!=','system');
        } else 
        if ($closeby == 2){
            //close by system
            $data = $data->where('ticket.status','=', 4)->where('ticket.user_close','=','system');
        }

        if ($overdue == 1){
            $data = $data->havingRaw('overdue < 0 or (overdue_2 < 0 and status < 4)');
        } 
        if ($overdue == 2){
            $data = $data->havingRaw('overdue >= 0 and (overdue_2 >= 0 or (overdue_2 < 0 and status >= 4))');
        }

        if ($user_type != 999){
            $data = $data->where('user_ticket.tipe','=',$user_type);
        }

        if ($user_agen != 999){
            $data = $data->where('ticket.reldag','=',$user_agen);
        }

        $data = $data->get();

        return Datatables::of($data)
            ->editColumn('keterangan', function($data){
                return nl2br(strip_tags($data->keterangan));
            })
            ->editColumn('status', function($data) {
                $status = '';
                //open
                if ($data->status == 1){
                    $status = "<span class='badge badge-error'>Open</span>";
                } else 
                if ($data->status == 2){
                    $status = "<span class='badge badge-warning'>Assign</span>";
                } else 
                if ($data->status == 3){
                    $status = "<span class='badge badge-info'>Request to Close</span>";
                } else 
                if ($data->status == 4){
                    $status = "<span class='badge badge-success'>Close</span>";
                }
                return $status;
            })
            ->editColumn('overdue', function($data) {
                $overdue = '';
                if ($data->overdue < 0){
                    $overdue = "<span class='red'><b>".abs($data->overdue)."</b></span>";
                } else 
                if (($data->overdue_2 < 0) && ($data->status < 4)) {
                    $overdue = "<span class='red'><b>".abs($data->overdue_2)."</b></span>";
                }
                return $overdue;
            })
            ->editColumn('created_at', function($data) {
                return date('d-m-Y H:i:s', strtotime($data->created_at));
            })
            ->editColumn('start', function($data) {
                if ($data->start > 0){
                    return date('d-m-Y', strtotime($data->start));
                } else {
                    return "";
                }
            })
            ->editColumn('request_close_date', function($data) {
                if ($data->request_close_date > 0){
                    return date('d-m-Y H:i:s', strtotime($data->request_close_date));
                } else {
                    return "";
                }
            })
            ->editColumn('close_date', function($data) {
                if ($data->close_date > 0){
                    return date('d-m-Y H:i:s', strtotime($data->close_date));
                } else {
                    return "";
                }
            })
            ->addColumn('attachment', function($data) {
                $text = "";
                if ($data->attachment_1 != ""){
                    $text .= "<a href='".url('upload/files/'.$data->attachment_1)."' target='_blank'>".$data->attachment_1."</a><br/>";
                }
                if ($data->attachment_2 != ""){
                    $text .= "<a href='".url('upload/files/'.$data->attachment_2)."' target='_blank'>".$data->attachment_2."</a><br/>";
                }
                if ($data->attachment_3 != ""){
                    $text .= "<a href='".url('upload/files/'.$data->attachment_3)."' target='_blank'>".$data->attachment_3."</a><br/>";
                }
                return $text;
            })
            ->addColumn('comment', function($data) {
                $comment = '';
                $data_comment = Comment::select('comment.*', DB::raw('IFNULL(assignee.name, "njing") as name'))
                                ->leftJoin('assignee','comment.username','=','assignee.name')
                                ->where('comment.ticket_id','=', $data->id)
                                ->orderBy('comment.id', 'ASC')
                                ->get();
                foreach ($data_comment as $detail):
                    $user = "A";
                    if ($detail->name == "njing"){
                        $user = "R";
                    }
                    $text = $user." : ".$detail->comment."<br>";
                    $comment .= $text;
                endforeach;
                return $comment;
            })
            ->editColumn('prioritas', function($data){
                $text = "";
                if ($data->prioritas == "3H"){
                    $text = "Minor";
                } else 
                if ($data->prioritas == "9H"){
                    $text = "Major";
                }
                return $text;
            })
            ->rawColumns(['status','attachment','keterangan','overdue','comment'])
            ->make(true);
	}
 	
}
