<table>
    <thead>
        <tr>
            <th><b>Status</b></th>
            <th><b>Ticket No</b></th>
            <th><b>Requester</b></th>
            <th><b>Title</b></th>
            <th><b>Description</b></th>
            <th><b>Request Date</b></th>
            <th><b>Category</b></th>
            <th><b>Priority</b></th>
            <th><b>Start Date</b></th>
            <th><b>Assignee</b></th>
            <th><b>Answer by</b></th>
            <th><b>Request Close</b></th>
            <th><b>Request Close by</b></th>
            <th><b>Close</b></th>
            <th><b>Close by</b></th>
            <th><b>Overdue</b></th>
        </tr>
    </thead>
    <tbody>
    @foreach($data as $item)
        <tr>
            <td>{{ $item->Setatus }}</td>
            <td>{{ $item->Ticket_No }}</td>
            <td>{{ $item->Requester }}</td>
            <td>{{ $item->Title }}</td>
            <td>{{ $item->Description }}</td>
            <td>{{ $item->Request_Date }}</td>
            <td>{{ $item->Category }}</td>
            <td>{{ $item->Priority }}</td>
            <td>{{ $item->Start_Date }}</td>
            <td>{{ $item->Assignee }}</td>
            <td>{{ $item->Answer_By }}</td>
            <td>{{ $item->Request_Close_Date }}</td>
            <td>{{ $item->Request_Close_By }}</td>
            <td>{{ $item->Close_Date }}</td>
            <td>{{ $item->Close_By }}</td>
            <td>
                <?php
                    $overdue = '';
                    if ($item->overdue < 0){
                        $overdue = "<span class='red'><b>".abs($item->overdue)."</b></span>";
                    } else 
                    if (($item->overdue_2 < 0) && ($item->status < 4)) {
                        $overdue = "<span class='red'><b>".abs($item->overdue_2)."</b></span>";
                    }
                    echo $overdue;
                ?>
            </td>
        </tr>
    @endforeach
    </tbody>
</table>