% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
  <tr>
    <td style="vertical-align: top">
      % include('sidemenu.tpl')
    </td>
    <td>
      <h3>New Asset</h3>
      <form action="/addasset" method="post">
        <table>
          <tr>
            <td>Category:</td>
            <td>
              <select name="category">
                % for cat in category:
                <option value={{cat[0]}}>{{cat[1]}}</option>
                % end
              </select>
            </td>
          </tr>
          <tr>
            <td>Type:</td>
            <td>
              <select name="type">
                <option value="Hardware">Hardware</option>
                <option value="Software">Software</option>
              </select>
            </td>
          </tr>
          <tr>
            <td>Brand:</td>
            <td>
              <select name="brand">
                % for bra in brand:
                <option value={{bra[0]}}>{{bra[1]}}</option>
                % end
              </select>
            </td>
          </tr>
          <tr>
            <td>Description:</td>
            <td><input name="description" type="text"></td>
          </tr>
          <tr>
            <td>Quantity:</td>
            <td><input name="quantity" type="number"></td>
          </tr>
          <tr>
            <td>Price:</td>
            <td><input name="price" type="number"></td>
          </tr>
          <tr>
            <td>Date:</td>
            <td><input name="date" type="date"></td>
          </tr>
          <tr>
            <td>Status:</td>
            <td>
              <select name="status">
                % for stat in status:
                <option value={{stat[0]}}>{{stat[1]}}</option>
                % end
              </select>
            </td>
          </tr>
          <tr>
            <td><input style="padding: 5px 10px; font-family: AnticSlab;" value="Add Asset" type="submit"></td>
          </tr>
        </table>
      </form>
    </td>
  </tr>
</table>
% include('footer.tpl')
