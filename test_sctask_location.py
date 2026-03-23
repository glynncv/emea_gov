import requests
import os
from dotenv import load_dotenv

load_dotenv()

url = 'https://phinia.service-now.com/api/now/table/sc_task'
auth = (os.getenv('SNOW_USER'), os.getenv('SNOW_PASS'))

# Test with different location-related fields
params = {
    'sysparm_limit': 10,
    'sysparm_fields': 'number,location,location.u_site_name,request_item.location.u_site_name,assigned_to.location.u_site_name,cmdb_ci.location.u_site_name',
    'sysparm_display_value': 'all',
    'sysparm_query': 'stateNOT IN4,7'
}

print('Checking alternative location fields in sc_task...')
resp = requests.get(url, auth=auth, params=params, verify=False, timeout=30)
results = resp.json().get('result', [])

print(f'Fetched {len(results)} records\n')

# Check which fields have values
field_stats = {
    'location': 0,
    'location.u_site_name': 0,
    'request_item.location.u_site_name': 0,
    'assigned_to.location.u_site_name': 0,
    'cmdb_ci.location.u_site_name': 0
}

for rec in results:
    for field in field_stats.keys():
        val = rec.get(field)
        if val:
            if isinstance(val, dict):
                val = val.get('display_value', val.get('value', ''))
            if val and val != '':
                field_stats[field] += 1

print('Fields with data (out of 10 records):')
for field, count in field_stats.items():
    print(f'  {field}: {count}/10 records have values')

# Show sample with populated location
for field_name in ['request_item.location.u_site_name', 'assigned_to.location.u_site_name', 'cmdb_ci.location.u_site_name']:
    if field_stats[field_name] > 0:
        print(f'\nSample records with {field_name}:')
        count = 0
        for rec in results:
            site = rec.get(field_name)
            if site:
                if isinstance(site, dict):
                    site_val = site.get('display_value', 'N/A')
                else:
                    site_val = site
                num = rec.get('number')
                if isinstance(num, dict):
                    num = num.get('display_value', 'N/A')
                print(f'  {num}: {site_val}')
                count += 1
                if count >= 3:
                    break
