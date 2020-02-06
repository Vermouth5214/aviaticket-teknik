<?php
    $userinfo = Session::get('userinfo');

	$breadcrumb = [];
	$breadcrumb[0]['title'] = 'Dashboard';
	$breadcrumb[0]['url'] = url('backend/dashboard');
	$breadcrumb[1]['title'] = 'Ticket';
	$breadcrumb[1]['url'] = url('backend/ticket');	
	$breadcrumb[2]['title'] = 'Add';
	$breadcrumb[2]['url'] = url('backend/ticket/create');
	if (isset($data)){
		$breadcrumb[2]['title'] = 'Edit';
		$breadcrumb[2]['url'] = url('backend/ticket/'.$data[0]->id.'/edit');
	}
?>

<!-- LAYOUT -->
@extends('backend.layouts.main')

<!-- TITLE -->
@section('title')
	<?php
		$mode = "Create";
		if (isset($data)){
			$mode = "Edit";
		}
	?>
    Ticket - <?=$mode;?>
@endsection

<!-- CONTENT -->
@section('content')
    <?php
        $tanggal = date('d F Y');
        $judul = old('judul');
        $SPK = old('SPK');
        $nama_peminta = $userinfo['username']." - ".$userinfo['name'];
        $keterangan = old('keterangan');
        $attachment_1 = "";
        $attachment_2 = "";
        $attachment_3 = "";

        $prioritas = "";
        $start = date('d-m-Y');
        $assignee = "";
        $category = "";
        $assignee = $userinfo['username'];

        $method = "POST";
		$mode = "Create";
        $url = "backend/ticket/";
		if (isset($data)){
            $tanggal = date('d F Y', strtotime($data[0]->created_at));
            $no_ticket = $data[0]->no_ticket;
            $judul = $data[0]->judul;
            $SPK = $data[0]->SPK;
            $nama_peminta = $data[0]->user_created." - ".$data[0]->user->name;
            $keterangan = $data[0]->keterangan;
            $attachment_1 = $data[0]->attachment_1;
            $attachment_2 = $data[0]->attachment_2;
            $attachment_3 = $data[0]->attachment_3;

            $prioritas = $data[0]->prioritas;
            if (strtotime($data[0]->start) > 0){
                $start = date('d-m-Y', strtotime($data[0]->start));
            }

            $category = $data[0]->category_id;

            $assignee = $userinfo['username'];
            if (($data[0]->status == 1) && $userinfo['priv'] == "USER"){
                $assignee = "";
            }
            if (($data[0]->status == 1) && $userinfo['priv'] == "SLS"){
                $assignee = "";
            }
            if (($data[0]->status == 1) && $userinfo['priv'] == "DSD"){
                $assignee = "";
            }

            if (strlen($data[0]->assignee) > 0){
                $assignee = $data[0]->assignee;
            }

			$method = "PUT";
			$mode = "Edit";
            $url = "backend/ticket/".$data[0]->id;
        }
	?>

	<div class="page-title">
		<div class="title_left">
			<h3>Ticket - <?=$mode;?></h3>
		</div>
		<div class="title_right">
            <?php
                //jika mode edit dan status belum close
                $visible = true;
                if ((isset($data)) && ($data[0]->status != 4)):
                    //jika admin yang edit
                    if (($data[0]->status == 2) && (($userinfo['priv'] == "VSUPER")  || (($userinfo['priv'] == "VADM") && ($data[0]->assignee == $userinfo['username']) && (date('Y-m-d') >= date('Y-m-d',strtotime($data[0]->start))  ) ))):
                        $visible = false;
                ?>
                        <div class="col-md-3 col-sm-3 col-xs-4 form-group pull-right top_search hide">                
                            <a href="<?=url('backend/ticket/close/'.$data[0]->id);?>" id="close" class="btn btn-block btn-danger">Close</a>
                        </div>
                <?php
                    endif;
                //jika user yang bikin ticket
                    $text = "Close";
                    if (($data[0]->user_created == $userinfo['username']) && ($visible)):
                        if ($data[0]->status == 3){
                            $text = "Close";
                        }
                ?>
                        <div class="col-md-3 col-sm-3 col-xs-4 form-group pull-right top_search hide">                
                            <a href="<?=url('backend/ticket/close/'.$data[0]->id);?>" id="close" class="btn btn-block btn-danger"><?=$text;?></a>
                        </div>
                <?php
                    endif;                    
                endif;
            ?>
			<div class="col-md-3 col-sm-3 col-xs-4 form-group pull-right top_search">
                @include('backend.elements.back_button',array('url' => '/backend/ticket'))
			</div>
        </div>
        <div class="clearfix"></div>
		@include('backend.elements.breadcrumb',array('breadcrumb' => $breadcrumb))
	</div>
	<div class="clearfix"></div>
	<br/><br/>	
	<div class="row">
		<div class="col-xs-12">
			<div class="x_panel">
                <div class="x_title">
                    <h2>Request Form</h2>
                    <div class="clearfix"></div>
                </div>
				<div class="x_content">
                    @if ($errors->any())
                        <div class="row">
                            <div class="col-xs-12 alert alert-danger alert-dismissible" role="alert"">
                                @foreach ($errors->all() as $error)
                                    {{ $error }}<br/>  
                                @endforeach
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            </div>
                        </div>
                    @endif                    
					{{ Form::open(['id' => 'form-ticket','url' => $url, 'method' => $method,'class' => 'form-horizontal form-label-left', 'files' => true]) }}
                        {!! csrf_field() !!}
                        <?php
                            $disabled = "";
                            // JIKA MODE EDIT DISABLED SEMUA
                            if (isset($data)){
                                $disabled = "disabled";
                            }
                        ?>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Ticket No</label>
							<div class="col-sm-3 col-xs-12">
								<input type="text" name="no_ticket" class="form-control" value="<?=$no_ticket;?>" disabled>
							</div>
                        </div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Request Date</label>
							<div class="col-sm-3 col-xs-12">
                                <input type="text" class="form-control" value="<?=$tanggal;?>" disabled>
                            </div>
                        </div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Request Name</label>
							<div class="col-sm-7 col-xs-12">
                                <input type="text" class="form-control" value="<?=$nama_peminta;?>" disabled>
                            </div>
                        </div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Subject (*)</label>
							<div class="col-sm-7 col-xs-12">
                                <input required="required" <?=$disabled;?> type="text" name="judul"  class="form-control" value="<?=$judul;?>" autofocus>
							</div>
                        </div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">No SPK</label>
							<div class="col-sm-3 col-xs-12">
                                <input name="SPK" type="text" class="form-control" value="<?=$SPK;?>">
                            </div>
                        </div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Description (*)</label>
							<div class="col-sm-7 col-xs-12">
								<textarea required="required" <?=$disabled;?> rows=5 name="keterangan"  class="form-control"><?=$keterangan ;?></textarea>
							</div>
                        </div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Attachment 1</label>
							<div class="col-sm-4 col-xs-10">
                                <input <?=$disabled;?> type="file" name="attachment_1" class="form-control" capture="filesystem">
                                <?php
                                    if ($attachment_1 != ""):
                                ?>
                                    <a style="font-size:17px;font-weight:bold;" href="<?=url('upload/files/'.$attachment_1);?>" target='_blank'><i class="fa fa-paperclip" style="font-style:italic"> <?=$attachment_1;?></i></a>
                                <?php
                                    endif;
                                ?>
							</div>
                            <div class="col-sm-2 col-xs-2">
                                <a class="form-control btn btn-info" id="attach-1"><i class="fa fa-plus"></i>Add</a>
                            </div>
                        </div>
						<div class="form-group" id="fattach-2">
							<label class="control-label col-sm-3 col-xs-12">Attachment 2</label>
							<div class="col-sm-4 col-xs-10">
                                <input <?=$disabled;?> type="file" name="attachment_2" class="form-control" capture="filesystem">
                                <?php
                                    if ($attachment_2 != ""):
                                ?>
                                    <a style="font-size:17px;font-weight:bold;" href="<?=url('upload/files/'.$attachment_2);?>" target='_blank'><i class="fa fa-paperclip" style="font-style:italic"> <?=$attachment_2;?></i></a>
                                <?php
                                    endif;
                                ?>
							</div>
                            <div class="col-sm-2 col-xs-2">
                                <a class="form-control btn btn-info" id="attach-2"><i class="fa fa-plus"></i>Add</a>
                            </div>
                        </div>
						<div class="form-group" id="fattach-3">
							<label class="control-label col-sm-3 col-xs-12">Attachment 3</label>
							<div class="col-sm-4 col-xs-10">
                                <input <?=$disabled;?> type="file" name="attachment_3" class="form-control" capture="filesystem">
                                <?php
                                    if ($attachment_3 != ""):
                                ?>
                                    <a style="font-size:17px;font-weight:bold;" href="<?=url('upload/files/'.$attachment_3);?>" target='_blank'><i class="fa fa-paperclip" style="font-style:italic"> <?=$attachment_3;?></i></a>
                                <?php
                                    endif;
                                ?>
							</div>
                        </div>
                        <p class="small blue">
                            (*) Required<br/>
                            Maximum file size : 3Mb<br/>
                            File extension : jpg/jpeg, bmp, png, xls, xlsx, doc, docx, pdf, txt
                        </p>
                        <hr/>
                        <br/>
                        <?php
                            if (isset($data)):
                        ?>
                        <h2>Response</h2>
                        <hr/>
                        <?php
                            //JIKA USER BIASA JAWABAN COMPLAIN DISABLE
                            $disabled = "";
                            if (($userinfo['priv'] == "USER") || ($data[0]->status > 1)) {
                                $disabled = "disabled";   
                            }

                            if (($userinfo['priv'] == "SLS") || ($data[0]->status > 1)) {
                                $disabled = "disabled";   
                            }

                            if (($userinfo['priv'] == "DSD") || ($data[0]->status > 1)) {
                                $disabled = "disabled";   
                            }

                            if (($userinfo['priv'] == "VSUPER") && ($data[0]->status != 4)){
                                $disabled = "";
                            }
                            $disabled = "disabled";
                        ?>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Category</label>
							<div class="col-sm-3 col-xs-12">
								{{
                                    Form::select(
                                        'category',
                                        $list_category,
                                        $category,
                                        array(
                                            'class' => 'form-control',
                                            'required' => 'required',
                                            $disabled
                                        ))
								}}								
							</div>
                        </div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Priority</label>
							<div class="col-sm-2 col-xs-12">
								{{
                                    Form::select(
                                        'prioritas',
                                        ['' => '', '3H' => 'Minor', '9H' => 'Major'],
                                        $prioritas,
                                        array(
                                            'class' => 'form-control',
                                            'required' => 'required',
                                            $disabled
                                        ))
								}}								
							</div>
                        </div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Start Date</label>
                            <div class="col-xs-12 col-sm-3 date">
                                <div class='input-group date' id='myDatepicker'>
                                    <input <?=$disabled;?> type='text' class="form-control" name="start" value=<?=$start;?> />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                        </div>
						<div class="form-group">
							<label class="control-label col-sm-3 col-xs-12">Assignee</label>
							<div class="col-sm-3 col-xs-12">
                                <?php 
                                    if ($userinfo['priv'] == "VSUPER"){
                                ?>
								{{
                                    Form::select(
                                        'assignee',
                                        $list_assignee,
                                        $assignee,
                                        array(
                                            'class' => 'form-control',
                                            'required' => 'required',
                                            $disabled
                                        ))
                                }}
                                <?php
                                    } else {
                                ?>
                                    <input disabled type='text' class="form-control" value='<?=$assignee;?>' />
                                <?php
                                    }
                                ?>
							</div>
                        </div>
                        <hr/>
                        <?php
                            endif;
                        ?>
						<div class="ln_solid"></div>
						<div class="form-group">
							<div class="col-sm-12 col-xs-12 text-right">
								<a href="<?=url('/backend/ticket')?>" class="btn btn-warning" style="min-width : 120px">&nbspCancel</a>
                                <?php
                                    if ((isset($data)) && ($data[0]->status == 4)){


                                    } else {
                                ?>
								<button type="submit" class="btn btn-primary btn-submit" style="min-width : 120px">Submit </button>
                                <?php
                                    }
                                ?>
							</div>
						</div>
					{{ Form::close() }}
				</div>
			</div>
		</div>
	</div>
@endsection

<!-- CSS -->
@section('css')
    <style>
        .blue{
            color : red;
            font-weight: bold;
            font-size : 13px;
        }
    </style>
@endsection

<!-- JAVASCRIPT -->
@section('script')
    <script>
        $('#myDatepicker').datetimepicker({
            format: 'DD-MM-YYYY'
        });

        $("#form-ticket").on('submit', function(e){
            if (confirm("Are you sure you want to submit this ticket?")) {
                $('.btn-submit').prop('disabled', true);
                $('.btn-submit').html('Processing');
                return true;
            }
            return false;
        })

        <?php
            if (isset($data)):
        ?>
        $('.dataTable_log').dataTable({
            processing: true,
            serverSide: true,
            ajax: "<?=url('backend/ticket/log/datatable/'.$data[0]->id);?>",
            columns: [
                {data: 'created_at', name: 'created_at'},
                {data: 'comment', name: 'comment'}
            ],
            responsive: true,
            order : [[ 0, "desc" ]]
        });
        $('.dataTable_comment').dataTable({
            processing: true,
            serverSide: true,
            ajax: "<?=url('backend/ticket/comment/datatable/'.$data[0]->id);?>",
            columns: [
                {data: 'created_at', name: 'created_at'},
                {data: 'name', name: 'name'},
                {data: 'comment', name: 'comment'},
                {data: 'attachment', name: 'attachment'},
            ],
            responsive: true,
            order : [[ 0, "desc" ]]
        });
        <?php
            endif;
        ?>

        <?php
            if (!isset($data)):
        ?>
                $('#fattach-2').addClass('hide');
                $('#fattach-3').addClass('hide');
        <?php
            endif;
        ?>
        <?php
            if (isset($data)):
        ?>
                $('#attach-1').addClass('hide');
                $('#attach-2').addClass('hide');
                $('#attach-3').addClass('hide');
        <?php
            endif;
        ?>

        $('#attach-1').on('click', function(){
            $('#fattach-2').removeClass('hide');
            $('#attach-1').addClass('hide');
        });

        $('#attach-2').on('click', function(){
            $('#fattach-3').removeClass('hide');
            $('#attach-2').addClass('hide');
        });

        $('#close').on('click', function(){
            if (confirm("Are you sure you want to close this ticket?")) {
                return true;
            }
            return false;
        })
    </script>
@endsection