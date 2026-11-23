#!/bin/bash -e

# This is the first question

rm -rf demo
git init --bare demo
cd demo
touch hello.txt
if ! git add hello.txt
then
	echo "yes! the git add command failed"
fi
cd ..

# This is the second question
rm -rf demo
git init demo
cd demo
for x in {1..3}
do
	touch "${x}.txt"
	git add "${x}.txt"
	git commit -m "commit ${x}"
done
git config user.name "Bill Gates"
git config user.email "billg@microbluff.com"
for x in {4..6}
do
	touch "${x}.txt"
	git add "${x}.txt"
	git commit -m "commit ${x}"
done
git --no-pager log
cd ..
