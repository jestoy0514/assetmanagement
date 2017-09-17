% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
  <tr>
      <td>
          % include('sidemenu.tpl')
      </td>
      <td>
          <h3>New Department</h3>
          <form action="/adddepartment" method="post">
          <table>
            <tr>
              <td>Company:</td>
              <td><input name="com_name" type="text"></td>
            </tr>
            <tr>
              <td>Department:</td>
              <td><input name="dept_name" type="text"></td>
            </tr>
            <tr>
              <td>Room No.:</td>
              <td><input name="room" type="text"></td>
            </tr>
            <tr>
              <td><input value="Save Department" type="submit" /></td>
            </tr>
          </table>
      </td>
</tr>
</table>
% include('footer.tpl')
