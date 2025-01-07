SPEC_DEFAULT="specs/api.yml"
CONFIG_DEFAULT="config.json"
LANGUAGE_DEFAULT="spring"

function validateSpec() {
  local spec=${1:-$SPEC_DEFAULT}

  if [ ! -s "$spec" ]; then # file exists and is not empty
    echo "Spec file does not exist"
    exit 1
  fi
  echo $spec
}

function validateConfig() {
  local config=${1:-$CONFIG_DEFAULT}

  if [ ! -s "$config" ]; then # file exists and is not empty
    echo "Config file does not exist"
    exit 1
  fi
  echo $config
}

function validateLanguage() {
  echo ${1:-$LANGUAGE_DEFAULT}
}

function getOutput() {
  # extract the name of the spec file
  local base_name=$(basename "$1")  # removed the path
  local spec_name="${base_name%.*}" # removed the part after the last .
  local spec_ext="${base_name##*.}" # removed the part before the last .
  echo "Base: $base_name, Spec name: $spec_name, ext: $spec_ext" >&2
  echo "generated/${spec_name}/${2}"
}

function cleanOutput() {
  local output="$1"
  if [ ! -d $output ]; then
    mkdir -p $output
  else
    rm -rf $output
  fi
}
