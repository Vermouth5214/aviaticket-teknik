<?php
    $userinfo = Session::get('userinfo');
	$breadcrumb = [];
	$breadcrumb[0]['title'] = 'Dashboard';
	$breadcrumb[0]['url'] = url('backend/dashboard');
	$breadcrumb[1]['title'] = 'General Report';
    $breadcrumb[1]['url'] = url('backend/general-report');
    
?>

<!-- LAYOUT -->
@extends('backend.layouts.main')

<!-- TITLE -->
@section('title', 'General Report')

<!-- CONTENT -->
@section('content')
	<div class="page-title">
		<div class="title_left">
			<h3>General Report</h3>
		</div>
		<div class="title_right">
			<div class="col-md-4 col-sm-4 col-xs-8 form-group pull-right top_search">
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
    @include('backend.elements.breadcrumb',array('breadcrumb' => $breadcrumb))	
    <div class="row">
        <div class="col-xs-12">
            <div class="x_panel">
                <div class="x_content">
                <form id="form-work" class="form-horizontal" role="form" autocomplete="off" method="GET">
                        <div class="row">
                            <div class="col-xs-12 col-sm-1 text-right" style="margin-top:7px;">
                                Status
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <select name="status" class="form-control">
                                    <?php
                                        $selected = "";
                                        if ($status == 999){
                                            $selected = "selected";
                                        }
                                    ?>
                                    <option value="999" <?=$selected;?>>All</option>
                                    <?php
                                        $selected = "";
                                        if ($status == 1){
                                            $selected = "selected";
                                        }
                                    ?>
                                    <option value="1" <?=$selected;?>>Open</option>
                                    <?php
                                        $selected = "";
                                        if ($status == 2){
                                            $selected = "selected";
                                        }
                                    ?>
                                    <option value="2" <?=$selected;?>>Assign</option>
                                    <?php
                                        $selected = "";
                                        if ($status == 3){
                                            $selected = "selected";
                                        }
                                    ?>
                                    <option value="3" <?=$selected;?>>Request to Close</option>
                                    <?php
                                        $selected = "";
                                        if ($status == 4){
                                            $selected = "selected";
                                        }
                                    ?>
                                    <option value="4" <?=$selected;?>>Close</option>
                                </select>
                            </div>
                            <div class="col-xs-12 col-sm-1 text-right" style="margin-top:7px;">
                                Category
                            </div>
                            <div class="col-xs-12 col-sm-5">
								{{
								Form::select(
									'category',
									$category_list,
									$category,
									array(
                                        'class' => 'form-control',
									))
								}}
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-xs-12 col-sm-1 text-right" style="margin-top:7px;">
                                Assignee
                            </div>
                            <div class="col-xs-12 col-sm-5">
								{{
								Form::select(
									'assignee',
									$assignee_list,
									$assignee,
									array(
                                        'class' => 'form-control',
									))
								}}
                            </div>
                            <div class="col-xs-12 col-sm-1 text-right" style="margin-top:7px;">
                                User (Agen)
                            </div>
                            <div class="col-xs-12 col-sm-5">
								{{
                                    Form::select(
                                        'user_agen',
                                        $user_agen_list,
                                        $user_agen,
                                        array(
                                            'class' => 'form-control',
                                            'id' => 'user_agen'
                                        ))
								}}
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-xs-12 col-sm-1" style="margin-top:7px;">
                                Tanggal
                            </div>
                            <div class="col-xs-12 col-sm-3 date">
                                <div class='input-group date' id='myDatepicker'>
                                    <input type='text' class="form-control" name="startDate" value=<?=$startDate;?> />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 date">
                                <div class='input-group date' id='myDatepicker2'>
                                    <input type='text' class="form-control" name="endDate" value=<?=$endDate;?> />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-1 text-right">
                                <?php
                                    $checked = "";
                                    if ($mode == "all"){
                                        $checked = "checked";
                                    }
                                ?>
                                <div class="checkbox">
                                    <input type="checkbox" name="mode" value="all" id="show-all" <?=$checked;?>>Show all
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-2">
                                <input type="submit" class="btn btn-primary btn-block" name="submit" value="Submit">
                            </div>
                            <div class="col-xs-12 col-sm-2">
                                <input type="submit" class="btn btn-success btn-block" name="export" value="Export Excel">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	<div class="row">
		<div class="col-xs-12">
			<div class="x_panel">
				<div class="x_content">
                    @include('backend.elements.notification')
					<div class="row">
						<div class="col-xs-12">
							<span class="red">
								<ul>
									<li>
										Jika Assignee sudah mengajukan 'Request to Close' ticket dan Requester tidak melakukan penutupan ticket (close ticket) selama 2 hari, maka status ticket tersebut akan secara otomatis menjadi 'Close by system'
									</li>
								</ul>
							</span>
						</div>
					</div>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Status</th>
                                    <th>Ticket No</th>
                                    <th>Subject</th>
                                    <th>Requester</th>
                                    <th>Request Date</th>
                                    <th>Category</th>
                                    <th>Priority</th>
                                    <th>Start Date</th>
                                    <th>Assignee</th>
                                    <th>Answer by</th>
                                    <th>Request Close</th>
                                    <th>Request Close by</th>
                                    <th>Close</th>
                                    <th>Close by</th>
                                    <th>Comment (A:Assignee R:Requester)</th>                                    
                            </thead>
                        </table>
                    </div>
				</div>
			</div>
		</div>					
	</div>
@endsection

<!-- CSS -->
@section('css')
    <!-- select2 -->
    <link href="<?=url('vendors/select2/dist/css/select2.min.css');?>" rel="stylesheet">
@endsection

<!-- JAVASCRIPT -->
@section('script')
    <!-- select2 -->
    <script src="<?=url('vendors/select2/dist/js/select2.min.js');?>"></script>
	<script>
        $('#user_agen').select2();

        $('.dataTable').dataTable({
            processing: true,
            serverSide: true,
            ajax: "<?=url('backend/general-report-admin/datatable?startDate='.$startDate.'&endDate='.$endDate.'&status='.$status.'&mode='.$mode.'&category='.$category.'&assignee='.$assignee.'&closeby='.$closeby.'&overdue='.$overdue.'&user_type='.$user_type.'&user_agen='.$user_agen);?>",
            columns: [
                {data: 'status', name: 'status', orderable: false, searchable: false},
                {data: 'no_ticket', name: 'no_ticket'},
                {data: 'judul', name: 'judul'},
                {data: 'creator', name: 'creator'},
                {data: 'created_at', name: 'created_at'},
                {data: 'category', name: 'category'},
                {data: 'prioritas', name: 'prioritas'},
                {data: 'start', name: 'start'},
                {data: 'user_assignee', name: 'user_assignee'},
                {data: 'user_answer', name: 'user_answer'},
                {data: 'request_close_date', name: 'request_close_date'},
                {data: 'user_request', name: 'user_request'},
                {data: 'close_date', name: 'close_date'},
                {data: 'user_close', name: 'user_close'},
                {data: 'comment', name: 'comment', orderable: false, searchable: false},
            ],
            order : [[ 4, "desc" ]],
            responsive: false
        });

        $('#myDatepicker').datetimepicker({
            format: 'DD-MM-YYYY'
        });

        $('#myDatepicker2').datetimepicker({
            format: 'DD-MM-YYYY'
        });
	</script>
@endsection