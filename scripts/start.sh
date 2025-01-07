source scripts/utils.sh

language=$(validateLanguage "$1")
config=$(validateConfig "$2")
spec=$(validateSpec "$3")
output=$(getOutput $spec $language)

openapi_json="$output/openapi.json"

if [ ! -s $openapi_json ]; then # file exists and is empty
  scripts/generate.sh $language $config $spec
fi

node server.js $openapi_json
