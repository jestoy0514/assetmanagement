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
              <h4>Category</h4>
              <p>This page shows the list of categories available for easy access when adding
              new asset. And can be group easily for report purposes in category wise manner.</p>
          </article>
          <table class="listusers">
            <tr>
                <th>Category ID:</th>
                <th>Category:</th>
                <th>Delete/Edit</th>
            </tr>
            % if len(data) != 0:
            % for cat in data:
            <tr>
                <td>{{cat[0]}}</td>
                <td>{{cat[1]}}</td>
                <td><a href="#">Delete</a>/<a href="#">Edit</a></td>
            </tr>
            % end
            % else:
            <tr>
              <td colspan="3">No category currently available.</td>
            </tr>
            % end
            </table>
          <br>
          <a href="/addcategory" class="cust_button">Add Category</a>
      </td>
  </tr>
</table>
% include('footer.tpl')
