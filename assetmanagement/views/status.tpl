% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
  <tr>
      <td style="vertical-align: top">
          % include('sidemenu.tpl')
      </td>
      <td>
          <article>
              <h4>Status</h4>
              <p>This option will be where you have to put the status of an
              asset (ex. Scrap, Under Repair, Active, Inactive). You may edit
              create new, and delete if you have the administrative privilage.</p>
          </article>
          <table class="listusers">
            <tr>
                <th>Status ID:</th>
                <th>Status:</th>
                <th>Delete/Edit</th>
            </tr>
            % if len(data) != 0:
            % for status in data:
            <tr>
                <td>{{status[0]}}</td>
                <td>{{status[1]}}</td>
                <td><a href="#">Delete</a>/<a href="#">Edit</a></td>
            </tr>
            % end
            % else:
            <tr>
              <td colspan="3">No status currently available.</td>
            </tr>
            % end
            </table>
          <br>
          <a href="/addstatus" class="cust_button">Add Status</a>
      </td>
  </tr>
</table>
% include('footer.tpl')
