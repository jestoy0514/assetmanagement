% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
  <tr>
      <td>
          % include('sidemenu.tpl')
      </td>
      <td>
          <h3>New Category</h3>
          <form action="/addcategory" method="post">
          <table>
            <tr>
              <td>Category:</td>
              <td><input name="cat_name" type="text"></td>
            </tr>
            <tr>
              <td><input value="Save Category" type="submit" /></td>
            </tr>
          </table>
      </td>
</tr>
</table>
% include('footer.tpl')
