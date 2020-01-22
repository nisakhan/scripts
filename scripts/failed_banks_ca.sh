import csv
import urllib.request
import codecs

url = "https://www.fdic.gov/bank/individual/failed/banklist.csv"
ftpstream = urllib.request.urlopen(url)
csvfile = csv.reader(codecs.iterdecode(ftpstream, 'utf-8'))

x = 0
with open('failed_banks_ca.csv', 'w', newline='') as file:
  writer = csv.writer(file)
  writer.writerow(["Bank Name", "City", "ST", "CERT", "Acquiring Institution", "Closing Date"])
  for row in csvfile:
    if row[2] == 'CA':
      x += 1
      writer.writerow(row)
print("There are " + str(x) + " failed banks in CA")
