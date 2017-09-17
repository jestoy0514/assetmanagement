% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
  <tr>
      <!--<td style="vertical-align: top">
          % include('sidemenu.tpl')
      </td> -->
      <td>
          <article>
              <h4>Assignment</h4>
              <p>This page serve as the list of hardware/software list which
              where assign to a employee and the available active assets that
              can be assign to someone.</p>
          </article>
          <table class="listusers">
            <tr>
                <th>Asset ID</th>
                <th>Category</th>
                <th>Type</th>
                <th>Brand</th>
                <th>Description</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Assign To</th>
                <th>Delete/Edit</th>
            </tr>
            % if len(data) != 0:
            % for asset in data:
            <tr>
                <td>{{asset[0]}}</td>
                <td>{{asset[1]}}</td>
                <td>{{asset[2]}}</td>
                <td>{{asset[4]}}</td>
                <td>{{asset[3]}}</td>
                <td>{{asset[5]}}</td>
                <td>{{asset[6]}}</td>
                % if asset[7] == None:
                %     firstname = ""
                % else:
                %     firstname = asset[7]
                % end
                
                % if asset[8] == None:
                %     lastname = ""
                % else:
                %     lastname = asset[8]
                % end
                <td>{{" ".join([firstname, lastname])}}</td>
                <td><a href="#">Delete</a>/<a href="#">Edit</a></td>
            </tr>
            % end
            % else:
            <tr>
              <td colspan="8">No asset currently available.</td>
            </tr>
            % end
            </table>
          <br>
          <a href="/do_assign" class="cust_button">Assign Asset</a>
      </td>
  </tr>
</table>
% include('footer.tpl')
