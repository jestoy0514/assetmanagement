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
          <h4>Employee Management</h4>
          <p>This page allow user with administrative rights to manage the employee list.
          It supplies a list of employees, department and some options, file number to 
          delete or edit selected employees.</p>
      </article>
        <table class="listusers">
            <tr>
                <th>File Number</th>
                <th>Full Name</th>
                <th>Department</th>
                <th>Delete/Edit</th>
            </tr>
            % if len(data) != 0:
            % for emp in data:
            <tr>
                <td>{{emp[3]}}</td>
                <td>{{" ".join([emp[1], emp[2]])}}</td>
                % for dep in dept:
                % if emp[4] == dep[0]:
                <td>{{"-".join([dep[3], dep[1]])}}</td>
                % end
                % end
                <td><a href="#">Delete</a>/<a href="#">Edit</a></td>
            </tr>
            % end
            % else:
            <tr>
              <td colspan="4">No employee currently available.</td>
            </tr>
            % end
        </table>
        <br>
      <a href="/addemployee" class="cust_button">Add New</a>
  </td>
</tr>
</table>
% include('footer.tpl')
