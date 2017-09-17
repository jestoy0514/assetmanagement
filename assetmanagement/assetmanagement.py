#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  assetmanagement.py
#  
#  Copyright 2017 Jesus Vedasto Olazo <jessie@jestoy.frihost.net>

from bottle import Bottle,template,redirect,request,response,static_file
import sqlite3
import hashlib

app = Bottle()

def check_login(username, password):
    salt = "mahalKitaPwedeBa@02251980"
    password = password + salt
    password = hashlib.sha224(password.encode("utf-8")).hexdigest()
    
    con = sqlite3.connect('myasset.db')
    cur = con.cursor()
    
    data = cur.execute("Select * From users")
    data = data.fetchall()
    cur.close()
    con.close()
    
    for users in data:
        if username in users:
            if password == users[2]:
                return True
            else:
                return False
    return False

@app.route('/')
def index():
    username = request.get_cookie("account", secret="l1l1B3th0$l4")
    if username is None:
        redirect('/login')
    else:
        return template('index', title="Home")
    
@app.get('/login')
def login():
    status = request.get_cookie("status", secret="l1l1B3th0$l4")
    if status == "failed":
        return template('login', title="Login", status=status)
    else:
        return template('login', title="Login", status="success")
    
@app.post('/login')
def do_login():
    username = request.forms.get('user_name')
    password = request.forms.get('pass_word')
    if check_login(username, password):
        response.set_cookie("account", username, secret="l1l1B3th0$l4")
        response.set_cookie("status", None, secret="l1l1B3th0$l4")
        redirect('/')
    else:
        response.set_cookie("status", "failed", secret="l1l1B3th0$l4")
        redirect('/login')
        
@app.route('/logout')
def do_logout():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        response.set_cookie("account", None, secret="l1l1B3th0$l4")
    redirect('/')
        
@app.route('/css/<filename>')
def css(filename):
    return static_file(filename, root='css/')
    
@app.route('/css/fonts/<filename>')
def fonts(filename):
    return static_file(filename, root='css/fonts/')
    
@app.route('/css/image/<filename>')
def background(filename):
    return static_file(filename, root='css/image/')
    
@app.route('/users')
def load_users():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()
    
        data = cur.execute("Select * From users")
        data = data.fetchall()
        cur.close()
        con.close()
        return template('users', title="User's List", data=data)
    else:
        redirect('/login')
        
@app.route('/users/delete/<user_id>')
def delete_user(user_id):
    if int(user_id) != 1:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()
        
        query = "Delete From users Where id = ?"
        cur.execute(query, (int(user_id),))
        con.commit()
        cur.close()
        con.close()
        redirect ('/users')
    else:
        redirect ('/users')
    
@app.get('/users/edit/<user_id>')
def edit_user(user_id):
    if int(user_id) != 1:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()
        
        query = "Select * From users Where id = ?"
        data = cur.execute(query, (int(user_id),))
        data = data.fetchone()
        cur.close()
        con.close()
        return template('edituser', title="Update User", data=data, user_id=user_id)
    else:
        redirect ('/users')
    
@app.post('/users/edit/<user_id>')
def do_edit_user(user_id):
    user_id = int(user_id)
    username = request.forms.get('username')
    password = request.forms.get('password')
    firstname = request.forms.get('firstname')
    lastname = request.forms.get('lastname')
    email = request.forms.get('email')
    
    salt = "mahalKitaPwedeBa@02251980"
    password = password + salt
    password = hashlib.sha224(password.encode("utf-8")).hexdigest()
    
    con = sqlite3.connect('myasset.db')
    cur = con.cursor()
    
    query = """Update users Set username = ?,
        password = ?, firstname = ?, lastname = ?,
        email = ? Where id = ?"""
    cur.execute(query, (username, password, firstname, lastname, email, user_id))
    con.commit()
    cur.close()
    con.close()
    redirect ('/users')
    
@app.get('/adduser')
def add_user():
    return template('adduser', title="New User")

@app.post('/adduser')
def do_add_user():
    username = request.forms.get('username')
    password = request.forms.get('password')
    firstname = request.forms.get('firstname')
    lastname = request.forms.get('lastname')
    email = request.forms.get('email')
    
    salt = "mahalKitaPwedeBa@02251980"
    password = password + salt
    password = hashlib.sha224(password.encode("utf-8")).hexdigest()
    
    con = sqlite3.connect('myasset.db')
    cur = con.cursor()
    
    cur.execute("""Insert Into users Values(null, ?, ?, ?, ?, ?)""",
        (username, password, firstname, lastname, email))
    con.commit()
    
    cur.close()
    con.close()
    redirect('/users')

@app.route('/employees')
def load_employees():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()
    
        data = cur.execute("Select * From employees")
        data = data.fetchall()
        
        dept = cur.execute("Select * From department")
        dept = dept.fetchall()
        
        cur.close()
        con.close()
        return template('employees', title="Employee List", data=data, dept=dept)
    else:
        redirect('/login')
    
@app.get('/addemployee')
def add_employee():
    con = sqlite3.connect('myasset.db')
    cur = con.cursor()
    
    data = cur.execute("Select * From department")
    data = data.fetchall()
    cur.close()
    con.close()
    return template('addemployee', title="New Employee", data=data)

@app.post('/addemployee')
def do_add_employee():
    firstname = request.forms.get('firstname')
    lastname = request.forms.get('lastname')
    filenumber = request.forms.get('filenumber')
    department = int(request.forms.get('department'))
    
    con = sqlite3.connect('myasset.db')
    cur = con.cursor()
    
    cur.execute("""Insert Into employees Values(null, ?, ?, ?, ?)""",
        (firstname, lastname, filenumber, department))
    con.commit()
    
    cur.close()
    con.close()
    redirect('/employees')
        
@app.route('/departments')
def load_departments():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()
    
        data = cur.execute("Select * From department")
        data = data.fetchall()
        cur.close()
        con.close()
        return template('departments', title="Department", data=data)
    else:
        redirect('/login')
    
@app.get('/adddepartment')
def add_department():
    return template('adddepartment', title="New Department")

@app.post('/adddepartment')
def do_add_department():
    comname = request.forms.get('com_name')
    deptname = request.forms.get('dept_name')
    roomnumber = request.forms.get('room')
    
    con = sqlite3.connect('myasset.db')
    cur = con.cursor()
    
    cur.execute("""Insert Into department Values(null, ?, ?, ?)""",
        (deptname, roomnumber, comname))
    con.commit()
    
    cur.close()
    con.close()
    redirect('/departments')
        
@app.route('/assets')
def load_assets():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()

        query = """SELECT a.id,b.description,a.type,
            a.description,c.name,a.date,a.quantity,
            a.price, d.name FROM asset AS a
            LEFT JOIN [category] AS b ON b.id=a.cat_id
            LEFT JOIN [brand] AS c ON c.id=a.brand_id
            LEFT JOIN [status] AS d ON d.id=a.status_id"""
    
        data = cur.execute(query)
        data = data.fetchall()
        cur.close()
        con.close()
        return template('assets', title="Asset List", data=data)
    else:
        redirect('/login')
    
@app.get('/addasset')
def add_asset():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()
    
        category = cur.execute("Select * From category")
        category = category.fetchall()
        
        brand = cur.execute("Select * From brand")
        brand = brand.fetchall()
        
        status = cur.execute("Select * From status")
        status = status.fetchall()
        
        cur.close()
        con.close()
        return template('addasset', title="New Hardware/Software",
            category=category, brand=brand, status=status)
    else:
        redirect('/login')

@app.post('/addasset')
def do_add_asset():
    category = int(request.forms.get('category'))
    a_type = request.forms.get('type')
    brand = int(request.forms.get('brand'))
    description = request.forms.get('description')
    qty = float(request.forms.get('quantity'))
    price = float(request.forms.get('price'))
    p_date = request.forms.get('date')
    status = int(request.forms.get('status'))
    
    con = sqlite3.connect('myasset.db')
    cur = con.cursor()
    
    cur.execute("""Insert Into asset Values(null,?,?,?,?,?,?,?,?)""",
        (category, a_type, description, brand, p_date, qty,
         price, status))
    con.commit()
    
    cur.close()
    con.close()
    redirect('/assets')
        
@app.route('/hardwares')
def load_hardwares():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()

        query = """SELECT a.id,b.description,a.type,
            a.description,c.name,a.date,a.quantity,
            a.price, d.name FROM asset AS a
            LEFT JOIN [category] AS b ON b.id=a.cat_id
            LEFT JOIN [brand] AS c ON c.id=a.brand_id
            LEFT JOIN [status] AS d ON d.id=a.status_id
            WHERE a.type='Hardware'"""
    
        data = cur.execute(query)
        data = data.fetchall()
        cur.close()
        con.close()
        return template('hardwares', title="Hardware List", data=data)
    else:
        redirect('/login')

@app.route('/softwares')
def load_softwares():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()

        query = """SELECT a.id,b.description,a.type,
            a.description,c.name,a.date,a.quantity,
            a.price, d.name FROM asset AS a
            LEFT JOIN [category] AS b ON b.id=a.cat_id
            LEFT JOIN [brand] AS c ON c.id=a.brand_id
            LEFT JOIN [status] AS d ON d.id=a.status_id
            WHERE a.type='Software'"""
    
        data = cur.execute(query)
        data = data.fetchall()
        cur.close()
        con.close()
        return template('softwares', title="Software List", data=data)
    else:
        redirect('/login')

@app.route('/assignment')
def load_assignment():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()

        query = """SELECT
            a.id,b.description,a.type,
            a.description,c.name,a.quantity,
            d.name, f.firstname, f.lastname
            FROM asset AS a
            LEFT JOIN [category] AS b ON b.id=a.cat_id
            LEFT JOIN [brand] AS c ON c.id=a.brand_id
            LEFT JOIN [status] AS d ON d.id=a.status_id
            LEFT JOIN [assignment] AS e ON e.asset_id=a.id
            LEFT JOIN [employees] AS f ON f.id=e.emp_id
            """
    
        data = cur.execute(query)
        data = data.fetchall()
        cur.close()
        con.close()
        return template('assignment', title="Assignment", data=data)
    else:
        redirect('/login')

@app.get('/do_assign')
def assign_asset():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()

        query = """SELECT a.id,b.description,a.type,
            a.description,c.name,a.quantity, d.name
            FROM asset AS a
            LEFT JOIN [category] AS b ON b.id=a.cat_id
            LEFT JOIN [brand] AS c ON c.id=a.brand_id
            LEFT JOIN [status] AS d ON d.id=a.status_id"""
    
        asset = cur.execute(query)
        asset = asset.fetchall()

        query = """SELECT * FROM employees"""
    
        employees = cur.execute(query)
        employees = employees.fetchall()
        
        cur.close()
        con.close()
        return template('do_assign', title="Assign Asset",
                        asset=asset, employees=employees)
    else:
        redirect('/login')

@app.post('/do_assign')
def do_assign_asset():
    assign_asst = int(request.forms.get('assign_asset'))
    assign_to = int(request.forms.get('assign_to'))
    con = sqlite3.connect('myasset.db')
    cur = con.cursor()
    
    cur.execute("""Insert Into assignment Values(null,?,?)""",
                (assign_asst, assign_to))
    con.commit()
    
    cur.close()
    con.close()
    redirect('/assignment')
    
@app.route('/license')
def show_license():
    return template('license.tpl', title="License")
    
@app.route('/about')
def show_about():
    return template('about.tpl', title="About")
    
@app.route('/help')
def show_help():
    return template('help.tpl', title="Help")
    
@app.route('/contact')
def show_contact():
    return template('contact.tpl', title="Contact")
    
@app.route('/categories')
def load_categories():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()
    
        data = cur.execute("Select * From category")
        data = data.fetchall()
        cur.close()
        con.close()
        return template('categories', title="Categories", data=data)
    else:
        redirect('/login')
    
@app.get('/addcategory')
def add_category():
    return template('addcategory', title="New Category")

@app.post('/addcategory')
def do_add_category():
    catname = request.forms.get('cat_name')
    
    con = sqlite3.connect('myasset.db')
    cur = con.cursor()
    
    cur.execute("""Insert Into category Values(null, ?)""", (catname,))
    con.commit()
    
    cur.close()
    con.close()
    redirect('/categories')
    
@app.route('/brands')
def load_brands():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()
    
        data = cur.execute("Select * From brand")
        data = data.fetchall()
        cur.close()
        con.close()
        return template('brands', title="Brand", data=data)
    else:
        redirect('/login')
    
@app.get('/addbrand')
def add_brand():
    return template('addbrand', title="New Brand")

@app.post('/addbrand')
def do_add_brand():
    brandname = request.forms.get('brand_name')
    
    con = sqlite3.connect('myasset.db')
    cur = con.cursor()
    
    cur.execute("""Insert Into brand Values(null, ?)""", (brandname,))
    con.commit()
    
    cur.close()
    con.close()
    redirect('/brands')

@app.route('/status')
def load_status():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()
    
        data = cur.execute("Select * From status")
        data = data.fetchall()
        cur.close()
        con.close()
        return template('status', title="Status", data=data)
    else:
        redirect('/login')
    
@app.get('/addstatus')
def add_brand():
    return template('addstatus', title="New Status")

@app.post('/addstatus')
def do_add_brand():
    status = request.forms.get('status')
    
    con = sqlite3.connect('myasset.db')
    cur = con.cursor()
    
    cur.execute("""Insert Into status Values(null, ?)""", (status,))
    con.commit()
    
    cur.close()
    con.close()
    redirect('/status')
    
@app.get('/search')
def load_search():
    if request.get_cookie("account", secret="l1l1B3th0$l4") != None:
        con = sqlite3.connect('myasset.db')
        cur = con.cursor()

        query = """SELECT
            a.id,b.description,a.type,
            a.description,c.name,a.quantity,
            d.name, f.firstname, f.lastname
            FROM asset AS a
            LEFT JOIN [category] AS b ON b.id=a.cat_id
            LEFT JOIN [brand] AS c ON c.id=a.brand_id
            LEFT JOIN [status] AS d ON d.id=a.status_id
            LEFT JOIN [assignment] AS e ON e.asset_id=a.id
            LEFT JOIN [employees] AS f ON f.id=e.emp_id"""
    
        data = cur.execute(query)
        data = data.fetchall()
        cur.close()
        con.close()
        return template('search', title="Search", data=data)
    else:
        redirect('/search')

@app.error(404)
def error404(error):
    return template('error404', title="Error 404")

if __name__ == '__main__':
    app.run(host='localhost', port=8080, debug=True, reloader=True)
