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
              <h4>User Management</h4>
              <p>This page allow user with administrative rights to manage the users.
              It supplies a list of user's name, email, department and some options
              to delete or edit selected users, manage their passwords and so forth.</p>
          </article>
          <table class="listusers">
            <tr>
                <th>Username</th>
                <th>Full Name</th>
                <th>E-mail</th>
                <th>Delete/Edit</th>
            </tr>
            % if len(data) != 0:
            % for user in data:
            <tr>
                <td>{{user[1]}}</td>
                % name = " ".join([user[3], user[4]])
                <td>{{name}}</td>
                <td>{{user[5]}}</td>
                <td><a href="/users/delete/{{user[0]}}" style="color: red">Delete</a>
                /<a href="/users/edit/{{user[0]}}" style="color: red">Edit</a></td>
            </tr>
            % end
            % else:
            <tr>
              <td>No user currently available.</td>
            </tr>
            % end
            </table>
          <br>
          <a href="/adduser" class="cust_button">Add New User</a>
      </td>
  </tr>
</table>
% include('footer.tpl')
