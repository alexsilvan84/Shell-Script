#/bin/bash
resposta_http=($curl --write-out %{http_code} --silent --output /dev/null http://localhost)
echo $reposta_http

