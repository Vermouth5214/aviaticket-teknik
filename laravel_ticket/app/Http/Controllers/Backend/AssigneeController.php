<?php

namespace App\Http\Controllers\Backend;

use Session;
use Illuminate\Http\Request;
use App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use App\Model\Assignee;
use App\Model\UserTicket;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Redirect;
use Datatables;
use Validator;

class AssigneeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
		return view ('backend.assignee.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
		return view ('backend.assignee.update');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $validator = Validator::make($request->all(),[]);
        $cekusername = UserTicket::where('username',$request->name)->get()->count();
        $cekkembar = Assignee::where('name',$request->name)->get()->count();
		if($cekusername == 0){
            $validator->getMessageBag()->add('username', 'Username not registered in the Master User');
        } else 
		if($cekkembar > 0){
			$validator->getMessageBag()->add('username', 'Username already registered');
        } else {
            $data = new Assignee();
            $data->name = $request->name;
            $data->active = $request->active;
            $data->user_modified = Session::get('userinfo')['username'];
            if($data->save()){
                return Redirect::to('/backend/assignee/')->with('success', "Data saved successfully")->with('mode', 'success');
            }
        }
		return Redirect::to('/backend/assignee/create')
				->withErrors($validator)
				->withInput();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\UserLevel  $userLevel
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
		$data = Assignee::where('id', $id)->get();
		if ($data->count() > 0){
			return view ('backend.assignee.view', ['data' => $data]);
		}
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\UserLevel  $userLevel
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
		$data = Assignee::where('id', $id)->get();
		if ($data->count() > 0){
			return view ('backend.assignee.update', ['data' => $data]);
		}
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\UserLevel  $userLevel
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $validator = Validator::make($request->all(),[]);
        $cekusername = UserTicket::where('username',$request->name)->get()->count();
        $cekkembar = Assignee::where('id','<>',$id)->where('name',$request->name)->get()->count();
		if($cekusername == 0){
            $validator->getMessageBag()->add('username', 'Username not registered in the Master User');
        } else 
		if($cekkembar > 0){
			$validator->getMessageBag()->add('username', 'Username already registered');
        } else {
            $data = Assignee::find($id);
            $data->name = $request->name;
            $data->active = $request->active;
            $data->user_modified = Session::get('userinfo')['username'];
            if($data->save()){
                return Redirect::to('/backend/assignee/')->with('success', "Data saved successfully")->with('mode', 'success');
            }
        }
		return Redirect::to('/backend/assignee/'.$id."/edit")
				->withErrors($validator)
				->withInput();		
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\UserLevel  $userLevel
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        //
		$data = Assignee::find($id);
    	$data->active = 0;
		$data->user_modified = Session::get('userinfo')['username'];
        if($data->save()){
            Session::flash('success', 'Data deleted successfully');
            Session::flash('mode', 'success');
            return new JsonResponse(["status"=>true]);
        }else{
            return new JsonResponse(["status"=>false]);
        }
		return new JsonResponse(["status"=>false]);		

    }
	
	public function datatable() {	
		$data = Assignee::where('active', '!=', 0);
        return Datatables::of($data)
			->addColumn('action', function ($data) {
				$url_edit = url('backend/assignee/'.$data->id.'/edit');
				$url = url('backend/assignee/'.$data->id);
				$view = "<a class='btn-action btn btn-primary btn-view' href='".$url."' title='View'><i class='fa fa-eye'></i></a>";
				$edit = "<a class='btn-action btn btn-info btn-edit' href='".$url_edit."' title='Edit'><i class='fa fa-edit'></i></a>";
				$delete = "<button data-url='".$url."' onclick='deleteData(this)' class='btn-action btn btn-danger btn-delete' title='Delete'><i class='fa fa-trash-o'></i></button>";
				return $view." ".$edit." ".$delete;
            })			
            ->rawColumns(['action'])
            ->make(true);
	}
 	
}