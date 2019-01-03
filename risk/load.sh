#!/bin/bash

clickhouseclient='docker run -i --rm --link some-clickhouse-server:clickhouse-server yandex/clickhouse-client --host clickhouse-server'

time (for filename in ./analytics_2*.csv; do
            echo $filename
            cat $filename | \
            $clickhouseclient \
            --query="INSERT INTO analytics FORMAT CSVWithNames"
        done)
