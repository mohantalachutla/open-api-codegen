
language=$1
LANGUAGE_DEFAULT="spring"
config=$2
CONFIG_DEFAULT="config.json"
spec=$3
SPEC_DEFAULT="specs/api.yml"

if [ -z "$spec" ]; then
  spec=$SPEC_DEFAULT
  echo "Missing spec file. defaulting to $spec"
fi

if [ ! -f "$spec" ]; then
  echo "Spec file does not exist"
  exit 1
fi

if [ -z "$language" ]; then
  language=$LANGUAGE_DEFAULT ## openapi-generator-cli list ;to get available languages
  echo "Missing language. defaulting to $language"
fi

if [ -z "$config" ]; then
  config=$CONFIG_DEFAULT
  echo "Missing config file. defaulting to $config"
fi

if [ ! -f "$config" ]; then
  echo "Config file does not exist"
  exit 1
fi

# extract the name of the spec file
base_name=$(basename "$spec") # removed the path
spec_name="${base_name%.*}" # removed the part after the last .
spec_ext="${base_name##*.}" # removed the part before the last .
echo "Base: $base_name, Spec name: $spec_name, ext: $spec_ext"

output="generated/${spec_name}/${language}"

if [ ! -d "$output" ]; then
  mkdir -p "$output"
else
  rm -rf "$output"
fi

echo "Generating $language from $spec to $output"
echo "----------------------------"
echo "\n\n"
openapi-generator-cli generate -i "$spec" -g "$language" -o "$output" -c "$config" --additional-properties=dateLibrary=java8,useTags=true