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
              <h4>Brand</h4>
              <p>This page allows you to add a particular brand or vendor of
              an asset (ex. Hewlett Packard, Lenovo, LG). This will be use to
              identinfy the vendor of a specific asset for easy grouping later.</p>
          </article>
          <table class="listusers">
            <tr>
                <th>Brand ID:</th>
                <th>Brand Name:</th>
                <th>Delete/Edit</th>
            </tr>
            % if len(data) != 0:
            % for bra in data:
            <tr>
                <td>{{bra[0]}}</td>
                <td>{{bra[1]}}</td>
                <td><a href="#">Delete</a>/<a href="#">Edit</a></td>
            </tr>
            % end
            % else:
            <tr>
              <td colspan="3">No vendor currently available.</td>
            </tr>
            % end
            </table>
          <br>
          <a href="/addbrand" class="cust_button">Add Vendor</a>
      </td>
  </tr>
</table>
% include('footer.tpl')
