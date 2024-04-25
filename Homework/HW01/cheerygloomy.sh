#!/bin/bash

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <your_input>"
    exit 1
fi

# Access the first command-line argument
input="$1"


sed '1,120d' $1 | sed '9117,9512d' > refinedText.txt

grep -o -n -E \
"(THE GOLDEN BIRD|HANS IN LUCK|JORINDA AND JORINDEL|THE TRAVELLING MUSICIANS|OLD SULTAN|THE STRAW, THE COAL, AND THE BEAN|BRIAR ROSE|THE DOG AND THE SPARROW|THE TWELVE DANCING PRINCESSES|THE FISHERMAN AND HIS WIFE|THE WILLOW-WREN AND THE BEAR|THE FROG-PRINCE|CAT AND MOUSE IN PARTNERSHIP|THE GOOSE-GIRL|THE ADVENTURES OF CHANTICLEER AND PARTLET|1. HOW THEY WENT TO THE MOUNTAINS TO EAT NUTS|2. HOW CHANTICLEER AND PARTLET WENT TO VISIT MR KORBES|RAPUNZEL|FUNDEVOGEL|THE VALIANT LITTLE TAILOR|HANSEL AND GRETEL|THE MOUSE, THE BIRD, AND THE SAUSAGE|MOTHER HOLLE|LITTLE RED-CAP [LITTLE RED RIDING HOOD]|THE ROBBER BRIDEGROOM|TOM THUMB|RUMPELSTILTSKIN|CLEVER GRETEL|THE OLD MAN AND HIS GRANDSON|THE LITTLE PEASANT|FREDERICK AND CATHERINE|SWEETHEART ROLAND|SNOWDROP|THE PINK|CLEVER ELSIE|THE MISER IN THE BUSH|ASHPUTTEL|THE WHITE SNAKE|THE WOLF AND THE SEVEN LITTLE KIDS|THE QUEEN BEE|THE ELVES AND THE SHOEMAKER|THE JUNIPER-TREE|THE TURNIP|CLEVER HANS|THE THREE LANGUAGES|THE FOX AND THE CAT|THE FOUR CLEVER BROTHERS|LILY AND THE LION|THE FOX AND THE HORSE|THE BLUE LIGHT|THE RAVEN|THE GOLDEN GOOSE|THE WATER OF LIFE|THE TWELVE HUNTSMEN|THE KING OF THE GOLDEN MOUNTAIN|DOCTOR KNOWALL|THE SEVEN RAVENS|THE WEDDING OF MRS FOX|FIRST STORY|SECOND STORY|THE SALAD|THE STORY OF THE YOUTH WHO WENT FORTH TO LEARN WHAT FEAR WAS|KING GRISLY-BEARD|IRON HANS|CAT-SKIN|SNOW-WHITE AND ROSE-RED)" \
 refinedText.txt | sed 's/:.*//' > lines.txt

# Catching an uppercase RUMPELSTILTSKIN
sed -i '' '27d' lines.txt

# Read numbers from file into the array
while IFS= read -r line; do
    lineNumberArray+=("$line")
done < lines.txt

#Needed for the last story
lineNumberArray+=(9116)

# Loop through array elements
arrayLength=${#lineNumberArray[@]}
for ((i=0; i<arrayLength; i++)); do
    current="${lineNumberArray[i]}"
    next=$((i + 1))
    if [ $next -lt $arrayLength ]; then
        nextNumber="${lineNumberArray[next]}"
        story=$(sed -n "${current},${nextNumber}p" refinedText.txt)
        sed -n "${current}p" refinedText.txt >> count.txt
        echo -e "\t---Grim Words---" >> count.txt
        grep -o -i -E "(darkness|destruction|dissolution|dying|extermination|grave|kill|murder|necrosis|rage|ruin|slay|slew|tomb|trouble)" <<< $story | sort | uniq -c | sort -r >> count.txt
        echo -e "\t---Cheery Words---" >> count.txt
        grep -o -i -E "(being|birth|beautiful|born|essence|growth|heart|joyful|life|soul|sparkle|spirit|vigor|vitality|zest)" <<< $story | sort | uniq -c | sort -r >> count.txt
    fi
done 






