"""
Quick test script to verify EUC/EOSL data parsing function works correctly.
"""
import sys
import os
sys.path.insert(0, os.path.dirname(__file__))

# Import the function from the main script
from emea_gov_refresh import fetch_euc_assets

# Test the function
EUC_PATH = r"C:\EMEA_GOV\Data\EUC_EOSL.xlsx"

print("Testing EUC/EOSL data parsing...")
print("=" * 60)

df = fetch_euc_assets(EUC_PATH)

if df.empty:
    print("\nERROR: No data returned")
else:
    print(f"\nSUCCESS: Loaded {len(df)} records")
    print(f"\nDataFrame columns: {list(df.columns)}")
    print(f"\nSites found: {sorted(df['site'].unique())}")
    print(f"\nTarget dates found: {sorted(df['target_date_label'].unique())}")
    print(f"\nTotal devices needing replacement: {df['device_count'].sum()}")

    print("\n" + "=" * 60)
    print("Full data summary:")
    print("=" * 60)
    print(df.to_string(index=False))
