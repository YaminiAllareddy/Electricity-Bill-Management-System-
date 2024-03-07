# header file
import mysql.connector

# connection for database  
cn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="root",
    database="billmanagementsystem"
)

# define cursor 
cur = cn.cursor()

# display electricity company table
print('\n--- Electricity Company Details ---')
# select query 
query = "Select * from Electricity_company"
cur.execute(query)
# text file 
with open('Electricity_company.txt','w') as file:
    for billmanagementsystem in cur:
        file.write(str(billmanagementsystem))
        file.write('\n')
cur.execute(query)
result = cur.fetchall()
# display result
for i in result:
    print(i)

# display Consumer table
print('\n--- Consumer Details ---')
# select query 
query = "Select * from Consumer"
cur.execute(query)
# text file 
with open('Consumer.txt','w') as file:
    for billmanagementsystem in cur:
        file.write(str(billmanagementsystem))
        file.write('\n')
cur.execute(query)
result = cur.fetchall()
# display result
for i in result:
    print(i)

# display Readings table
print('\n--- Readings Details ---')
# select query 
query = "Select * from Readings"
cur.execute(query)
# text file 
with open('Readings.txt','w') as file:
    for billmanagementsystem in cur:
        file.write(str(billmanagementsystem))
        file.write('\n')
cur.execute(query)
result = cur.fetchall()
# display result
for i in result:
    print(i)


# display Tariff table
print('\n--- Tariff Details ---')
# select query 
query = "Select * from Tariff"
cur.execute(query)
# text file 
with open('Tariff.txt','w') as file:
    for billmanagementsystem in cur:
        file.write(str(billmanagementsystem))
        file.write('\n')
cur.execute(query)
result = cur.fetchall()
# display result
for i in result:
    print(i)


# display Bill table
print('\n--- Bill Details ---')
# select query 
query = "Select * from Bill"
cur.execute(query)
# text file 
with open('Bill.txt','w') as file:
    for billmanagementsystem in cur:
        file.write(str(billmanagementsystem))
        file.write('\n')
cur.execute(query)
result = cur.fetchall()
# display result
for i in result:
    print(i)


# display Payment table
print('\n--- Payment Details ---')
# select query 
query = "Select * from Payment"
cur.execute(query)
# text file 
with open('Payment.txt','w') as file:
    for billmanagementsystem in cur:
        file.write(str(billmanagementsystem))
        file.write('\n')
cur.execute(query)
result = cur.fetchall()
# display result
for i in result:
    print(i)


# display Usage History table
print('\n--- Usage History Details ---')
# select query 
query = "Select * from Usage_history"
cur.execute(query)
# text file 
with open('Usage_history.txt','w') as file:
    for billmanagementsystem in cur:
        file.write(str(billmanagementsystem))
        file.write('\n')
cur.execute(query)
result = cur.fetchall()
# display result
for i in result:
    print(i)


# display Notification table
print('\n--- Notification Details ---')
# select query 
query = "Select * from Notification"
cur.execute(query)
# text file 
with open('Notification.txt','w') as file:
    for billmanagementsystem in cur:
        file.write(str(billmanagementsystem))
        file.write('\n')
cur.execute(query)
result = cur.fetchall()
# display result
for i in result:
    print(i)


