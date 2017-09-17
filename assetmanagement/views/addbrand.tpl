% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
  <tr>
      <td>
          % include('sidemenu.tpl')
      </td>
      <td>
          <h3>New Vendor</h3>
          <form action="/addbrand" method="post">
          <table>
            <tr>
              <td>Vendor Name:</td>
              <td><input name="brand_name" type="text"></td>
            </tr>
            <tr>
              <td><input value="Save Vendor" type="submit" /></td>
            </tr>
          </table>
      </td>
  </tr>
</table>
% include('footer.tpl')
