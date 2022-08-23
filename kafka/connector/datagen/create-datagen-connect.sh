#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# ./register-datagen-campaign-finance.sh
./register-datagen-clickstream-codes.sh
./register-datagen-clickstream-users.sh
./register-datagen-clickstream.sh
./register-datagen-credit-cards.sh
./register-datagen-inventory.sh
./register-datagen-orders.sh
./register-datagen-pageviews.sh
./register-datagen-product.sh
./register-datagen-purchases.sh
./register-datagen-ratings.sh
./register-datagen-stock-trades.sh
./register-datagen-stores.sh
./register-datagen-transactions.sh
./register-datagen-users-array-map.sh
./register-datagen-users.sh
