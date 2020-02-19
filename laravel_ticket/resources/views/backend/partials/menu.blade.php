<!-- sidebar menu -->
<?php
    $userinfo = Session::get('userinfo');
	$segment =  Request::segment(2);
    $sub_segment =  Request::segment(3);
?>
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <?php
        // SUPER ADMIN //
        if (($userinfo['priv'] == "VSUPER") || ($userinfo['priv'] == "VADM")):
    ?>
    <div class="menu_section">
		<ul class="nav side-menu">
			<li class="{{ ($segment == 'dashboard' ? 'active' : '') }}">
				<a href="<?=url('backend/dashboard');?>"><i class="fa fa-dashboard"></i> Dashboard</a>
			</li>
        </ul>
    </div>
    <?php
        endif;
    ?>

    <div class="menu_section">
        <h3>TICKET</h3>
		<ul class="nav side-menu">
            <?php
                //UBAH PASSWORD
                if ($userinfo['tipe'] == 'AGEN'):
            ?>
                    <li class="{{ ($segment == 'change-password' ? 'active' : '') }}">
                        <a href="<?=url('backend/change-password');?>"><i class="fa fa-ticket"></i> Change Password</a>
                    </li>
            <?php
                endif;
            ?>
			<li class="{{ ($segment == 'ticket' ? 'active' : '') }}">
				<a href="<?=url('backend/ticket');?>"><i class="fa fa-ticket"></i> Ticket</a>
			</li>
			<li class="{{ ($segment == 'user-guide' ? 'active' : '') }}">
				<a href="<?=url('backend/user-guide');?>" target="_blank"><i class="fa fa-question"></i> User Guide</a>
			</li>
        </ul>
    </div>

    <?php
        //REPORT
        if ($userinfo['priv'] == 'VSUPER'):
    ?>
        <div class="menu_section">
            <h3>REPORT</h3>
            <ul class="nav side-menu">
                <li class="{{ ($segment == 'general-report' ? 'active' : '') }}">
                    <a href="<?=url('backend/general-report');?>"><i class="fa fa-file"></i> General Report</a>
                </li>
            </ul>
        </div>
    <?php
        endif;
    ?>

<?php
        //REPORT
        if (($userinfo['priv'] == 'SLS') || ($userinfo['priv'] == 'DSD')):
    ?>
        <div class="menu_section">
            <h3>REPORT</h3>
            <ul class="nav side-menu">
                <li class="{{ ($segment == 'general-report-admin' ? 'active' : '') }}">
                    <a href="<?=url('backend/general-report-admin');?>"><i class="fa fa-file"></i> General Report</a>
                </li>
            </ul>
        </div>
    <?php
        endif;
    ?>

    <?php
        // SUPER ADMIN //
        if ($userinfo['priv'] == "VSUPER"):
    ?>
    <div class="menu_section">
        <h3>MASTER</h3>
		<ul class="nav side-menu">
            <li class="{{ ($segment == 'user' ? 'active' : '') }}">
                <a href="<?=url('backend/user');?>"><i class="fa fa-users"></i> Master User</a>
            </li>
            <li class="{{ ($segment == 'assignee' ? 'active' : '') }}">
                <a href="<?=url('backend/assignee');?>"><i class="fa fa-user"></i> Master Assignee</a>
            </li>
            <li class="{{ ($segment == 'category' ? 'active' : '') }}">
                <a href="<?=url('backend/category');?>"><i class="fa fa-folder-o"></i> Master Category</a>
            </li>
        </ul>
    </div>
    <?php
        endif;
    ?>
    <?php
        // SUPER ADMIN //
        if ($userinfo['priv'] == "VSUPER"):
    ?>
	<div class="menu_section">
        <h3>GENERAL</h3>
        <ul class="nav side-menu">
            <li class="{{ ($segment == 'setting' ? 'active' : '') }}">
                <a href="<?=url('backend/setting');?>"><i class="fa fa-cog"></i> Setting</a>
            </li>
        </ul>
    </div>
    <?php
        endif;
    ?>
</div>

