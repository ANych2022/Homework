#! bin/bash

echo "1) ip with most request"
cat example_log.log | cut -d' ' -f1 | sort | uniq -c | sort -rn | head -n 1

echo "2) most requested page"
cat example_log.log | awk '{print $11}' | sort | uniq -c | sort -rn | head -n 2 | tail -n 1

echo "3) how many request were from each ip"
cat example_log.log | awk '{print $1}' | sort | uniq -c | sort -rn 

echo "4) what not-existed pages where clients referred to?"
cat example_log.log | awk '{print $9 $11}' | sort | grep 404 | grep -v \"-\" | grep -v 200 | uniq

echo "5) what time did site get the most request?"
cat example_log.log | awk '{print $4}' | sort | uniq -c | sort -rn | tr -d "[" | head -n 5

echo "6) What search bots have accessed the site? (UA+IP)"
cat example_log.log | awk '{print $1 $2 $12 $13 $14 $15 $16 $17 $18}' | grep bot | sort | uniq -c | sort -rn  



