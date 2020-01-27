wget "https://www.fdic.gov/bank/individual/failed/banklist.csv"
csvgrep --columns ST --match CA banklist.csv > failed_banks_ca.csv
X="$(wc -l < failed_banks_ca.csv)"
echo "There are $(($X-1)) failed banks in CA"
