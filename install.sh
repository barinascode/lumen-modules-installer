clear
echo "Initializing installator . . ."


if find ./temp -mindepth 1 | read; then
	echo "Cleaning temp folder"
	sudo rm ./temp/* -r

else
	echo "Downloading modules"
fi



## Downloading modules
cd temp
while read i;
    do
	git clone $i;

done < ../modules.txt
cd ..


echo "Installing modules"

## installing modules ##

for dir in temp/*
do
	echo -e "\t\t Installing ${dir}"

	echo -e "\t\t Adding migrations files"
	cp ./${dir}/database/migrations/* -r test/database/migrations

	echo -e "\t\t Adding models files"
	cp ./${dir}/app/*.php test/app

	echo -e "\t\t Adding controllers files"
	cp ./${dir}/app/Http/Controllers/* -r test/app/Http/Controllers

	echo -e "\t\t Adding routes to web.php file"

done
