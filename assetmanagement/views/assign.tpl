% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
  <tr>
      <td style="vertical-align: top">
          % include('sidemenu.tpl')
      </td>
      <td>
      <h3>New Assignment</h3>
      <form action="/assign" method="post">
      <table>
        <tr>
          <td>Asset:</td>
          <td>
          <select name="assign_asset">
          % if len(asset) != 0:
          % for asst in asset:
          <option value="{{asst[0]}}">{{" ".join([str(asst[0]),"-",asst[4],asst[3]])}}</option>
          % end
          % end
          </select>
          </td>
        </tr>
        <tr>
          <td>Assign To:</td>
          <td>
          <select name="assign_to">
          % if len(employees) != 0:
          % for emp in employees:
          <option value="{{emp[0]}}">{{" ".join([emp[1], emp[2]])}}</option>
          % end
          % end
          </select>
          </td>
        </tr>
        <tr>
          <td><input style="padding: 5px 10px; font-family: AnticSlab;" value="Save" type="submit"></td>
        </tr>
      </table>
      </form>
      </td>
</tr>
</table>
% include('footer.tpl')
