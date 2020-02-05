<?php

namespace App\Http\Controllers\Backend;

use Session;
use Illuminate\Http\Request;
use App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use App\Model\UserTicket;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Redirect;
use Datatables;
use Validator;

class UserTicketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
		return view ('backend.userticket.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
		return view ('backend.userticket.update');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[]);
        //
        $cekusername = UserTicket::where('username',$request->username)->get()->count();

        $ldapconn = ldap_connect(env('LDAP_HOST'));
        ldap_set_option($ldapconn, LDAP_OPT_PROTOCOL_VERSION, 3);
        ldap_set_option($ldapconn, LDAP_OPT_REFERRALS, 0);

        $searchUser = env('LDAP_USERNAME');
        $searchPass = env('LDAP_PASSWORD');
        $username = $request->username."@avianbrands.com";
        
        $ldap_success = false;
        if (@ldap_bind($ldapconn, $searchUser, $searchPass)) {
            $attributes = ['cn'];
            $filter = "(&(objectClass=user)(objectCategory=person)(userPrincipalName=".ldap_escape($username, null, LDAP_ESCAPE_FILTER)."))";
            $baseDn = "DC=avianbrands,DC=com";
            $results = @ldap_search($ldapconn, $baseDn, $filter, $attributes);
            $info = @ldap_get_entries($ldapconn, $results);
            $ldap_success = ($info && $info['count'] === 1);
        }

		if($cekusername > 0){
			$validator->getMessageBag()->add('username', 'Username already registered');
        } else {
            if ($request->tipe == "AD") {
                if (!$ldap_success){
                    $validator->getMessageBag()->add('username', 'Username not registered in the active directory');
                } else {
                    $data = new UserTicket();
                    $data->username = $request->username;
                    $data->reldag = $request->reldag;
                    $data->tipe = $request->tipe;
                    $data->user_level = $request->user_level;
                    $data->name = $request->name;
                    $data->email = $request->email;
                    $data->area = $request->area;
                    $data->user_modified = Session::get('userinfo')['username'];
                    if($data->save()){
                        return Redirect::to('/backend/user/')->with('success', "Data saved successfully")->with('mode', 'success');
                    }
                }
            } else 
            if ($request->tipe =="AGEN"){
                $data = new UserTicket();
                $data->username = $request->username;
                $data->password = md5('12345');
                $data->reldag = $request->reldag;
                $data->tipe = $request->tipe;
                $data->user_level = $request->user_level;
                $data->name = $request->name;
                $data->email = $request->email;
                $data->area = $request->area;
                $data->user_modified = Session::get('userinfo')['username'];
                if($data->save()){
                    return Redirect::to('/backend/user/')->with('success', "Data saved successfully")->with('mode', 'success');
                }
            }
        }
		return Redirect::to('/backend/user/create')
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
		$data = UserTicket::where('id', $id)->get();
		if ($data->count() > 0){
			return view ('backend.userticket.view', ['data' => $data]);
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
		$data = UserTicket::where('id', $id)->get();
		if ($data->count() > 0){
			return view ('backend.userticket.update', ['data' => $data]);
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
        $cekusername = UserTicket::where('user_ticket.id','<>',$id)->where('username',$request->username)->get()->count();

        $ldapconn = ldap_connect(env('LDAP_HOST'));
        ldap_set_option($ldapconn, LDAP_OPT_PROTOCOL_VERSION, 3);
        ldap_set_option($ldapconn, LDAP_OPT_REFERRALS, 0);

        $searchUser = env('LDAP_USERNAME');
        $searchPass = env('LDAP_PASSWORD');
        $username = $request->username."@avianbrands.com";
        
        $ldap_success = false;
        if (@ldap_bind($ldapconn, $searchUser, $searchPass)) {
            $attributes = ['cn'];
            $filter = "(&(objectClass=user)(objectCategory=person)(userPrincipalName=".ldap_escape($username, null, LDAP_ESCAPE_FILTER)."))";
            $baseDn = "DC=avianbrands,DC=com";
            $results = @ldap_search($ldapconn, $baseDn, $filter, $attributes);
            $info = @ldap_get_entries($ldapconn, $results);
            $ldap_success = ($info && $info['count'] === 1);
        }

		if($cekusername > 0){
			$validator->getMessageBag()->add('username', 'Username already registered');
        } else 
        {
            if ($request->tipe == "AD") {
                if (!$ldap_success){
                    $validator->getMessageBag()->add('username', 'Username not registered in the active directory');
                } else {
                    $data = UserTicket::find($id);
                    $data->username = $request->username;
                    $data->reldag = $request->reldag;
                    $data->tipe = $request->tipe;
                    $data->user_level = $request->user_level;
                    $data->name = $request->name;
                    $data->email = $request->email;
                    $data->area = $request->area;
                    $data->user_modified = Session::get('userinfo')['username'];
                    if($data->save()){
                        return Redirect::to('/backend/user/')->with('success', "Data saved successfully")->with('mode', 'success');
                    }
                }
            } else 
            if ($request->tipe == "AGEN") {
                $data = UserTicket::find($id);
                $data->username = $request->username;
                if ($request->password_check == 1){
                    $data->password = md5($request->pwd);
                }
                $data->reldag = $request->reldag;
                $data->tipe = $request->tipe;
                $data->user_level = $request->user_level;
                $data->name = $request->name;
                $data->email = $request->email;
                $data->area = $request->area;
                $data->user_modified = Session::get('userinfo')['username'];
                if($data->save()){
                    return Redirect::to('/backend/user/')->with('success', "Data saved successfully")->with('mode', 'success');
                }

            }
        }
		return Redirect::to('/backend/user/'.$id."/edit")
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
        $delete = UserTicket::where('id', $id)->delete(); 
		return new JsonResponse(["status"=>true]);
    }
	
	public function datatable() {	
		$userticket = UserTicket::all();
        return Datatables::of($userticket)
            ->editColumn('user_level', function($userticket) {
                if ($userticket->user_level == "VSUPER"){
                    return "SUPER ADMIN";
                } else 
                if ($userticket->user_level == "VADM"){
                    return "ADMIN";
                } else {
                    return $userticket->user_level;
                }
            })            
			->addColumn('action', function ($userticket) {
				$url_edit = url('backend/user/'.$userticket->id.'/edit');
				$url = url('backend/user/'.$userticket->id);
				$view = "<a class='btn-action btn btn-primary btn-view' href='".$url."' title='View'><i class='fa fa-eye'></i></a>";
				$edit = "<a class='btn-action btn btn-info btn-edit' href='".$url_edit."' title='Edit'><i class='fa fa-edit'></i></a>";
				$delete = "<button data-url='".$url."' onclick='deleteData(this)' class='btn-action btn btn-danger btn-delete' title='Delete'><i class='fa fa-trash-o'></i></button>";
				return $view." ".$edit." ".$delete;
            })			
            ->rawColumns(['action'])
            ->make(true);
	}
 	
}