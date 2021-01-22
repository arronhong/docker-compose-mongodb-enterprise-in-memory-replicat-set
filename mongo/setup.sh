#!/bin/bash

mongo rs1:27041 --eval "print('ok')"
mongo rs2:27042 --eval "print('ok')"
mongo rs3:27043 --eval "print('ok')"
mongo --host rs1:27041 <<EOF
rs.initiate({
   _id : "RS",
   members: [
      { _id: 0, host: "rs1:27041" },
      { _id: 1, host: "rs2:27042" },
      { _id: 2, host: "rs3:27043" }
   ]
})
EOF
mongo --host RS/rs1:27041,rs2:27042,rs3:27043