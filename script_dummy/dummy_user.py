import random
import string
import pandas as pd

first_names = [
    'Aldo', 'Alya', 'Arum', 'Bagus', 'Bambang', 'Bayu', 'Cahaya', 'Cinta', 'Dewi', 'Dharma',
    'Dian', 'Dinda', 'Doni', 'Eka', 'Fadil', 'Fajar', 'Fitri', 'Gita', 'Hadi', 'Hana',
    'Hendra', 'Imam', 'Indah', 'Intan', 'Irfan', 'Ivan', 'Jaka', 'Jaya', 'Joko', 'Kadek',
    'Kania', 'Kartika', 'Krisna', 'Laras', 'Lia', 'Mega', 'Mila', 'Nadia', 'Nanda', 'Nia',
    'Nina', 'Nur', 'Putra', 'Ratna', 'Rina', 'Rini', 'Sari', 'Sinta', 'Tari', 'Taufik',
    'Wulan', 'Yanto', 'Yudha'
]

last_names = [
    'Abdullah', 'Adnan', 'Agustina', 'Anggraeni', 'Asmara', 'Baskara', 'Darmawan', 'Firmansyah', 'Ginting', 'Hakim',
    'Harianto', 'Harjono', 'Hartono', 'Indarto', 'Irawan', 'Juwono', 'Kamil', 'Kusuma', 'Lestari', 'Lubis',
    'Mansur', 'Maulana', 'Mulyana', 'Mustofa', 'Nasution', 'Nugraha', 'Nugroho', 'Perdana', 'Prabowo', 'Prasetya',
    'Pratama', 'Purnama', 'Putra', 'Raharjo', 'Ramadhan', 'Rusli', 'Saputra', 'Sari', 'Setiawan', 'Simanjuntak',
    'Simatupang', 'Siregar', 'Sitorus', 'Suharto', 'Sulistiyo', 'Surya', 'Syafruddin', 'Wibowo', 'Wijaya', 'Zulkarnain'
]

def to_csv(users):
  df = pd.DataFrame(users)
  df.to_csv('users.csv', index=False)

def generate_phone_number():
    number = '08'
    for i in range(10):
        number += random.choice(string.digits)
    return number


def generate_random_address():
    streets = ['Jalan Raya', 'Jalan Merdeka', 'Jalan Sudirman', 'Jalan Pahlawan', 'Jalan Kenari', 'Jalan Garuda', 'Jalan Adiyaksa', 'Jalan Mangga']
    street_no = str(random.randint(1, 100))
    return random.choice(streets) + ' No. ' + street_no

def generate_user_data(num_users):
    users = []
    for i, _ in enumerate(range(num_users), start=1001):
        user_id = i
        name = random.choice(first_names) + ' ' + random.choice(last_names)
        contact = generate_phone_number()
        email = name.lower().replace(' ', '.') + '@mail.com'
        address = generate_random_address()
        location_id = random.randint(4000001, 4000100)
        users.append((user_id, name, contact, email, address, location_id))
        print(user_id, name, contact, email, address, location_id)
    to_csv(users)



generate_user_data(100)