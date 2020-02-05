<?php
	$breadcrumb = [];
	$breadcrumb[0]['title'] = 'Dashboard';
	$breadcrumb[0]['url'] = url('backend/dashboard');
?>

<!-- LAYOUT -->
@extends('backend.layouts.main')

<!-- TITLE -->
@section('title', 'Dashboard')

<!-- CONTENT -->
@section('content')
    <div class="page-title">
        <div class="title_left">
            <h3>Dashboard</h3>
        </div>
        <div class="title_right">
        </div>
    </div>
    <div class="clearfix"></div>
    @include('backend.elements.breadcrumb',array('breadcrumb' => $breadcrumb))	
    <div class="row">
        <div class="col-xs-12">
            <div class="row top_tiles">
                <div class="animated flipInY col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="tile-stats">
                        <div class="icon"><i class="fa fa-ticket"></i></div>
                        <div class="count">
                            <?php
                                if ($total_ticket < 1000){
                                    echo $total_ticket;
                                } else {
                                    echo number_format($total_ticket / 1000,2,',','.')."K";
                                }
                            ?>
                        </div>
                        <h3>Total Ticket</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div class="row top_tiles">
                <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="tile-stats">
                        <div class="icon"><i class="fa fa-ticket"></i></div>
                        <div class="count">
                            <?php
                                if ($open_ticket < 1000){
                                    echo $open_ticket;
                                } else {
                                    echo number_format($open_ticket / 1000,2,',','.')."K";
                                }
                                if ($total_ticket > 0){
                                    echo "<span style='font-size:13px'> (".number_format(($open_ticket / $total_ticket) * 100,2,',','.')."%)</span>";
                                } else {
                                    echo "<span style='font-size:13px'> (0%)</span>";
                                }
                            ?>
                        </div>
                        <h3>OPEN</h3>
                    </div>
                </div>
                <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="tile-stats">
                        <div class="icon"><i class="fa fa-ticket"></i></div>
                        <div class="count">
                            <?php
                                if ($assign_ticket < 1000){
                                    echo $assign_ticket;
                                } else {
                                    echo number_format($assign_ticket / 1000,2,',','.')."K";
                                }
                                if ($total_ticket > 0){
                                    echo "<span style='font-size:13px'> (".number_format(($assign_ticket / $total_ticket) * 100,2,',','.')."%)</span>";
                                } else {
                                    echo "<span style='font-size:13px'> (0%)</span>";
                                }
                            ?>
                        </div>
                        <h3>ASSIGN</h3>
                    </div>
                </div>
                <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="tile-stats">
                        <div class="icon"><i class="fa fa-ticket"></i></div>
                        <div class="count">
                            <?php
                                if ($request_ticket < 1000){
                                    echo $request_ticket;
                                } else {
                                    echo number_format($request_ticket / 1000,2,',','.')."K";
                                }
                                if ($total_ticket > 0){
                                    echo "<span style='font-size:13px'> (".number_format(($request_ticket / $total_ticket) * 100,2,',','.')."%)</span>";
                                } else {
                                    echo "<span style='font-size:13px'> (0%)</span>";
                                }
                            ?>
                        </div>
                        <h3>REQUEST CLOSE</h3>
                    </div>
                </div>
                <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="tile-stats">
                        <div class="icon"><i class="fa fa-ticket"></i></div>
                        <div class="count">
                            <?php
                                if ($close_ticket < 1000){
                                    echo $close_ticket;
                                } else {
                                    echo number_format($close_ticket / 1000,2,',','.')."K";
                                }
                                if ($total_ticket > 0){
                                    echo "<span style='font-size:13px'> (".number_format(($close_ticket / $total_ticket) * 100,2,',','.')."%)</span>";
                                } else {
                                    echo "<span style='font-size:13px'> (0%)</span>";
                                }
                            ?>
                        </div>
                        <h3>CLOSE</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br/>
    <div class="row">
        <div class="col-sm-12 col-xs-12">
            <div class="x_panel tile">
                <div class="x_title">
                    <h2>Total Ticket per Category</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <h4>Category</h4>
                    <?php
                        foreach ($masalah as $item):
                            $percent = ($item->jumlah / $total_ticket) * 100;
                    ?>
                        <div class="widget_summary">
                            <div class="w_left w_55">
                                <?php
                                    $nama = $item->nama;
                                    if (is_null($item->nama)){
                                        $nama = "UNDEFINED";
                                    }
                                ?>
                                <b><span><?=strtoupper($nama);?></span></b>
                            </div>
                            <div class="w_center w_25">
                                <div class="progress">
                                    <div class="progress-bar bg-green" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: <?=$percent;?>%;">
                                        <span class="sr-only"><?=$percent;?>% Complete</span>
                                    </div>
                                </div>
                            </div>
                            <div class="w_right w_20">
                                <span>
                                    <?php
                                        if ($item->jumlah < 1000){
                                            echo $item->jumlah;
                                        } else {
                                            echo number_format(($item->jumlah / 1000),2,',','.')."K";
                                        }
                                    ?>
                                </span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    <?php
                        endforeach;
                    ?>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-xs-12">
            <div class="x_panel tile">
                <div class="x_title">
                    <h2>Total Ticket per Assignee</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <h4>Assignee</h4>
                    <?php
                        foreach ($masalah_assignee as $item):
                            $percent = ($item->jumlah / $total_ticket) * 100;
                    ?>
                        <div class="widget_summary">
                            <div class="w_left w_55">
                                <?php
                                    $nama = $item->nama;
                                    if (is_null($item->nama)){
                                        $nama = "UNDEFINED";
                                    }
                                ?>
                                <b><span><?=strtoupper($nama);?></span></b>
                            </div>
                            <div class="w_center w_25">
                                <div class="progress">
                                    <div class="progress-bar bg-green" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: <?=$percent;?>%;">
                                        <span class="sr-only"><?=$percent;?>% Complete</span>
                                    </div>
                                </div>
                            </div>
                            <div class="w_right w_20">
                                <span>
                                    <?php
                                        if ($item->jumlah < 1000){
                                            echo $item->jumlah;
                                        } else {
                                            echo number_format(($item->jumlah / 1000),2,',','.')."K";
                                        }
                                    ?>
                                </span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    <?php
                        endforeach;
                    ?>
                </div>
            </div>
        </div>
    </div>
@endsection

<!-- CSS -->
@section('css')

@endsection

<!-- JAVASCRIPT -->
@section('script')

@endsection