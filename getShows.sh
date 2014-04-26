rm pages/*
i=1
while [ $i -le 5 ];
do
  curl "http://www.mysocialist.com/concerts?page="$i -o pages/$i.txt
  let i+=1
done
cd pages/
cat $(ls) > mySocialist.txt
sed "s/listingRow '>/listingRow'>/g" mySocialist.txt > mySocialist2.txt
mv mySocialist2.txt mySocialist.txt
cd ..
git add .
git commit -m "Update the list of shows"
git push
