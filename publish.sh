bundle exec middleman build
read -p "Press enter to continue"

git add -A
git commit -m "Build `date`"
git push origin source

cd build
git add -A
git commit -m "Build `date`"
git push origin master

read -p "Press enter to exit"
