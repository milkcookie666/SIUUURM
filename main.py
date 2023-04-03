from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL
import mysql.connector
import logging

app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'


@app.route('/all_clients', methods=['GET', 'POST'])
def index():
    con = mysql.connector.connect(host="localhost", user="root", password="qwertyuiop", database="suuuiv20")
    cur = con.cursor(dictionary=True)
    cur.execute(f"SELECT id_manager FROM users WHERE login = '{username}' ")
    manager_id = cur.fetchone()['id_manager']
    global id_of_manager
    id_of_manager = manager_id
    print(manager_id)
    cur.execute(f"select client_id from orders where manager_id = {manager_id};")
    #cur.execute(f"distinct select client_id from client_client_info;")
    # cur.execute(f"SELECT ")
    rows = cur.fetchall()
    clients_ids = set([elem['client_id'] for elem in rows])
    print(clients_ids)
    fios = {}
    for client_id in clients_ids:
        cur.execute(f"select client_value from client_client_info join client_info using(id_column_name) where client_id = {client_id};")
        info = cur.fetchall()[:3]
        first_name = info[0]['client_value']
        last_name = info[1]['client_value']
        surname = info[2]['client_value']
        fio = last_name+ ' ' + first_name + ' ' + surname
        fios[client_id] = fio
    print(fios)
    con.close()
    return render_template('all_clients.html', name=username, clients=fios)

@app.route('/create', methods=['GET', 'POST'])
def create_client():
    if request.method == 'POST':
        con = mysql.connector.connect(host="localhost", user="root", password="qwertyuiop", database="suuuiv20")
        cur = con.cursor(dictionary=True)
        last_name, first_name, surname = request.form.get('name').split()
        date_of_birth = request.form.get('birth')
        phone_number = request.form.get('phone')
        address = request.form.get('address')
        email = request.form.get('email')
        description = request.form.get('custom_field')
        print(last_name, first_name, surname, date_of_birth, phone_number, address, description)
        cur.execute("SELECT * FROM clients")
        idd = int(cur.fetchall()[-1]['client_id']) + 1
        insert_query = "INSERT INTO clients (client_id) VALUES (%s)"
        cur.execute(insert_query, (idd,))
        con.commit()
        print(idd)
        d = {first_name: 1, last_name: 2, surname: 3, phone_number: 4, address: 5, email: 6, description: 7,
             date_of_birth: 8}
        for key, val in d.items():
            cur.execute(f"INSERT INTO client_client_info(client_value, id_column_name, client_id) VALUES('{key}', '{val}', '{idd}');")
            con.commit()
        return redirect(url_for('index', name=username))
        con.close()
    return render_template('create.html', name=username)

@app.route('/sign_in', methods=["GET", "POST"])
@app.route('/', methods=["GET", "POST"])
def sign_in():
    if request.method == 'POST':
        con = mysql.connector.connect(host="localhost", user="root", password="qwertyuiop", database="suuuiv20")
        cur = con.cursor(dictionary=True)
        name = request.form.get('username')
        password = request.form.get('password')
        cur.execute("SELECT * FROM users")
        users = cur.fetchall()
        con.commit()
        for user in users:
            if user['login'] == name and user['user_password'] == password:
                print('УСПЕХ')
                global username
                username = name
                return redirect(url_for('index', name=username))
            else:
                flash('Указан неверный логин или пароль', 'error')
        con.close()
    return render_template('sign_in.html')

@app.route('/stat')
def get_stat():
    con = mysql.connector.connect(host="localhost", user="root", password="qwertyuiop", database="suuuiv20")
    cur = con.cursor(dictionary=True)
    cur.execute("select sum(order_amount) as 'all_sales' from orders;")
    all_sales = int([sale['all_sales'] for sale in cur.fetchall()][0])
    cur.execute("select count(client_id) as 'amount_of_clients' from clients;")
    amount_of_clients = int([client['amount_of_clients'] for client in cur.fetchall()][0])
    cur.execute("select count(order_id) as 'amount_of_orders' from orders;")
    amount_of_orders = int([order['amount_of_orders'] for order in cur.fetchall()][0])
    cur.execute(f"select count(distinct(client_id)) as 'my_amount' from orders where manager_id = {id_of_manager};")
    my_amount_of_clients = int([client['my_amount'] for client in cur.fetchall()][0])
    cur.execute(f"select count(order_id) as 'my_amount'  from orders where manager_id = {id_of_manager};")
    my_amount_of_orders = int([client['my_amount'] for client in cur.fetchall()][0])
    cur.execute(f"select sum(order_amount) as 'my_amount' from orders where manager_id = {id_of_manager};")
    my_all_sales = int([sale['my_amount'] for sale in cur.fetchall()][0])

    return render_template('stat.html', name=username, all_sales=all_sales, amount_of_clients=amount_of_clients, amount_of_orders=amount_of_orders, my_amount_of_clients=my_amount_of_clients, my_amount_of_orders=my_amount_of_orders, my_all_sales=my_all_sales)

@app.route('/sign_up', methods=['GET', 'POST'])
def sign_up():
    con = mysql.connector.connect(host="localhost", user="root", password="qwertyuiop", database="suuuiv20")
    cur = con.cursor(dictionary=True)
    if request.method == 'POST':
        no_login = 0
        name = request.form.get('username').strip()
        email = request.form.get('email').strip()
        password = request.form.get('password').strip()
        user_type = 2
        cur.execute("SELECT * FROM users")
        users = cur.fetchall()
        print(name, password)
        for user in users:
            if user['login'] == name:
                flash('Имя пользователя занято. Пожалуйста, выберите другое', 'error')
                no_login = 1

        cur.execute("SELECT manager_id FROM managers")
        max_manager_id = max([iddd['manager_id'] for iddd in cur.fetchall()])
        if not no_login:
            try:

                cur.execute(f"INSERT INTO users(login, user_password, id_user_type, id_manager) VALUES('{name}', '{password}', '{user_type}', '{max_manager_id}');")
                con.commit()
                print('ЗАНОС ПРОИЗОШЕЛ')
                return redirect(url_for('sign_in'))
            except:
                print('Ну блин')
        con.close()
    return render_template('sign-up.html')

@app.route('/deals/<int:client_id>')
def get_deals(client_id):
    con = mysql.connector.connect(host="localhost", user="root", password="qwertyuiop", database="suuuiv20")
    cur = con.cursor(dictionary=True)
    lst = []
    cur.execute(f"SELECT product_name, product_price, quantity FROM products INNER JOIN order_details ON product_id = products_product_id LEFT JOIN orders  ON orders_order_id = order_id WHERE client_id = {client_id};")
    info = cur.fetchall()
    for row in info:
        lst.append([v for k, v in row.items()])
    print(lst)
    return render_template('deals.html', name=username, info=lst)

@app.route('/client_card/<int:client_id>')
def get_client_card(client_id):
    con = mysql.connector.connect(host="localhost", user="root", password="qwertyuiop", database="suuuiv20")
    cur = con.cursor(dictionary=True)
    cur.execute(f"SELECT client_value FROM client_client_info WHERE client_id = {client_id};")
    info = cur.fetchall()
    print(info)
    first_name = info[0]['client_value']
    last_name = info[1]['client_value']
    surname = info[2]['client_value']
    phone_number = info[3]['client_value']
    address = info[4]['client_value']
    email = info[5]['client_value']
    description = info[6]['client_value']
    date_of_birth = info[7]['client_value']
    fio = first_name + ' ' + last_name + ' ' + surname
    con.close()
    return render_template('client-card.html', name=username, idd=client_id, fio=fio, phone_number=phone_number, address=address, email=email, description=description, date_of_birth=date_of_birth)

if __name__ == '__main__':
    app.run(debug=True)

