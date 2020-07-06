<?php
	$userinfo = Session::get('userinfo');
	$breadcrumb = [];
	$breadcrumb[0]['title'] = 'Dashboard';
	$breadcrumb[0]['url'] = url('backend/dashboard');
	$breadcrumb[1]['title'] = 'Ticket';
	$breadcrumb[1]['url'] = url('backend/ticket');
?>

<!-- LAYOUT -->
@extends('backend.layouts.main')

<!-- TITLE -->
@section('title', 'Ticket')

<!-- CONTENT -->
@section('content')
	<div class="page-title">
		<div class="title_left">
			<h3>Ticket</h3>
		</div>
		<div class="title_right">
			<div class="col-md-4 col-sm-4 col-xs-8 form-group pull-right top_search">
                <a href="<?=url('/backend/ticket/create');?>" class="btn-index btn btn-primary btn-block" title="Add"><i class="fa fa-plus"></i>&nbsp; Add</a>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	@include('backend.elements.breadcrumb',array('breadcrumb' => $breadcrumb))	
	<div class="row">
		<div class="col-xs-12">
			<div class="x_panel">
				<div class="x_content">
					@include('backend.elements.notification')
					<?php
						if ($userinfo['priv'] == "USER"):
					?>
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
                                Tipe
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <select name="tipe" class="form-control">
                                    <?php
                                        $selected = "";
                                        if ($tipe == 999){
                                            $selected = "selected";
                                        }
                                    ?>
                                    <option value="999" <?=$selected;?>>All</option>
                                    <?php
                                        $selected = "";
                                        if ($tipe == 1){
                                            $selected = "selected";
                                        }
                                    ?>
                                    <option value="1" <?=$selected;?>>Semua Pembelian</option>
                                    <?php
                                        $selected = "";
                                        if ($tipe == 2){
                                            $selected = "selected";
                                        }
                                    ?>
                                    <option value="2" <?=$selected;?>>Pembelian yang sudah PP</option>
                                    <?php
                                        $selected = "";
                                        if ($tipe == 3){
                                            $selected = "selected";
                                        }
                                    ?>
                                    <option value="3" <?=$selected;?>>Pembelian yang belum PP</option>
                                </select>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-xs-12 col-sm-1 text-right" style="margin-top:7px;">
                                No PP
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <input type="text" class="form-control" name="noPP" value = "<?=$noPP;?>">
                            </div>
                            <div class="col-xs-12 col-sm-1 text-right" style="margin-top:7px;">
                                No PO
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <input type="text" class="form-control" name="noPO" value = "<?=$noPO;?>">
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-xs-12 col-sm-1 text-right" style="margin-top:7px;">
                                No PB
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <input type="text" class="form-control" name="noPB" value = "<?=$noPB;?>">
                            </div>
                            <div class="col-xs-12 col-sm-2 col-sm-offset-1">
                                <input type="submit" class="btn btn-primary btn-block" value="Submit">
                            </div>
                        </div>
                    </form>
					<?php
						endif;
					?>
					<?php
						if (($userinfo['priv'] == "VADM") || ($userinfo['priv'] == "VSUPER")):
					?>
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
                                Tipe
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <select name="tipe" class="form-control">
                                    <?php
                                        $selected = "";
                                        if ($tipe == 999){
                                            $selected = "selected";
                                        }
                                    ?>
                                    <option value="999" <?=$selected;?>>All</option>
                                    <?php
                                        $selected = "";
                                        if ($tipe == 1){
                                            $selected = "selected";
                                        }
                                    ?>
                                    <option value="1" <?=$selected;?>>Semua Pembelian</option>
                                    <?php
                                        $selected = "";
                                        if ($tipe == 2){
                                            $selected = "selected";
                                        }
                                    ?>
                                    <option value="2" <?=$selected;?>>Pembelian yang sudah PP</option>
                                    <?php
                                        $selected = "";
                                        if ($tipe == 3){
                                            $selected = "selected";
                                        }
                                    ?>
                                    <option value="3" <?=$selected;?>>Pembelian yang belum PP</option>
                                </select>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-xs-12 col-sm-1 text-right" style="margin-top:7px;">
                                No PP
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <input type="text" class="form-control" name="noPP" value = "<?=$noPP;?>">
                            </div>
                            <div class="col-xs-12 col-sm-1 text-right" style="margin-top:7px;">
                                No PO
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <input type="text" class="form-control" name="noPO" value = "<?=$noPO;?>">
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-xs-12 col-sm-1 text-right" style="margin-top:7px;">
                                No PB
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <input type="text" class="form-control" name="noPB" value = "<?=$noPB;?>">
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-xs-12 col-sm-1" style="margin-top:7px;">
                                Request Date
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
                        </div>
                    </form>
					<?php
						endif;
					?>
					<br/>
                    <p class="small blue">
                        Keterangan : Data PP yang ditampilkan berasal dari ticket yang dibuat per tanggal 1 Juli 2020
                    </p>
                    <table class="table table-striped table-hover table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>Status</th>
								<th>Action</th>
                                <th>Ticket No</th>
                                <th>Subject</th>
                                <th>FA Code</th>
								<th>Requester</th>
                                <th>Request Date</th>
                                <th>Start Date</th>
								<th>Category</th>
								<th>Assignee</th>
                                <th>Priority</th>
                                <th>No PP</th>
                                <th>Status PP</th>
                                <th>Tgl PP</th>
                                <th>No PO</th>
                                <th>Status PO</th>
                                <th>Tgl PO</th>
                                <th>No PB</th>
                                <th>Tgl PB</th>
							</tr>
						</thead>
					</table>
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
	<script src="<?=url('vendors/select2/dist/js/select2.min.js');?>"></script>
	<?php
		if ($userinfo['priv'] == "USER"):
	?>
	<script>
		$('.dataTable').dataTable({
			processing: true,
			serverSide: true,
			ajax: "<?=url('backend/ticket/datatable?status='.$status.'&tipe='.$tipe.'&noPO='.$noPO.'&noPP='.$noPP.'&noPB='.$noPB);?>",
			columns: [
				{data:  'status', render: function ( data, type, row ) {
					var text = "";
					var label = "";
					if (data == 1){
						text = "Open";
						label = "error";
					} else 
					if (data == 2){
						text = "Assign";
						label = "warning";
					} else 
					if (data == 3){
						text = "Request to Close";
						label = "info";
					} else 
					if (data == 4){
						text = "Close";
						label = "success";
					}
					return "<span class='badge badge-" + label + "'>"+ text + "</span>";
                }},				
				{data: 'action', name: 'action', orderable: false, searchable: false},
				{data: 'no_ticket', name: 'no_ticket'},
                {data: 'judul', name: 'judul'},
                {data: 'FACode', name: 'FACode'},
				{data: 'name', name: 'user_ticket.name'},
				{data: 'created_at', name: 'ticket.created_at'},
                {data: 'start', name: 'ticket.start'},
                {data: 'category', name: 'category.category'},
                {data: 'assignee', name: 'assignee'},
                {data: 'prioritas', name: 'prioritas'},
                {data: 'noPP', name: 'noPP', orderable: false, searchable: false},
                {data: 'statusPP', name: 'statusPP', orderable: false, searchable: false},
                {data: 'tglPP', name: 'tglPP', orderable: false, searchable: false},
                {data: 'noPO', name: 'noPO', orderable: false, searchable: false},
                {data: 'statusPO', name: 'statusPO', orderable: false, searchable: false},
                {data: 'tglPO', name: 'tglPO', orderable: false, searchable: false},
                {data: 'noPB', name: 'noPB', orderable: false, searchable: false},
                {data: 'tglPB', name: 'tglPB', orderable: false, searchable: false},
			],
			responsive: false,
            order : [[ 6, "desc" ]]
		});
	</script>
	<?php
		endif;
	?>
	<?php
		if (($userinfo['priv'] == "VADM") || ($userinfo['priv'] == "VSUPER") || ($userinfo['priv'] == "SLS") || ($userinfo['priv'] == "DSD")):
	?>
	<script>
		$('#user_agen').select2();

        $('#myDatepicker').datetimepicker({
            format: 'DD-MM-YYYY'
        });

        $('#myDatepicker2').datetimepicker({
            format: 'DD-MM-YYYY'
        });

		$('.dataTable').dataTable({
			processing: true,
			serverSide: true,
			ajax: "<?=url('backend/ticket/datatable?startDate='.$startDate.'&endDate='.$endDate.'&status='.$status.'&mode='.$mode.'&category='.$category.'&assignee='.$assignee.'&user_type='.$user_type.'&user_agen='.$user_agen.'&tipe='.$tipe.'&noPO='.$noPO.'&noPP='.$noPP.'&noPB='.$noPB);?>",
			columns: [
				{data:  'status', render: function ( data, type, row ) {
					var text = "";
					var label = "";
					if (data == 1){
						text = "Open";
						label = "error";
					} else 
					if (data == 2){
						text = "Assign";
						label = "warning";
					} else 
					if (data == 3){
						text = "Request to Close";
						label = "info";
					} else 
					if (data == 4){
						text = "Close";
						label = "success";
					}
					return "<span class='badge badge-" + label + "'>"+ text + "</span>";
                }},				
				{data: 'action', name: 'action', orderable: false, searchable: false},
				{data: 'no_ticket', name: 'no_ticket'},
                {data: 'judul', name: 'judul'},
                {data: 'FACode', name: 'FACode'},
				{data: 'name', name: 'user_ticket.name'},
				{data: 'created_at', name: 'ticket.created_at'},
                {data: 'start', name: 'ticket.start'},
                {data: 'category', name: 'category.category'},
                {data: 'assignee', name: 'assignee'},
                {data: 'prioritas', name: 'prioritas'},
                {data: 'noPP', name: 'noPP', orderable: false, searchable: false},
                {data: 'statusPP', name: 'statusPP', orderable: false, searchable: false},
                {data: 'tglPP', name: 'tglPP', orderable: false, searchable: false},
                {data: 'noPO', name: 'noPO', orderable: false, searchable: false},
                {data: 'statusPO', name: 'statusPO', orderable: false, searchable: false},
                {data: 'tglPO', name: 'tglPO', orderable: false, searchable: false},
                {data: 'noPB', name: 'noPB', orderable: false, searchable: false},
                {data: 'tglPB', name: 'tglPB', orderable: false, searchable: false}
			],
			responsive: false,
            order : [[ 6, "desc" ]]
		});
	</script>
	<?php
		endif;
	?>
@endsection