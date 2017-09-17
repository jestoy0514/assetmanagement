% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
  <tr>
      <!-- <td style="vertical-align: top">
          % include('sidemenu.tpl')
      </td> -->
      <td>
          <article>
              <h4>Asset List</h4>
              <p>In this page you will see all the list of assets available.
              You can create new, edit, or delete but you have to be very
              carefull because some assets might be already assign to someone.</p>
          </article>
          <table class="listusers">
            <tr>
                <th>Category</th>
                <th>Type</th>
                <th>Brand</th>
                <th>Description</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Date</th>
                <th>Status</th>
                <th>Delete/Edit</th>
            </tr>
            % if len(data) != 0:
            % for asset in data:
            <tr>
                <td>{{asset[1]}}</td>
                <td>{{asset[2]}}</td>
                <td>{{asset[4]}}</td>
                <td>{{asset[3]}}</td>
                <td>{{asset[6]}}</td>
                <td>{{asset[7]}}</td>
                <td>{{asset[5]}}</td>
                <td>{{asset[8]}}</td>
                <td><a href="#">Delete</a>/<a href="#">Edit</a></td>
            </tr>
            % end
            % else:
            <tr>
              <td colspan="9">No asset currently available.</td>
            </tr>
            % end
            </table>
          <br>
          <a href="/addasset" class="cust_button">Add Asset</a>
      </td>
  </tr>
</table>
% include('footer.tpl')
