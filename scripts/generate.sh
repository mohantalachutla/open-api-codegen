source scripts/utils.sh

language=$(validateLanguage "$1")
config=$(validateConfig "$2")
spec=$(validateSpec "$3")
output=$(getOutput $spec $language)

cleanOutput $output

echo "Generating $language from $spec to $output"
echo "----------------------------"
echo "\n\n"
openapi-generator-cli generate -i "$spec" -g "$language" -o "$output" -c "$config" --additional-properties=dateLibrary=java8,useTags=true
