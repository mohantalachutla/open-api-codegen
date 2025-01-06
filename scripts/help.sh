language=java
if [ ! -z "$1" ]; then
  language=$1
fi

openapi-generator-cli config-help -g $language