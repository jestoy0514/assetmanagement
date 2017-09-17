% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
  <tr>
      <td>
          % include('sidemenu.tpl')
      </td>
      <td>
      <h3>New User</h3>
      <form action="/adduser" method="post">
      <table>
        <tr>
          <td>Username:</td>
          <td><input name="username" type="text"></td>
        </tr>
        <tr>
          <td>Password:</td>
          <td><input name="password" type="password"></td>
        </tr>
        <tr>
          <td>First Name:</td>
          <td><input name="firstname" type="text"></td>
        </tr>
        <tr>
          <td>Last Name:</td>
          <td><input name="lastname" type="text"></td>
        </tr>
        <tr>
          <td>E-mail:</td>
          <td><input name="email" type="email"></td>
        </tr>
        <tr>
          <td><input style="padding: 5px 10px; font-family: AnticSlab;" value="Add User" type="submit"></td>
        </tr>
      </table>
      </form>
      </td>
</tr>
</table>
% include('footer.tpl')
