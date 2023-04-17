import random
import pandas as pd


def get_price_bid(ads_id):
    data = pd.read_csv('dummy_advertisements.csv', header=None)
    try:
        price = data.loc[data[0] == ads_id, 10].values[0]
        bid = random.uniform(0, 1)
        return round(price * bid)
    except KeyError:
        print("tidak ditemukan")

def get_ads_id():
    ads_id = []
    ads = pd.read_csv('dummy_advertisements.csv')
    ads = ads.iloc[:, 0]
    for id in ads:
        ads_id.append(id)
    return random.choice(ads_id)

def get_user_id():
    user_id = []
    user = pd.read_csv('users.csv')
    user = user.iloc[:, 0]
    for id in user:
        user_id.append(id)
    return random.choice(user_id)

def to_csv(data):
    df = pd.DataFrame(data)
    df.to_csv('bids.csv', index=False)

def generate_dummy_data(num_records):
    statuses = ['winning', 'losing', 'withdrawn']
    data = []
    for i in range(num_records):
        bid_id = 2100 + i
        bid_status = random.choice(statuses)
        ads_id = get_ads_id()
        bid_price = get_price_bid(ads_id)
        user_id = get_user_id()
        record = (bid_id, bid_status, bid_price, ads_id, user_id)
        data.append(record)
        print(f'create bid for ads {ads_id}')
    to_csv(data)

generate_dummy_data(100)