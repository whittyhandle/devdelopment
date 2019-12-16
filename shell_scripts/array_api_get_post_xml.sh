#!/bin/bash

getAdvancedComputerSearches=$(curl -sku test:test "accept: application/xml" https://URLt:8443/JSSResource/advancedcomputersearches | xmllint --xpath "/advanced_computer_searches/advanced_computer_search/id" - | sed 's/<[^>]*>/ /g')

IFS=' ' read -r -a array <<< "$getAdvancedComputerSearches" 

for id in ${array[@]};do
	getAdvancedComputerSearchesCriteria=$(curl -sku test:test "accept: application/xml" https://URL:8443/JSSResource/advancedcomputersearches/id/$id | xmllint --nowarning --format - --xpath 'advanced_computer_search' | sed '1d')
	
	echo $getAdvancedComputerSearchesCriteria >> ~/Desktop/AdvancedComputerSearchesCriteria
	if [[ -f ~/Desktop/advsearches ]]; then
		curl -sku test:test -H "accept: application/xml" https://URL:8443/JSSResource/advancedcomputersearches/id/$id -X DELETE
		else 
			echo "file not found"
		fi
done

read -p "Press enter to continue"

curl -sku test:test "accept: text/xml" https://URL:8443/JSSResource/advancedcomputersearches -T ~/Desktop/AdvancedComputerSearchesCriteria
