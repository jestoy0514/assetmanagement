% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
  <tr>
      <td>
          % include('sidemenu.tpl')
      </td>
      <td>
      <h3>New Employee</h3>
      <form action="/addemployee" method="post">
      <table>
        <tr>
          <td>First Name:</td>
          <td><input name="firstname" type="text"></td>
        </tr>
        <tr>
          <td>Last Name:</td>
          <td><input name="lastname" type="text"></td>
        </tr>
        <tr>
          <td>File Number:</td>
          <td><input name="filenumber" type="text"></td>
        </tr>
        <tr>
          <td>Department:</td>
          <td>
          <select name="department">
          % if len(data) != 0:
          % for dept in data:
          <option value="{{dept[0]}}">{{"-".join([dept[3], dept[1]])}}</option>
          % end
          % end
          </select>
          </td>
        </tr>
        <tr>
          <td><input style="padding: 5px 10px; font-family: AnticSlab;" value="Add Employee" type="submit"></td>
        </tr>
      </table>
      </form>
      </td>
</tr>
</table>
% include('footer.tpl')
