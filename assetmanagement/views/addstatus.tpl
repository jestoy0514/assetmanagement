% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
  <tr>
      <td>
          % include('sidemenu.tpl')
      </td>
      <td>
          <h3>New Status</h3>
          <form action="/addstatus" method="post">
          <table>
            <tr>
              <td>Status:</td>
              <td><input name="status" type="text"></td>
            </tr>
            <tr>
              <td><input value="Save Status" type="submit" /></td>
            </tr>
          </table>
      </td>
</tr>
</table>
% include('footer.tpl')
