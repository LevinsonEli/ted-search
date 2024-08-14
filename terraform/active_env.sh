

BUCKET_NAME="plz-be-unique-bucket"

ENV_PATH="env:/tests/ted-search/terraform.state"
DEFAULT_WORKSPACE_PATH="ted-search/terraform.state"
PROJECT_NAME="ted-search"
STATE_FILE_NAME="terraform.state"

env_list=$(aws s3 ls s3://${BUCKET_NAME}/env:/ | grep "PRE" | sed 's/PRE //' | sed 's/\/*$//')

active_env_list=""
for env in $env_list; do
  env_resources_length=$(aws s3 cp s3://${BUCKET_NAME}/env:/${env}/${PROJECT_NAME}/${STATE_FILE_NAME} - | jq '.resources | length' | awk '{$1=$1;print}')
  if [ "$env_resources_length" -ne "0" ]; then
    active_env_list="$active_env_list\n$env"
  fi
done

echo -e "$active_env_list"

exit 0
