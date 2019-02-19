echo "Initializing installator . . ."

if find ./temp -mindepth 1 | read; then
echo "Cleaning temp folder"
sudo rm ./temp/* -r

else
	echo "Downloading modules"
	cd temp

while read i;
                do
        git clone $i;

        done < ../modules.txt
fi
