% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
  <tr>
      <td valign="top">
          % include('sidemenu.tpl')
      </td>
      <td>
          <article>
            <h3>License</h3>
            % with open('LICENSE', 'r') as mf:
            %     data = mf.read()
            % data = data.split('\n')
            % end
            <p>
            % for line in data:
                  {{line}}<br />
            % end
            </p>
          </article>
      </td>
  </tr>
</table>
% include('footer.tpl')
