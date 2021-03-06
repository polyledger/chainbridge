echo "\033[32mGetting Bitbutter users...\033[0m\n"

timestamp=$(date +%s000)
method=GET
route=/v1/partnerships/$BITBUTTER_PARTNERSHIP_ID/users
signature=$(python get_signature.py $timestamp $method $route)

curl --request $method \
  --url "${BITBUTTER_BASE_URI}${route}" \
  --header "BB-ACCESS-KEY: ${BITBUTTER_API_KEY}" \
  --header "BB-ACCESS-SIGN: ${signature}" \
  --header "BB-PARTNER-ID: ${BITBUTTER_PARTNER_ID}" \
  --header "BB-TIMESTAMP: ${timestamp}" | json_pp
