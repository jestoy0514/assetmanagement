import sqlite3
import hashlib

salt = "mahalKitaPwedeBa@02251980"

con = sqlite3.connect('myasset.db')
cur = con.cursor()



with open('db_script.txt', 'r') as mf:
    data = mf.read()
    
try:
    password = "admin" + salt
    password = hashlib.sha224(password.encode("utf-8")).hexdigest()
    
    cur.executescript(data)
    cur.execute("""Insert Into users Values(null, ?, ?, ?, ?, ?)""",
        ('admin', password, 'Jessie', 'Olazo', 'jessie@jestoy.frihost.net'))
    con.commit()
    print("success")
except:
    print("error")

cur.close()
con.close()
