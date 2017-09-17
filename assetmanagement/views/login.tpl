% include('header.tpl')
<hr />
<h3>User Login</h3>
% if status == "failed":
<br><span class="loginfailed">Your username/password combination is incorrect.</span><br><br><br>
% end
<form action="/login" method="post">
<table>
<tr>
<td>Username:</td>
<td><input name="user_name" type="text" /></td>
</tr>
<tr>
<td>Password:</td>
<td><input name="pass_word" type="password" /></td>
</tr>
<tr>
<td><input value="Login" type="submit" /></td>
</tr>
</table>
</form>
% include('footer.tpl')
