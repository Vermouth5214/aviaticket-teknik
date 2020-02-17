<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use App\Model\Ticket;
use App\Model\UserTicket;


Route::get('/', function () {
	return redirect('backend/');
});


Route::get('/email-reminder', function () {
    $data = Ticket::where('status', '=', 2)->where('active', 1)->whereRaw('datediff(date_add(ticket.start, interval left(ticket.prioritas,2)-0 day), CURDATE()) = 0')->get();
    if (count($data)){
        foreach ($data as $item):
            $data_email = UserTicket::where('username','=',$item->user_jawab)->get();
            if (count($data_email)){
                $message_2 = "
                            Dear user ".$item->user_jawab."<br/><br/>

                            Hari ini adalah hari terakhir batas pengerjaan <br/>
                            Ticket dengan nomor : ".$item->no_ticket." <br/><br/>
                            
                            Harap segera dikerjakan sebelum terlambat<br/><br/>

                            URL Ticket : <a href='".url('backend/ticket/'.$item->id.'/edit')."'>".url('backend/ticket/'.$item->id.'/edit')."</a>
                            <br/><br/>
                            
                            Terima kasih";

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
                        ->subject('(Avia Ticket) Hari terakhir pengerjaan Ticket nomor '.$item->no_ticket)
                        ->setBody($message_2, 'text/html');
                    });
                    
                    // Restore your original mailer
                    \Mail::setSwiftMailer($backup);                
                } else {
                    \Mail::send([], [], function ($message) use ($data_email, $item, $message_2) {
                        $message->to(trim($data_email[0]->email))
                        ->subject('(Avia Ticket) Hari terakhir pengerjaan Ticket nomor '.$item->no_ticket)
                        ->setBody($message_2, 'text/html');
                    });
                }
            }
        endforeach;
    }
});

Route::get('/auto-close', function () {
    $data = Ticket::where('status', '=', 3)->get();
    if (count($data)){
        foreach ($data as $item):
            $date_request = date('Y-m-d', strtotime($item->request_close_date));
            $date_check = date('Y-m-d', strtotime($date_request. ' + 2 days'));
            $date_now = date('Y-m-d');
            if (strtotime($date_now) >= strtotime($date_check)){
                //close ticket by system
                $insert = Ticket::find($item->id);
                $insert->status = 4;
                $insert->close_date = date('Y-m-d H:i:s');
                $insert->user_close = 'system';
                if ($insert->save()){
                    //kirim email
                    $data_email = UserTicket::where('username','=',$insert->user_created)->get();
                    if (count($data_email)){
                        $message_2 = "
                                    Dear Customer,<br/><br/>
                                    Ticket anda dengan nomor : ".$insert->no_ticket." <br/>
                                    telah ditutup otomatis oleh system dikarenakan tidak ada respon selama 2 hari<br/>
                                    sejak adanya permintaan penutupan ticket<br/><br/>

                                    Terima kasih<br/><br/>
                                    
                                    Harap jangan balas email ini karena kami tidak dapat menanggapi pesan yang dikirim ke alamat email ini.";
        

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
                                ->subject('(Avia Ticket) Ticket nomor '.$insert->no_ticket.' telah ditutup oleh system')
                                ->setBody($message_2, 'text/html');
                            });
                            
                            // Restore your original mailer
                            \Mail::setSwiftMailer($backup);                
                        } else {
                            \Mail::send([], [], function ($message) use ($data_email, $item, $message_2) {
                                $message->to(trim($data_email[0]->email))
                                ->subject('(Avia Ticket) Ticket nomor '.$insert->no_ticket.' telah ditutup oleh system')
                                ->setBody($message_2, 'text/html');
                            });
                        }
                    }
                }
            }
        endforeach;
    }
});


Route::get('/backup-database', function () {
    $tables = false;
    $host = "localhost";
    $user = env('DB_USERNAME');
    $pass = env('DB_PASSWORD');
    $name = env('DB_DATABASE');
    $backup_path = 'backup/backup_'.date('l').'.sql';

	set_time_limit(3000); $mysqli = new mysqli($host,$user,$pass,$name); $mysqli->select_db($name); $mysqli->query("SET NAMES 'utf8'");
	$queryTables = $mysqli->query('SHOW TABLES'); while($row = $queryTables->fetch_row()) { $target_tables[] = $row[0]; }	if($tables !== false) { $target_tables = array_intersect( $target_tables, $tables); } 
	$content = "SET SQL_MODE = \"NO_AUTO_VALUE_ON_ZERO\";\r\nSET time_zone = \"+00:00\";\r\n\r\n\r\n/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;\r\n/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;\r\n/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;\r\n/*!40101 SET NAMES utf8 */;\r\n--\r\n-- Database: `".$name."`\r\n--\r\n\r\n\r\n";
	foreach($target_tables as $table){
		if (empty($table)){ continue; } 
		$result	= $mysqli->query('SELECT * FROM `'.$table.'`');  	$fields_amount=$result->field_count;  $rows_num=$mysqli->affected_rows; 	$res = $mysqli->query('SHOW CREATE TABLE '.$table);	$TableMLine=$res->fetch_row(); 
		$content .= "\n\n".$TableMLine[1].";\n\n";   $TableMLine[1]=str_ireplace('CREATE TABLE `','CREATE TABLE IF NOT EXISTS `',$TableMLine[1]);
		for ($i = 0, $st_counter = 0; $i < $fields_amount;   $i++, $st_counter=0) {
			while($row = $result->fetch_row())	{ //when started (and every after 100 command cycle):
				if ($st_counter%100 == 0 || $st_counter == 0 )	{$content .= "\nINSERT INTO ".$table." VALUES";}
					$content .= "\n(";    for($j=0; $j<$fields_amount; $j++){ $row[$j] = str_replace("\n","\\n", addslashes($row[$j]) ); if (isset($row[$j])){$content .= '"'.$row[$j].'"' ;}  else{$content .= '""';}	   if ($j<($fields_amount-1)){$content.= ',';}   }        $content .=")";
				//every after 100 command cycle [or at last line] ....p.s. but should be inserted 1 cycle eariler
				if ( (($st_counter+1)%100==0 && $st_counter!=0) || $st_counter+1==$rows_num) {$content .= ";";} else {$content .= ",";}	$st_counter=$st_counter+1;
			}
		} $content .="\n\n\n";
	}
	$content .= "\r\n\r\n/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;\r\n/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;\r\n/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;";
    $myfile =  fopen($backup_path, "w");
    fwrite($myfile, $content);
    fclose($myfile);
});

Route::match(array('GET','POST'),'/backend/login','Backend\LoginController@index');
//logout
Route::get('backend/logout','Backend\LoginController@logout');

/* SUPER ADMIN */
Route::group(array('prefix' => 'backend','middleware'=> ['token_super_admin']), function()
{
	Route::get('/setting','Backend\SettingController@index');
    Route::post('/setting','Backend\SettingController@update');

    Route::get('/user/datatable','Backend\UserTicketController@datatable');
    Route::resource('user', 'Backend\UserTicketController');

    Route::get('/category/datatable','Backend\CategoryController@datatable');
    Route::resource('category', 'Backend\CategoryController');

    Route::get('/assignee/datatable','Backend\AssigneeController@datatable');
    Route::resource('assignee', 'Backend\AssigneeController');

    Route::get('/general-report','Backend\ReportController@general_report');
    Route::get('/general-report/datatable','Backend\ReportController@general_report_datatable');
    Route::get('/general-report/export','Backend\ReportController@general_report_export');
});


/* REPORT SUPERADMIN, SLS DAN DSD */
Route::group(array('prefix' => 'backend','middleware'=> ['token_report']), function()
{
    Route::get('/general-report-admin','Backend\ReportAdminController@general_report');
    Route::get('/general-report-admin/datatable','Backend\ReportAdminController@general_report_datatable');
    Route::get('/general-report-admin/export','Backend\ReportAdminController@general_report_export');
});

/* ADMIN */
Route::group(array('prefix' => 'backend','middleware'=> ['token_admin']), function()
{
    Route::get('/dashboard','Backend\DashboardController@dashboard');

});


/* ADMIN DAN USER*/
Route::group(array('prefix' => 'backend','middleware'=> ['token_all']), function()
{
    Route::get('/user-guide', function () {
        $userinfo = Session::get('userinfo');
        if ($userinfo['tipe'] == "AD"){
            if (($userinfo['priv'] == "SLS") || ($userinfo['priv'] == "DSD")){
                return response()->file('upload/SOP Avia Ticket (SM).pdf');
            } else {
                return response()->file('upload/SOP Avia Ticket.pdf');
            }
        } else 
        if ($userinfo['tipe'] == "AGEN"){
            return response()->file('upload/SOP Avia Ticket (agent).pdf');
        }
    });

	Route::get('',function (){return Redirect::to('backend/dashboard');});

	Route::get('/ticket/close/{id}','Backend\TicketController@close_ticket');	
	Route::get('/ticket/log/datatable/{id}','Backend\TicketController@datatable_log');
	Route::get('/ticket/comment/datatable/{id}','Backend\TicketController@datatable_comment');
	Route::get('/ticket/datatable','Backend\TicketController@datatable');
    Route::resource('ticket', 'Backend\TicketController');

    Route::get('/change-password','Backend\ChangePasswordController@change_password');	
    Route::post('/change-password','Backend\ChangePasswordController@store_change_password');	
	
});