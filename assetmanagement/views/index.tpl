% include('header.tpl')
% include('navigation.tpl')
<hr />
<table>
<tr>
<td style="vertical-align: top">
% include('sidemenu.tpl')
</td>
<td>
    <table id="myhome">
        <tr>
            <td class="cus_article">
                <h4>Hardware Details</h4>
                <p>It consist of all the hardware asset list that has been added and
                can create new, edit or delete a records. Before an asset can be added
                some necessary record needs to be added like, category, vendor, status,
                employees and departments.</p>
            </td>
            <td class="cus_article">
                <h4>Software Details</h4>
                <p>You can start here if you want to add some software asset like, operating
                system license, office suite license, or other software related things.
                You can create new, edit or even delete a record but bevery carefull becuase
                each record was in relationship with other record in the table and you may
                see some irregularities if deleted carelessly.</p>
            </td>
        </tr>

        <tr>
            <td class="cus_article">
                <h4>Search Assets</h4>
                <p>Get the total list or filtered by specific rspecification of assets to
                be able to provide a fully functional report of assets. It can be filtered
                by employee, asset type, brand or even status of the asset. Get the list of
                assets pertaining to a specific employees by entering his employee number or
                name.</p>
            </td>
            <td class="cus_article">
                <h4>Register Users</h4>
                <p>This software was intended to use by a single person only but adding 
                additional users is still possible but all of the created users has the
                same ability like those of an administrator.</p>
            </td>
        </tr>
    </table>
</td>
</tr>
</table>
% include('footer.tpl')
