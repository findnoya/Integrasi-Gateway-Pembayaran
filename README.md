# Integrasi-Gateway-Pembayaran
Kelompok 4

Sistem integrasi gateway pembayaran yang menyediakan API untuk simulasi pembayaran menggunakan metode pembayaran virtual dan memberikan status pembayaran.

## Langkah-langkah

### 1. Mengambil data dari API
Mengatur konfigurasi awal untuk API

```
class ProductAPI:
    def __init__(self, server_ip):
        self.base_url = f'http://{server_ip}:5000'
        self.headers = {
            'Content-Type': 'application/json'
        }
```

Mengambil data transaksi dari API

```
def get_transactions(self):
    try:
        response = requests.get(
            f'{self.base_url}/api/transactions',
            headers=self.headers
        )
        return response.json() if response.status_code == 200 else {'error': 'Unable to fetch transactions'}
    except requests.exceptions.RequestException as e:
        return {'error': f'Connection error: {str(e)}'}
```

### 2. Menyimpan data transaksi ke database

Menyimpan atau memperbarui data transaksi ke tabel database MySQL

```
def save_transactions_to_db(transactions):
    connection = get_db_connection()
    cursor = connection.cursor()

    for transaction in transactions:
        cursor.execute("""
            INSERT INTO transactions (transaction_id, total_price, created_at)
            VALUES (%s, %s, %s)
            ON DUPLICATE KEY UPDATE
            total_price = VALUES(total_price),
            created_at = VALUES(created_at)
        """, (
            transaction['transaction_id'], 
            transaction['total_price'], 
            datetime.strptime(transaction['created_at'], '%Y-%m-%dT%H:%M:%S')
        ))

    connection.commit()
    cursor.close()
    connection.close()
```

### 3. Membuka koneksi ke database

Mengembalikan koneksi ke database MySQL
```
def get_db_connection():
    return mysql.connector.connect(
        host='localhost',         
        database='shopping_cart_db', 
        user='root',               
        password=''                
    )
```

### 4. Melakukan sinkronisasi data 

```
def sync_transactions():
    product_api = ProductAPI(server_ip='192.168.0.122')
    transactions_data = product_api.get_transactions()

    if 'error' in transactions_data:
        print(f"Error: {transactions_data['error']}")
    else:
        save_transactions_to_db(transactions_data)
```



