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
              <h4>Manage Departments</h4>
              <p>This page shows all the available departents currently available.
              You can manipulate the list of departments is either add, delete or
              creating a new one. This will serve as the location for the asset so
              that it can easily create a report for location wise asset list.</p>
          </article>
          <table class="listusers">
              <tr>
                <th>Company</th>
                <th>Department Name</th>
                <th>Room No.</th>
                <th>Delete/Edit</th>
              </tr>
              % if len(data) != 0:
              % for dept in data:
              <tr>
                <td>{{dept[3]}}</td>
                <td>{{dept[1]}}</td>
                <td>{{dept[2]}}</td>
                <td><a href="#">Delete</a>/<a href="#">Edit</a></td>
             </tr>
             % end
             % else:
             <tr>
               <td colspan="4">No department available.</td>
             </tr>
             % end
          </table>
          <br>
          <a href="/adddepartment" class="cust_button">Add Department</a>
      </td>
  </tr>
</table>
% include('footer.tpl')
