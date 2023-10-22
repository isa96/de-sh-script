URL_PREFIX="https://d37ci6vzurychx.cloudfront.net/trip-data"
YEAR=2022
TAXI_TYPE="green"

for MONTH in {1..12}; do
    
    # ext_file
    FMONTH=$(printf "%02d" $MONTH)

    FILE_SUFFIX="${TAXI_TYPE}_tripdata_${YEAR}-${FMONTH}.parquet"
    URL="${URL_PREFIX}/${FILE_SUFFIX}"
    echo "$URL"

    # locate
    LOCAL_PATH="data/raw/${TAXI_TYPE}/${YEAR}/${FMONTH}"
    LOCAL_SAVE="${LOCAL_PATH}/${FILE_SUFFIX}"

    mkdir -p ${LOCAL_PATH}
    wget ${URL} -O ${LOCAL_SAVE}
    
    # gzip ${LOCAL_SAVE}

done
