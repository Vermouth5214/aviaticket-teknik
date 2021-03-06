<?php

namespace App\Http\Controllers\Backend;

use Session;
use App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Model\Ticket;
use App\Model\Category;
use App\Model\Assignee;
use App\Model\Comment;
use App\Model\UserTicket;
use App\Model\AMSAsset;
use App\Model\NAVAssetCat;
use App\Model\NAVAssetPipa;
use App\Model\NAVPPCat;
use App\Model\NAVPPPipa;
use Illuminate\Support\Facades\Redirect;
use Validator;
use Datatables;
use DB;
use Swift_Mailer;
use Swift_MailTransport;
use Swift_Message;
use Swift_SmtpTransport;

class TicketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //

        $userinfo = Session::get('userinfo');

        $status = 999;
        $tipe = 999;
        $noPP = "";
        $noPO = "";
        $noPB = "";
        $category = 999;
        $closeby = 999;
        $assignee = 999;
        $overdue = 999;
    	$startDate = "01"."-".date('m-Y');
        $endDate = date('d-m-Y');
        $mode = "limited";
        $user_type = 999;
        $user_agen = 999;
        
        $category_list = Category::where('active', '=', 1)->orderBy('id','ASC')->pluck('category','id')->prepend('All','999')->toArray();

        $assignee_list = Assignee::select([DB::raw('user_ticket.name as Nama'),'assignee.name'])->leftJoin('user_ticket','assignee.name','user_ticket.username')->where('active', '=', 1)->pluck('Nama','name')->prepend('All','999')->toArray();
        $user_agen_list = UserTicket::select(['reldag', DB::raw('CONCAT(reldag, " - ", name) as full_name')])->where('tipe', 'AGEN')->pluck('full_name', 'reldag')->prepend('All','999')->toArray();
        //jika sls tampilkan sesuai areanya
        if ($userinfo['priv'] == "SLS"){
            $user_agen_list = UserTicket::select(['reldag', DB::raw('CONCAT(reldag, " - ", name) as full_name')])->where('tipe','AGEN')->where('area', $userinfo['area'])->pluck('full_name', 'reldag')->prepend('All','999')->toArray();
        }

        if (isset($_GET['status'])){
            $status = $_GET['status'];
        }
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
        if (isset($_GET["tipe"])){
            $tipe = $_GET['tipe'];
        }
        if (isset($_GET["noPP"])){
            $noPP = $_GET['noPP'];
        }
        if (isset($_GET["noPO"])){
            $noPO = $_GET['noPO'];
        }
        if (isset($_GET["noPB"])){
            $noPB = $_GET['noPB'];
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
        view()->share('tipe',$tipe);
        view()->share('noPO',$noPO);
        view()->share('noPP',$noPP);
        view()->share('noPB',$noPB);
        view()->share('category_list',$category_list);
        view()->share('assignee_list',$assignee_list);
        view()->share('user_agen_list', $user_agen_list);        

        return view ('backend.ticket.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $userinfo = Session::get('userinfo');

        $cek_no_ticket = Ticket::where('no_ticket','like', Session::get('userinfo')['reldag'].'-'.date('y').date('m').'%')->count();
        $no_ticket = Session::get('userinfo')['reldag'].'-'.date('y').date('m').'-'.str_pad($cek_no_ticket + 1,5,0,STR_PAD_LEFT);

        //load asset
        $AMSAsset = AMSAsset::where('jenis','<>','')->get();
        $NAVAssetCat = NAVAssetCat::where('Blocked', 0)->get();        
        $NAVAssetPipa = NAVAssetPipa::where('Blocked', 0)->get();

        $asset = [];
        $asset[''] = '';
        foreach ($AMSAsset as $forasset):
            $asset[$forasset->Kode] = $forasset->Kode." - ".$forasset->Nama." - ".$forasset->Lokasi;
        endforeach;
        foreach ($NAVAssetCat as $forasset):
            if (substr($forasset->No_,1,1) == "K"){
                $asset[$forasset->No_] = $forasset->No_." - ".$forasset->Description." - ".$forasset->{"FA Location Code"}." - ".$forasset->{"Nopol Lama"};
            } else {
                $asset[$forasset->No_] = $forasset->No_." - ".$forasset->Description." - ".$forasset->{"FA Location Code"};
            }
            
        endforeach;
        foreach ($NAVAssetPipa as $forasset):
            if (substr($forasset->No_,1,1) == "K"){
                $asset[$forasset->No_] = $forasset->No_." - ".$forasset->Description." - ".$forasset->{"FA Location Code"}." - ".$forasset->{"Nopol Lama"};
            } else {
                $asset[$forasset->No_] = $forasset->No_." - ".$forasset->Description." - ".$forasset->{"FA Location Code"};
            }
        endforeach;

        $asset['OTHERS-FACTORY'] = "OTHERS-FACTORY - MAINTENANCE OTHERS FACTORY";
        $asset['OTHERS-RND'] = "OTHERS-RND - MAINTENANCE RND OTHERS";

        view()->share('asset', $asset);
        view()->share('no_ticket', $no_ticket);

        return view ('backend.ticket.update');
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
        $email_kabag = '';
        $yang_buat_ticket = Session::get('userinfo')['username'];
        $info_email_kabag = UserTicket::where('username', $yang_buat_ticket)->get();
        if (count($info_email_kabag)){
            $email_kabag = $info_email_kabag[0]->email_kabag;
        }

        $rules = array(
            'judul' => 'required',
            'keterangan' => 'required',
            'attachment_1' => 'max:3072',
            'attachment_2' => 'max:3072',
            'attachment_3' => 'max:3072'
        );
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return Redirect::to('/backend/ticket/create')->withErrors($validator)->withInput($request->all());
        }  

        $data = new Ticket();
        $cek_no_ticket = Ticket::where('no_ticket','like', Session::get('userinfo')['reldag'].'-'.date('y').date('m').'%')->count();
        $no_ticket = Session::get('userinfo')['reldag'].'-'.date('y').date('m').'-'.str_pad($cek_no_ticket + 1,5,0,STR_PAD_LEFT);
        $data->FACode = $request->FACode;
        $data->no_ticket = $no_ticket;
        $data->judul = $request->judul;
        $data->keterangan = $request->keterangan;

        $files_ext = ['jpg','jpeg','bmp','png','xls','xlsx','doc','docx','pdf','txt'];
        $validator = Validator::make($request->all(),[]);        

        if ($request->hasFile('attachment_1')) {
            $file = $request->file('attachment_1');
            $ext = strtolower($file->getClientOriginalExtension());
            if (in_array($ext, $files_ext)){
                $save_name = $no_ticket."-1-".$file->getClientOriginalName();
                $file->move('upload/files', $save_name);
                $data->attachment_1 = $save_name;
            } else {
                $validator->getMessageBag()->add('extension', 'Invalid file extension');
                return Redirect::to('/backend/ticket/create')
    				->withErrors($validator)
	    			->withInput();		
            }
        }
        if ($request->hasFile('attachment_2')) {
            $file = $request->file('attachment_2');
            $ext = strtolower($file->getClientOriginalExtension());
            if (in_array($ext, $files_ext)){
                $save_name = $no_ticket."-2-".$file->getClientOriginalName();
                $file->move('upload/files', $save_name);
                $data->attachment_2 = $save_name;
            } else {
                $validator->getMessageBag()->add('extension', 'Invalid file extension');
                return Redirect::to('/backend/ticket/create')
    				->withErrors($validator)
	    			->withInput();		
            }
        }
        if ($request->hasFile('attachment_3')) {
            $file = $request->file('attachment_3');
            $ext = strtolower($file->getClientOriginalExtension());
            if (in_array($ext, $files_ext)){            
                $save_name = $no_ticket."-3-".$file->getClientOriginalName();
                $file->move('upload/files', $save_name);
                $data->attachment_3 = $save_name;
            } else {
                $validator->getMessageBag()->add('extension', 'Invalid file extension');
                return Redirect::to('/backend/ticket/create')
    				->withErrors($validator)
	    			->withInput();
            }
        }

        $data->user_modified = Session::get('userinfo')['username'];
        $data->user_created = Session::get('userinfo')['username'];
        $data->reldag = Session::get('userinfo')['reldag'];
        $data->status = 1;
        $data->active = 1;

		if($data->save()){
            //send email ticket baru
            // $email = ['it_3@avianbrands.com', 'tek_1@avianbrands.com', 'tek10@avian.com','aviantek01@gmail.com'];
            // $email = ['donny@avian.com', 'it_2@avianbrands.com'];
            $email_luar  = ['it_3@avianbrands.com', 'aviantek01@gmail.com'];
            $email_lokal = ['tek10@avian.com'];

            // $email_luar  = ['it_2@avianbrands.com', 'oeidonny.winarto@gmail.com'];
            // $email_lokal = ['donny@avian.com'];

            $message_2 = "Ticket baru dengan nomor : ".$data->no_ticket."<br/><br/>"."Judul : ".$data->judul."<br/><br/>FA Code : ".$request->FAText."<br/><br/>Keterangan : ".nl2br($data->keterangan)."<br/><br/>Diminta oleh : ".$data->user_created." - ".Session::get('userinfo')['name']."<br/><br/><br/>
            <b>Harap jangan balas email ini karena kami tidak dapat menanggapi pesan yang dikirim ke alamat email ini</b>
            ";

            //EMAIL LOKAL            
            $backup = \Mail::getSwiftMailer();

            // Setup your gmail mailer
            $transport = new Swift_SmtpTransport('192.168.110.112', 587);
            $transport->setUsername('info@avian.com');
            $transport->setPassword('123456789012345');
            // Any other mailer configuration stuff needed...
            
            $gmail = new Swift_Mailer($transport);
            
            // Set the mailer as gmail
            \Mail::setSwiftMailer($gmail);
            
            try {
            // Send your message
                \Mail::send([], [], function ($message) use ($email_lokal, $data, $message_2) {
                    $message->to($email_lokal)
                    ->subject('(AVIA Ticket) Ada ticket baru dengan nomor '.$data->no_ticket.' oleh user '.$data->user_created." - ".Session::get('userinfo')['name'])
                    ->setBody($message_2, 'text/html');
                });
            } catch (\Exception $e) {
                return Redirect::to('/backend/ticket/')->with('success', "Data saved successfully")->with('mode', 'success');      
            }                

            // Restore your original mailer
            \Mail::setSwiftMailer($backup);

            //EMAIL LUAR
            try {
                \Mail::send([], [], function ($message) use ($email_luar, $data, $message_2) {
                    $message->to($email_luar)
                    ->subject('(AVIA Ticket) Ada ticket baru dengan nomor '.$data->no_ticket.' oleh user '.$data->user_created." - ".Session::get('userinfo')['name'])
                    ->setBody($message_2, 'text/html');
                });
            } catch (\Exception $e) {
                return Redirect::to('/backend/ticket/')->with('success', "Data saved successfully")->with('mode', 'success');      
            }



            if (($email_kabag <> '') && (!(is_null($email_kabag)))){
                $message_2 = "Ticket baru dengan nomor : ".$data->no_ticket."<br/><br/>"."Judul : ".$data->judul."<br/><br/>FA Code : ".$request->FAText."<br/><br/>Keterangan : ".nl2br($data->keterangan)."<br/><br/>Diminta oleh : ".$data->user_created." - ".Session::get('userinfo')['name']."<br/><br/><br/>
                <b>Harap jangan balas email ini karena kami tidak dapat menanggapi pesan yang dikirim ke alamat email ini</b>
                ";

                if (strpos($email_kabag, 'avian.com') !== false) {
                    $backup = \Mail::getSwiftMailer();

                    // Setup your gmail mailer
                    $transport = new Swift_SmtpTransport('192.168.110.112', 587);
                    $transport->setUsername('info@avian.com');
                    $transport->setPassword('123456789012345');
                    // Any other mailer configuration stuff needed...
                   
                    $gmail = new Swift_Mailer($transport);
                   
                    // Set the mailer as gmail
                    \Mail::setSwiftMailer($gmail);
                    
                    try {
                    // Send your message
                        \Mail::send([], [], function ($message) use ($email_kabag, $data, $message_2) {
                            $message->to(trim($email_kabag))
                            ->subject('(AVIA Ticket) Ada ticket baru dengan nomor '.$data->no_ticket.' oleh user '.$data->user_created." - ".Session::get('userinfo')['name'])
                            ->setBody($message_2, 'text/html');
                        });
                    } catch (\Exception $e) {
                        return Redirect::to('/backend/ticket/')->with('success', "Data saved successfully")->with('mode', 'success');      
                    }                

                    // Restore your original mailer
                    \Mail::setSwiftMailer($backup);                
                } else {
                    try {
                        \Mail::send([], [], function ($message) use ($email_kabag, $data, $message_2) {
                            $message->to(trim($email_kabag))
                            ->subject('(AVIA Ticket) Ada ticket baru dengan nomor '.$data->no_ticket.' oleh user '.$data->user_created." - ".Session::get('userinfo')['name'])
                            ->setBody($message_2, 'text/html');
                        });
                    } catch (\Exception $e) {
                        return Redirect::to('/backend/ticket/')->with('success', "Data saved successfully")->with('mode', 'success');      
                    }                
                }
            }
    
			return Redirect::to('/backend/ticket/')->with('success', "Data saved successfully")->with('mode', 'success');
		}

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $category = Category::where('active', '=', 1)->orderBy('id','ASC')->pluck('category','id')->prepend('','')->toArray();
        $assignee = Assignee::select(['user_ticket.username','user_ticket.name'])->leftJoin('user_ticket','user_ticket.username','assignee.name')
        ->where('assignee.active', '=', 1)->orderBy('assignee.id','ASC')->pluck('user_ticket.name','user_ticket.username')->prepend('','')->toArray();
        $data = Ticket::with('user')->where('id','=', $id)->where('active', '=', 1)->get();
		if ($data->count() > 0){
            $userinfo = Session::get('userinfo');
            //JIKA USER BIASA CUMA BISA EDIT PUNYA SENDIRI
            if ($userinfo['priv'] == "USER"){
                if ($data[0]->user_created != $userinfo['username']){
                    return Redirect::to('/backend/ticket/');
                }
            }

            //load asset            
            $AMSAsset = AMSAsset::where('jenis','<>','')->get();
            $NAVAssetCat = NAVAssetCat::where('Blocked', 0)->get();        
            $NAVAssetPipa = NAVAssetPipa::where('Blocked', 0)->get();
    
            $asset = [];
            foreach ($AMSAsset as $forasset):
                $asset[$forasset->Kode] = $forasset->Kode." - ".$forasset->Nama." - ".$forasset->Lokasi;
            endforeach;
            foreach ($NAVAssetCat as $forasset):
                $asset[$forasset->No_] = $forasset->No_." - ".$forasset->Description." - ".$forasset->{"FA Location Code"};
            endforeach;
            foreach ($NAVAssetPipa as $forasset):
                $asset[$forasset->No_] = $forasset->No_." - ".$forasset->Description." - ".$forasset->{"FA Location Code"};
            endforeach;

            $nama = '';
            if (strlen($data[0]->assignee) > 0){
                $nama_assignee = UserTicket::where('username', '=', $data[0]->assignee)->get();
                if (count($nama_assignee) == 1){
                    $nama = $nama_assignee[0]->name;
                }
            }


            $asset['OTHERS-FACTORY'] = "OTHERS-FACTORY - MAINTENANCE OTHERS FACTORY";
            $asset['OTHERS-RND'] = "OTHERS-RND - MAINTENANCE RND OTHERS";
    

            view()->share('asset', $asset);
            view()->share('nama', $nama);
            view()->share('list_category', $category);
            view()->share('list_assignee', $assignee);
			return view ('backend.ticket.update', ['data' => $data]);
		}
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $userinfo = Session::get('userinfo');

        $data = Ticket::find($id);
        if ($data->status == 1) {
            if (!is_null($request->category)):
                $rules = array(
                    'category' => 'required',
                    'prioritas' => 'required',
                    'start' => 'required',
                );
                $validator = Validator::make($request->all(), $rules);
                if ($validator->fails()) {
                    return Redirect::to('/backend/ticket/'.$id.'/edit')->withErrors($validator)->withInput($request->all());
                }
        
                $data->prioritas = $request->prioritas;
                $data->start = date('Y-m-d', strtotime($request->start));
                if ($userinfo['priv'] == "VSUPER"){
                    $data->assignee = $request->assignee;
                } else {
                    $data->assignee = $userinfo['username'];
                }
                $data->category_id = $request->category;
                $data->user_jawab = $userinfo['username'];
                $data->user_modified = Session::get('userinfo')['username'];
                $data->status = 2;
                $data->save();

                //kirim email ke user created
                $data_email = UserTicket::where('username','=',$data->user_created)->get();
                if (count($data_email)){
                    $prioritas = "Minor";
                    if ($data->prioritas == "9H"){
                        $prioritas = "Major";
                    }
                    //ambil nama assignee
                    $yang_ngerjakan = "";
                    $assignee = UserTicket::where('username', $data->assignee)->first();
                    if ($assignee){
                        $yang_ngerjakan = $assignee->name;
                    }
                    $selesai = date('d M Y', strtotime($data->start. ' + '.substr($data->prioritas,0,1).' days'));
                    $message_2 = "
                                Dear Customer,<br/><br/>
                                Ticket dengan nomor : ".$data->no_ticket." telah diterima dan akan dikerjakan<br/>

                                mulai tanggal : ".date('d M Y',strtotime($data->start))."<br/>
                                oleh user : ".$yang_ngerjakan."<br/>
                                prioritas : ".$prioritas."<br/>
                                akan selesai maksimum tanggal : ".$selesai."<br/><br/>
                                <br/>
                                
                                Terima kasih<br/><br/>

                                URL Ticket : <a href='".url('backend/ticket/'.$data->id.'/edit')."'>".url('backend/ticket/'.$data->id.'/edit')."</a><br/><br/>
                                
                                <b>Harap jangan balas email ini karena kami tidak dapat menanggapi pesan yang dikirim ke alamat email ini</b>.";

                    $email = $data_email[0]->email;
                    $email_to = array_filter(explode(";", $email));

                    foreach ($email_to as $email):
                        \Mail::send([], [], function ($message) use ($email, $data, $message_2) {
                            $message->to(trim($email))
                            ->subject('(AVIA Ticket) Ticket nomor '.$data->no_ticket.' telah dijawab')
                            ->setBody($message_2, 'text/html');
                        });    
                    endforeach;
                }

            endif;
        } else 
        {
            // jika superadmin dapat edit jawaban dan masukkan ke log
            if (($userinfo['priv'] == "VSUPER") && ($data->status != 4)){
                if ($data->category_id <> $request->category){
                    //insert ke comment
                    $insert = new Comment();
                    $insert->username = $userinfo['username'];
                    $old_category = Category::find($data->category_id);
                    $new_category = Category::find($request->category);
                    $insert->comment = "mengubah category dari ".$old_category->category." menjadi ".$new_category->category;
                    $insert->type = "log";
                    $insert->ticket_id = $id;
                    $insert->save();
                }
                if ($data->prioritas <> $request->prioritas){
                    //insert ke comment
                    $lama = "";
                    if ($data->prioritas == "30H"){
                        $lama = "Minor";
                    } else 
                    if ($data->prioritas == "90H"){
                        $lama = "Major";
                    }
                    $baru = "";
                    if ($data->request == "30H"){
                        $baru = "Minor";
                    } else 
                    if ($data->request == "90H"){
                        $baru = "Major";
                    }

                    $insert = new Comment();
                    $insert->username = $userinfo['username'];
                    $insert->comment = "mengubah prioritas dari ".$data->prioritas." menjadi ".$request->prioritas;
                    $insert->type = "log";
                    $insert->ticket_id = $id;
                    $insert->save();
                }
                if (strtotime($data->start) <> strtotime($request->start)){
                    //insert ke comment
                    $insert = new Comment();
                    $insert->username = $userinfo['username'];
                    $insert->comment = "mengubah start pengerjaan dari ".date('d-m-Y',strtotime($data->start))." menjadi ".date('d-m-Y', strtotime($request->start));
                    $insert->type = "log";
                    $insert->ticket_id = $id;
                    $insert->save();
                }
                if ($data->assignee <> $request->assignee){
                    //insert ke comment
                    $insert = new Comment();
                    $insert->username = $userinfo['username'];
                    $insert->comment = "mengubah assignee dari ".$data->assignee." menjadi ".$request->assignee;
                    $insert->type = "log";
                    $insert->ticket_id = $id;
                    $insert->save();
                }
                $data->prioritas = $request->prioritas;
                $data->start = date('Y-m-d', strtotime($request->start));
                $data->assignee = $request->assignee;
                $data->category_id = $request->category;
                $data->user_modified = Session::get('userinfo')['username'];
                $data->save();
            }
        }
        //insert komentar
        if ($request->komentar != ''){
            $files_ext = ['jpg','jpeg','bmp','png','xls','xlsx','doc','docx','pdf','txt'];
            $validator = Validator::make($request->all(),[]);        

            $insert = new Comment();
            $insert->username = $userinfo['username'];
            $insert->comment = $request->komentar;
            $insert->type = "comment";
            $insert->ticket_id = $id;
            if ($request->hasFile('attachment')) {
                $file = $request->file('attachment');
                $ext = strtolower($file->getClientOriginalExtension());
                $size = $file->getClientSize();
                if ($size > 3145728){
                    $validator->getMessageBag()->add('extension', 'Maximum file size 3MB');
                    return Redirect::to('/backend/ticket/'.$id.'/edit')
                        ->withErrors($validator)
                        ->withInput();		
                }

                if (in_array($ext, $files_ext)){                
                    $save_name = $data->no_ticket."-comment-".date('dmYHis')."-".$file->getClientOriginalName();
                    $file->move('upload/files', $save_name);
                    $insert->attachment = $save_name;
                } else {
                    $validator->getMessageBag()->add('extension', 'Invalid file extension');
                    return Redirect::to('/backend/ticket/'.$id.'/edit')
                        ->withErrors($validator)
                        ->withInput();		
                }
            }
            $insert->save();

            //cek kirim email
            if ($userinfo["username"] == $data->user_created){
                //jika yang login yang bikin ticket
                if ($data->status > 1){
                    $data_email = UserTicket::where('username','=',$data->assignee)->get();
                    if (count($data_email)){
                        $message_2 = "
                                    User ".$data->user_created." - ".$userinfo['name']." telah menambahkan pesan baru pada ticket dengan nomor : ".$data->no_ticket." <br/><br/>
                                    Pesan : ".$request->komentar."<br/><br/>

                                    Terima kasih<br/><br/>

                                    URL Ticket : <a href='".url('backend/ticket/'.$data->id.'/edit')."'>".url('backend/ticket/'.$data->id.'/edit')."</a><br/><br/>
                                    
                                    <b>Harap jangan balas email ini karena kami tidak dapat menanggapi pesan yang dikirim ke alamat email ini</b>.";
        
                        \Mail::send([], [], function ($message) use ($data_email, $data, $message_2) {
                            $message->to(trim($data_email[0]->email))
                            ->subject('(AVIA Ticket) Ticket nomor '.$data->no_ticket.' terdapat pesan baru')
                            ->setBody($message_2, 'text/html');
                        });    
                    }
                }
            } else 
            if ($userinfo["username"] == $data->assignee){
                //jika yang login assignee
                if ($data->status > 1){
                    $data_email = UserTicket::where('username','=',$data->user_created)->get();

                    if (count($data_email)){
                        $message_2 = "
                                    Dear Customer,<br/><br/>

                                    User ".$data->assignee." - ".$userinfo['name']." telah menambahkan pesan baru pada ticket dengan nomor : ".$data->no_ticket." <br/><br/>
                                    Pesan : ".$request->komentar."<br/><br/>
                                    
                                    Terima kasih<br/><br/>

                                    URL Ticket : <a href='".url('backend/ticket/'.$data->id.'/edit')."'>".url('backend/ticket/'.$data->id.'/edit')."</a><br/><br/>

                                    
                                    <b>Harap jangan balas email ini karena kami tidak dapat menanggapi pesan yang dikirim ke alamat email ini</b>.";
        
                        $email = $data_email[0]->email;
                        $email_to = array_filter(explode(";", $email));

                        foreach ($email_to as $email):
                            \Mail::send([], [], function ($message) use ($email, $data, $message_2) {
                                $message->to(trim($email))
                                ->subject('(AVIA Ticket) Ticket nomor '.$data->no_ticket.' terdapat pesan baru')
                                ->setBody($message_2, 'text/html');
                            });    
                        endforeach;

                    }
                }
            }


        }
        return Redirect::to('/backend/ticket/')->with('success', "Data saved successfully")->with('mode', 'success');        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
		$data = Ticket::find($id);
		$userinfo = Session::get('userinfo');
		if($userinfo['priv'] == "VSUPER"){
			$data->active = 0;
			$data->user_modified = Session::get('userinfo')['username'];
			if($data->save()){
				Session::flash('success', 'Data deleted successfully');
				Session::flash('mode', 'success');
				return new JsonResponse(["status"=>true]);
			}else{
				return new JsonResponse(["status"=>false]);
			}
		}
		return new JsonResponse(["status"=>false]);		

    }
	public function datatable() {
        $userinfo = Session::get('userinfo');
        $tipe = 999;
        $noPP = "";
        $noPO = "";
        $noPB = "";
        $status = 999;
        $closeby = 999;
        $overdue = 999;
        $category = 999;
        $assignee = 999;
    	$startDate = "01"."-".date('m-Y');
        $endDate = date('d-m-Y');
        $mode = "limited";
        $user_type = 999;
        $user_agen = 999;
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
			if (isset($_GET["mode"])){
				$mode = $_GET['mode'];
            }
			if (isset($_GET["user_type"])){
				$user_type = $_GET['user_type'];
            }
			if (isset($_GET["user_agen"])){
				$user_agen = $_GET['user_agen'];
            }
			if (isset($_GET["tipe"])){
				$tipe = $_GET['tipe'];
            }
			if (isset($_GET["noPP"])){
				$noPP = $_GET['noPP'];
            }
			if (isset($_GET["noPO"])){
				$noPO = $_GET['noPO'];
            }
			if (isset($_GET["noPB"])){
				$noPB = $_GET['noPB'];
            }
        }

        $data = Ticket::select(['ticket.*','category.category','user_ticket.name','user_ticket.area',DB::raw('IFNULL(assignee.name, ticket.assignee) as assignee')])
                ->leftJoin('user_ticket','user_ticket.username','=','ticket.reldag')
                ->leftJoin('user_ticket as assignee','assignee.username','=','ticket.assignee')
                ->leftJoin('category','ticket.category_id','=','category.id')
                ->where('ticket.active', '=', 1);
        // USER YANG BUAT TICKET
        if ($userinfo['priv'] == "USER"){
            $data = $data->where('ticket.reldag','=',$userinfo['reldag']);
        }

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

        if ($userinfo['priv'] == "USER"){
            $mode = "all";
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

        if ($user_type != 999){
            $data = $data->where('user_ticket.tipe','=',$user_type);
        }

        if ($user_agen != 999){
            $data = $data->where('ticket.reldag','=',$user_agen);
        }

        if ($tipe != 999){
            if ($tipe == 1){
                $data = $data->where('ticket.pembelian','=',$tipe)->where('ticket.created_at','>=','2020-07-01');
            } else 
            if ($tipe == 2){
                $data = $data->whereRaw('(ticket.pembelian = 1 and (ticket.noPP is not null or ticket.noPP <> "")) and ticket.created_at >= "2020-07-01"');
            } else 
            if ($tipe == 3){
                $data = $data->whereRaw('(ticket.pembelian = 1 and (ticket.noPP is null or ticket.noPP = "")) and ticket.created_at >= "2020-07-01"');
            }
        }

        if ($noPP != ""){
            $data = $data->whereRaw("ticket.noPP like '%".$noPP."%'");
        }
        if ($noPO != ""){
            $data = $data->whereRaw("ticket.noPO like '%".$noPO."%'");
        }
        if ($noPB != ""){
            $data = $data->whereRaw("ticket.noPB like '%".$noPB."%'");
        }

        return Datatables::of($data)
            ->editColumn('created_at', function($data){
                return date('d-m-Y H:i:s', strtotime($data->created_at));
            })
            ->editColumn('start', function($data){
                if ($data->start > 0){
                    return date('d-m-Y', strtotime($data->start));
                } else {
                    return "";
                }
            })
            ->editColumn('prioritas', function($data){
                $text = "";
                if ($data->prioritas == "30H"){
                    $text = "Minor";
                } else 
                if ($data->prioritas == "90H"){
                    $text = "Major";
                }
                return $text;
            })
            ->editColumn('tglPP', function($data){
                $tgl = explode(",", $data->tglPP);
                $tgl_cetak = "";
                foreach ($tgl as $tgl_detail):
                    if ($tgl_detail <> ""){
                        $tgl_cetak .= date("d-m-Y", strtotime($tgl_detail)).",";
                    }
                endforeach;
                if ($tgl_cetak <> "" ){
                    $tgl_cetak = substr($tgl_cetak,0,-1);
                }
                return $tgl_cetak;
            })
            ->editColumn('tglPO', function($data){
                $tgl = explode(",", $data->tglPO);
                $tgl_cetak = "";
                foreach ($tgl as $tgl_detail):
                    if ($tgl_detail <> ""){
                        $tgl_cetak .= date("d-m-Y", strtotime($tgl_detail)).",";
                    }
                endforeach;
                if ($tgl_cetak <> "" ){
                    $tgl_cetak = substr($tgl_cetak,0,-1);
                }
                return $tgl_cetak;
            })
            ->editColumn('tglPB', function($data){
                $tgl = explode(",", $data->tglPB);
                $tgl_cetak = "";
                foreach ($tgl as $tgl_detail):
                    if ($tgl_detail <> ""){
                        $tgl_cetak .= date("d-m-Y", strtotime($tgl_detail)).",";
                    }
                endforeach;
                if ($tgl_cetak <> "" ){
                    $tgl_cetak = substr($tgl_cetak,0,-1);
                }
                return $tgl_cetak;
            })
			->addColumn('action', function ($data) {
				$url_edit = url('backend/ticket/'.$data->id.'/edit');
				$url = url('backend/ticket/'.$data->id);
				$view = "<a class='btn-action btn btn-primary btn-view' href='".$url."' title='View'><i class='fa fa-eye'></i></a>";
				$edit = "<a class='btn-action btn btn-info btn-edit' href='".$url_edit."' title='Edit'><i class='fa fa-edit'></i></a>";
                $delete = "<button data-url='".$url."' onclick='deleteData(this)' class='btn-action btn btn-danger btn-delete' title='Delete'><i class='fa fa-trash-o'></i></button>";
                $view = "";
                $userinfo = Session::get('userinfo');
                if ($userinfo['priv'] != "VSUPER"){
                    $delete = "";
                }
                $delete = "";
				return $view." ".$edit." ".$delete;
            })			
            ->rawColumns(['action'])
            ->make(true);
	}

	public function datatable_log($id) {
        $data = Comment::where('ticket_id', '=', $id)->where('type','=','log');
        return Datatables::of($data)
            ->editColumn('created_at', function($data){
                return date('d-m-Y H:i:s', strtotime($data->created_at));
            })
			->editColumn('comment', function ($data) {
                return $data->username." ".$data->comment;
            })			
            ->make(true);
	}

	public function datatable_comment($id) {
        $data = Comment::select(['comment.*','user_ticket.name'])->leftJoin('user_ticket','user_ticket.username','comment.username')
                ->where('ticket_id', '=', $id)->where('type','=','comment');
        return Datatables::of($data)
            ->editColumn('comment', function($data){
                return nl2br(strip_tags($data->comment));
            })
            ->editColumn('attachment', function($data){
                $url = url('/upload/files/'.$data->attachment);
                return "<a target='_blank' href='".$url."'>".$data->attachment."</a>";
            })
            ->editColumn('created_at', function($data){
                return date('d-m-Y H:i:s', strtotime($data->created_at));
            })
            ->rawColumns(['attachment','comment'])
            ->make(true);
	}


	public function close_ticket($id) {
        $userinfo = Session::get('userinfo');
        $data = Ticket::find($id);

        // jika user yang bikin yang close ticket
        if ($userinfo['username'] == $data->user_created){
            //cek jika user yang nutup sama dengan user yang buat
            if ($data->user_created == $userinfo['username']){
                $data->status = 4;
                $data->user_close = $userinfo['username'];
                $data->close_date = date('Y-m-d H:i:s');
                $data->save();

                //kirim email
                $data_email = UserTicket::where('username','=',$data->assignee)->get();
                
                //ambil nama creator
                $yang_buat = "";
                $creator = UserTicket::where('username', $data->user_created)->first();
                if ($creator){
                    $yang_buat = $creator->name;
                }

                if (count($data_email)){
                    $message_2 = "
                                User ".$data->user_created." - ".$yang_buat." telah menutup ticket dengan nomor : ".$data->no_ticket." <br/><br/>
                                
                                Terima kasih<br/><br/>
                                
                                <b>Harap jangan balas email ini karena kami tidak dapat menanggapi pesan yang dikirim ke alamat email ini</b>.";

                    if (strpos($data_email[0]->email, 'avian.com') !== false) {
                        $backup = \Mail::getSwiftMailer();

                        // Setup your gmail mailer
                        $transport = new Swift_SmtpTransport('192.168.110.112', 587);
                        $transport->setUsername('info@avian.com');
                        $transport->setPassword('123456789012345');
                        // Any other mailer configuration stuff needed...
                    
                        $gmail = new Swift_Mailer($transport);
                    
                        // Set the mailer as gmail
                        \Mail::setSwiftMailer($gmail);

                        // Send your message
                        \Mail::send([], [], function ($message) use ($data_email, $data, $message_2) {
                            $message->to(trim($data_email[0]->email))
                            ->subject('(AVIA Ticket) Ticket nomor '.$data->no_ticket.' telah ditutup')
                            ->setBody($message_2, 'text/html');
                        });

                        // Restore your original mailer
                        \Mail::setSwiftMailer($backup);
                    } else {
                        \Mail::send([], [], function ($message) use ($data_email, $data, $message_2) {
                            $message->to(trim($data_email[0]->email))
                            ->subject('(AVIA Ticket) Ticket nomor '.$data->no_ticket.' telah ditutup')
                            ->setBody($message_2, 'text/html');
                        });
                    }
                }
            }
        } else 
        if (($userinfo['priv'] == "VADM") || ($userinfo['priv'] == "VSUPER")){
            //jika admin yang close ticket
            $data->status = 3;
            $data->user_request_close = $userinfo['username'];
            $data->request_close_date = date('Y-m-d H:i:s');
            $data->save();

            //kirim email
            $data_email = UserTicket::where('username','=',$data->user_created)->get();

            //ambil nama assignee
            $yang_ngerjakan = "";
            $assignee = UserTicket::where('username', $data->assignee)->first();
            if ($assignee){
                $yang_ngerjakan = $assignee->name;
            }

            if (count($data_email)){
                $message_2 = "
                            Dear Customer,<br/><br/>

                            User ".$yang_ngerjakan." telah mengajukan penutupan ticket dengan nomor : ".$data->no_ticket." <br/><br/>
                            
                            Dalam 2 hari ke depan, system akan menutup ticket secara otomatis jika customer tidak menutup ticket tersebut<br/><br/>
                            
                            Terima kasih<br/><br/>
                            
                            <b>Harap jangan balas email ini karena kami tidak dapat menanggapi pesan yang dikirim ke alamat email ini</b>.";


                $email = $data_email[0]->email;
                $email_to = array_filter(explode(";", $email));

                foreach ($email_to as $email):

                    if (strpos($data_email[0]->email, 'avian.com') !== false) {
                        $backup = \Mail::getSwiftMailer();

                        // Setup your gmail mailer
                        $transport = new Swift_SmtpTransport('192.168.110.112', 587);
                        $transport->setUsername('info@avian.com');
                        $transport->setPassword('123456789012345');
                        // Any other mailer configuration stuff needed...
                    
                        $gmail = new Swift_Mailer($transport);
                    
                        // Set the mailer as gmail
                        \Mail::setSwiftMailer($gmail);

                        // Send your message
                        \Mail::send([], [], function ($message) use ($email, $data, $message_2) {
                            $message->to(trim($email))
                            ->subject('(AVIA Ticket) Ticket nomor '.$data->no_ticket.' telah diajukan untuk ditutup')
                            ->setBody($message_2, 'text/html');
                        });    

                        // Restore your original mailer
                        \Mail::setSwiftMailer($backup);
                    } else {
                        \Mail::send([], [], function ($message) use ($email, $data, $message_2) {
                            $message->to(trim($email))
                            ->subject('(AVIA Ticket) Ticket nomor '.$data->no_ticket.' telah diajukan untuk ditutup')
                            ->setBody($message_2, 'text/html');
                        });    
                    }
                endforeach;
            }
            
        }
        return Redirect::to('/backend/ticket/')->with('success', "Data saved successfully")->with('mode', 'success');        
	}
    

}
