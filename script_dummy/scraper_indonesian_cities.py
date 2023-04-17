import requests
import json
import pandas as pd

url = "https://www.olx.co.id/api/locations"

payload={}
headers = {
  'authority': 'www.olx.co.id',
  'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
  'accept-language': 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7,ms;q=0.6,ar;q=0.5',
  'cookie': 'laquesis=pan-60601@b#pan-67471@b; __exponea_etc__=97847208-6847-49c5-ad48-af7f5d95d505; WZRK_G=431b4b9e8ab0402f94a760c2058bd0a2; _rtb_user_id=93fce802-2586-d2f2-397f-89b2c2436ef7; _ga=GA1.3.1100659186.1671187722; __gads=ID=21a50308af15aa0e:T=1671187723:S=ALNI_MY5CWMfjcz_4JDK-kUmkTIE8gOwMA; _tt_enable_cookie=1; _ttp=vF_n52k8GfwdaX-5olI6KE2jAWk; _fbp=fb.2.1671187725986.81215853; G_ENABLED_IDPS=google; laquesisff=; laquesissu=; _gcl_au=1.1.1034191191.1679325336; relevanceUser=013642864140182076; _gid=GA1.3.596337440.1681576014; _cc_id=3a7e7e13f0b453c23820d18c9e2cbc66; panoramaId_expiry=1681662418863; panoramaId=277837725b3d1cbcf66634d76542a9fb927ab6f36d1ce84653726dd700b9c306; panoramaIdType=panoDevice; U_INT=buyer; U_TAB=BUY; locationPath=%5B%7B%22id%22%3A2000007%2C%22name%22%3A%22Jakarta%20D.K.I.%22%2C%22type%22%3A%22STATE%22%2C%22longitude%22%3A106.820282656455%2C%22latitude%22%3A-6.2820200265659%2C%22parentId%22%3A1000001%7D%5D; bm_sz=C8DE3DA88859C407EC4DC05F98D4FA5D~YAAQnOwZuLy1wH6HAQAA9sidiRNdRcKwYJrWr9sbeyoFlLfwJmxnk2lrt+OYYNds+qxjklXxxkuaqqojvOBy5YhDrC3orz4WrSFnomCFL3HY2dl6PsVSWgUDckzIEHB6UT8/43iM2lBblKaV/TtaARZnC63gBlUPwCK3B0dELB4X3kxochN1IhA5sPPa4A8zUW6l5aPD69t91Ux1TFBkyj1dERgc3XMuDnfklVsaDFTlXL8cQYSBLb/gkF79B3vVAwsILLxzshpRukv17kFRSM3hQh3JHkZ3pJMGNNm8WBhSHg==~4474421~3682871; bm_mi=5F6E3EACDA3475064BE4F813C769E143~YAAQnOwZuC+2wH6HAQAAZNKdiRMPBQ5j/cusapCaqP852ieuh5/Sq7syBXHD/bYrHfCaBoJfjzUxBZfflE3PZgcqhwx8B1nIlDiPNg9ABJo4CVSYp0XhSgqmNSxP6Zvwvx1xmU/Eu1palZk+ehhGsVhZ8nRPMxyO7MgDepajHzGuz3GRlhkBikJPcvE5J4i1IzwFpI790mhHn9TH1tsgz5eYRO7EqZvIRhLGbxJ4NnUIp/2ow/SNVqFBybt4SDu8tvNsSy04QoFFhhd/1w0WXqCZpHy0Anwi4MDwxF2+MxwD/CfxTLp4sc/E4XoWUG/ND/pFh/fBkjR7RHqVJBD7GgBdEUGuLcmLt8DPXANQDVpteA==~1; __exponea_time2__=-0.5050454139709473; __gpi=UID=00000b91e0a03935:T=1671187723:RT=1681641041:S=ALNI_Mb5DLgmya5y89Hy_qWUxYx0dfOHaQ; AMP_TOKEN=%24NOT_FOUND; home_page_banner=3; ak_bmsc=3025B5E007A93D638A977D6D6B8DDE31~000000000000000000000000000000~YAAQnOwZuB6+wH6HAQAASrmfiRNQZq0VRfZeeYTOcceB9x0MFCK/pKFcykiOvp2MgaauWWtXAeUAY1lOoa1q3gls+l2mR+4w5Xs/OSR2Yg5ZMZAEFxixWveNEWCJaXiIDm/pXXBxV8664tIWeMD25Uzjj+B3Uv9XG2bbQhfz+vvWvGQr0nqd6fzpEeRvm5PGirWoeIrI7gh0YwD9WP2YU25u2G+eyZNywqR7fg4cLUn/N1JISUmaAjWJza8PQxkV7q7XrKqryKxmPLH08McVLboX2n2LTX/uCgcPS/x9wQWfY9sPlHW2VYAjlWc2xapvwQR3mS8AXmcYwqPhvubJtcDco3LDhM2aLeMwcV6hSHV0A7BoJ7JgCT6Ic/IO/gQYPUhhctR6gikxLOKuwCl6XfrhDyL8MDDtwft19/aMYtOMU1rWYaDJIuiXDZPoBBP2hfGicwCTOAi8KQzY2BlJ1VkNS9fLJLLie+i4M4gEs5wTL/uctypYWvB17L+yT3w0GW6rGhNTbB+H6OWQx7XWx2ZA7iIojmHzVn2rfgO0KCBQboW4E3m+TCHHxVCj2QcKh1B9bV6EJ+nF6JnwAVs78iRUnBArcA0v; _uetsid=568b3fa0dbaa11edbbc5e13ead711f02; _uetvid=355fab107d2f11ed8d711daaac5f78e7; g_state={"i_p":1681649389074,"i_l":1}; _abck=ABAB22AB98BADA9BC3AA6264BB27B486~-1~YAAQ1OwZuMLbg0+HAQAAG6eviQl4rzQ1d4TRBOfLGIJWTwej1sYV8BP2wpPlqMuZM6/Sc+YXJ0IHSPsT35D8Pe49y99ZBhlvOFtSOF/oqZV7TUhzekROUVl//HqujF9ouDEUgZPVMN9bgkaFQzf8lsrjrDEA0fpvZUQcT8VaiBtOO7s1ru5m0ll/K7DyU4XeY6NRqGNwm59cfiuIupeRgC/pvdazPaKd9DHaMB1Ck3XPBAnuxhXxnvuNCCOKPHzVWFxciI7Yf9a6xg5gSnsOL7rXSppaVuLilDu4VF/8Oy+wRMDKew7briGwSGeOZTZbvUGGr2WAV5BO7xCDMElYbODwz3ZXQ+KKmWYaq203bdKtgqKPWHfEn78ivdvOX+jUv7ny+y/Qi7vxAXOjc+k9DnryfmsMs2w=~-1~-1~-1; cto_bundle=Q1qlkF8yVHpDRmJRcSUyQnFBeXpiYk8lMkJJNnlGa2NWYmZ1NlUzWnR6SzM0d2JuZm1kWTVhVzlXQ3htUHdyRVJUOCUyRlVlRExPUkkzRHpQZFZBUHJvN1FkR1ppa25mYWhsNmdVMG1Bd2JVOUduTk9WMXdJTnJwS0pyOW56Y29teEl2UEtKQXRjM2FZeFRqUTlQMlVRUWolMkJ1RVg0RUd6ZyUzRCUzRA; onap=1851a8c91d9x3be7e283-20-1878990b2eex747a9ef6-144-1681644005; lqstatus=1681643865||||; bm_sv=53BAE4FFBF99BF6112BAF81CE8CE8C11~YAAQduwZuDHeLFyHAQAAZzTLiRPKdTMLVUoBTxL/vIoZUJOV5a3o38p2dGySof6eSDmHijPnd8ituxucL+Dz+BnQoNyJPAEYGcKR3syIPMefKlG4aFSWe112pnVp+FSlRbzFJkvEql4IXZVeo5diFXkBoAa1szJ0pZd23l2v9bJPE4wp8N0tcqLbOq69dUMzXTQDPNtHyDaaAeYRVX9/ydcdXYjVdfMb7wJ1T6VdVEmlH/LTf0i1gW5YBWc8bVR6~1; _abck=ABAB22AB98BADA9BC3AA6264BB27B486~-1~YAAQv57YF3JmMYWHAQAAmeeziQmESk8B4ooisyPA/RCVs8vaApD1BaDATdp/VKXxKXKgoSv1y5m8PkqRMnKAARm1Ss9gdei3oqsUOI8TdutwKwBY+pgiYeinxFzAIB7YIdzD/moIuX/hK5zgG2hrtSK1X/9W4P9nFmVzurVH+wbWzQ3Ma65zABJ1KS4XN895Y7lztksCefpWMCzoj6gvfgraGv4tZGIxeCKgiyLRd6Ws57Y1z0g/4DZosBC7b3mTsR3GCLhIpbCIBInX79oyOY569Yg0orLRjral1Qo8E+532kVKSCLPbCGLZwXu6VW5n1/giYAwWLVBZMDlFf4W3ZXSU9GAOEriKXJG6tCrXalRu8067R0K8IKmiHOicpdpUyHucGzN7ft0jj4FW9tT+qD+DPrc72c=~-1~-1~-1; bm_sv=53BAE4FFBF99BF6112BAF81CE8CE8C11~YAAQvp7YF+hrc3CHAQAAoQzMiRMB2XBNq1UKjfIzTSduo7sdU4CFZaN1X45ZRAG9x9fmO88plVYS1GNglmrb0F9xveMOMJkBuFuUrrYlC7z2oMN7Tx+AGT0E8qOQzJwkp1N35cRHiy616GWlFZKaeuWL7TtgdVeZzdEaxChNefLS1sUKEQLSHsGOyU6kQ4PudZqrNWAt7dxCc+jrvad+SdCshB8nUiQlbR8RR4Ie9xL54u40GMhbe3jEhRLwZTEp~1',
  'dnt': '1',
  'sec-ch-ua': '"Chromium";v="112", "Google Chrome";v="112", "Not:A-Brand";v="99"',
  'sec-ch-ua-mobile': '?0',
  'sec-ch-ua-platform': '"Linux"',
  'sec-fetch-dest': 'empty',
  'sec-fetch-mode': 'navigate',
  'sec-fetch-site': 'same-origin',
  'upgrade-insecure-requests': '1',
  'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36'
}

list_cities = []


def get_detail(data):
  for region in data[0]['children']:
    for city in region['children']:
        list_cities.append({
                'location_id': city['id'],
                'city_name': city['name'],
                'latitude': city['latitude'],
                'longitude': city['longitude']
            })
        print('get city name: {}'.format(city['name']))

def to_csv():
  df = pd.DataFrame(list_cities)
  df.to_csv('city_locations.csv', index=False)


def main():
  response = requests.request("GET", url, headers=headers, data=payload)

  if response.status_code == 200:
    print("succesed to create request")
    data = json.loads(response.text)
    get_detail(data['data'])
  else:
    print("failed")


if __name__ == "__main__":
    main()
    to_csv()