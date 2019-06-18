#!/bin/bash

for i in {0..1394}
do
  curl "http://technologies.c2rmf.fr/fcgi-bin/iipsrv-prive100.fcgi?FIF=/pyr-F5/F5968/cop29/cop29_pyr_000_090.tif&JTL=6,$i" -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Connection: keep-alive' -H 'Cookie: SESSc194c3b0db720b56be7b57945c374efc=r2ik8gdj2m1qqcbdr0ticd1lq2; has_js=1' -H 'Upgrade-Insecure-Requests: 1'  --output "cop29_$i.tif"
  if [ $(( ($i + 1)  % 31)) -eq 0 ]; then
    let "line = ($i + 1) / 31"
    files=""
    for j in {0..30}
    do
      let "id = ( ($line - 1) * 31) + $j"
      files="$files cop29_$id.tif"
    done
    eval "convert $files +append cop29_line_$line.tif"
  fi
done
linefiles=""
for k in {1..45}
do
  linefiles="$linefiles cop29_line_$k.tif"
done
eval "convert -monitor -limit memory 2GiB -limit map 4GiB -define registry:temporary-path=/tmp $linefiles -append joconde.tif"
