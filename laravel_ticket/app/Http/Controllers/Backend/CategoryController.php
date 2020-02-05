<?php

namespace App\Http\Controllers\Backend;

use Session;
use Illuminate\Http\Request;
use App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use App\Model\Category;
use App\Model\Ticket;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Redirect;
use Datatables;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
		return view ('backend.category.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
		return view ('backend.category.update');
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
        $data = new Category();
        $data->category = $request->category;
        $data->active = $request->active;
		$data->user_modified = Session::get('userinfo')['username'];
		if($data->save()){
			return Redirect::to('/backend/category/')->with('success', "Data saved successfully")->with('mode', 'success');
		}
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
		$data = Category::where('id', $id)->get();
		if ($data->count() > 0){
			return view ('backend.category.view', ['data' => $data]);
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
		$data = Category::where('id', $id)->get();
		if ($data->count() > 0){
			return view ('backend.category.update', ['data' => $data]);
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
        $data = Category::find($id);
        $data->category = $request->category;
        $data->active = $request->active;
		$data->user_modified = Session::get('userinfo')['username'];
		if($data->save()){
			return Redirect::to('/backend/category/')->with('success', "Data saved successfully")->with('mode', 'success');
		}
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
        $check_ticket = Ticket::where('category_id','=',$id)->count();
        if ($check_ticket > 0){
            Session::flash('success', 'Category tidak bisa dihapus');
            Session::flash('mode', 'danger');
            return new JsonResponse(["status"=>true]);
        }
		$data = Category::find($id);
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
		$category = Category::where('active', '!=', 0);
        return Datatables::of($category)
			->addColumn('action', function ($category) {
				$url_edit = url('backend/category/'.$category->id.'/edit');
				$url = url('backend/category/'.$category->id);
				$view = "<a class='btn-action btn btn-primary btn-view' href='".$url."' title='View'><i class='fa fa-eye'></i></a>";
				$edit = "<a class='btn-action btn btn-info btn-edit' href='".$url_edit."' title='Edit'><i class='fa fa-edit'></i></a>";
				$delete = "<button data-url='".$url."' onclick='deleteData(this)' class='btn-action btn btn-danger btn-delete' title='Delete'><i class='fa fa-trash-o'></i></button>";
				return $view." ".$edit." ".$delete;
            })			
            ->rawColumns(['action'])
            ->make(true);
	}
 	
}