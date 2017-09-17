% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
  <tr>
      <td>
          % include('sidemenu.tpl')
      </td>
      <td>
      <h3>Update User</h3>
      <form action="/users/edit/{{user_id}}" method="post">
      <table>
        <tr>
          <td>Username:</td>
          <td><input name="username" type="text" value="{{data[1]}}"></td>
        </tr>
        <tr>
          <td>Password:</td>
          <td><input name="password" type="password"></td>
        </tr>
        <tr>
          <td>First Name:</td>
          <td><input name="firstname" type="text" value="{{data[3]}}"></td>
        </tr>
        <tr>
          <td>Last Name:</td>
          <td><input name="lastname" type="text" value="{{data[4]}}"></td>
        </tr>
        <tr>
          <td>E-mail:</td>
          <td><input name="email" type="email" value="{{data[5]}}"></td>
        </tr>
        <tr>
          <td><input style="padding: 5px 10px; font-family: AnticSlab;" value="Update" type="submit"></td>
        </tr>
      </table>
      </form>
      </td>
</tr>
</table>
% include('footer.tpl')
