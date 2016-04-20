#!/bin/bash

# upload generator.js to wware.

uid="$1"
snippet_id="$2"
snippet_name="$3"
snippet_desc="$4"
upload="$5"

curl -s -X POST \
  "http://www.wware.org/core/cs.update.json?id=$snippet_id&uid=$uid&_ajax=true&ct=public&successUrl=/core/detail.html" \
  --cookie "@/home/chenyang/wwarecookies.txt" \
  -F name="$snippet_name" \
  -F desc="$snippet_desc" \
  -F proctype="session" \
  -F procdetail="默认值" \
  -F procin="默认值" \
  -F tags="默认值" \
  -F insertpoint="默认值" \
  -F generator="@$upload" 1> /dev/null
