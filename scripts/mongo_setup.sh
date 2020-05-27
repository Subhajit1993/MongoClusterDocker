#!/bin/bash
echo "sleeping for 10 seconds"
sleep 10

echo mongo_setup.sh time now: `date +"%T" `
mongo --host 10.0.0.20 --port 27017 <<EOF
  var cfg = {
    "_id": "rs",
    "members": [
      {
        "_id": 0,
        "host": "10.0.0.20:27017",
      },
      {
        "_id": 1,
        "host": "10.0.0.21:27017",
      },
      {
        "_id": 2,
        "host": "10.0.0.22:27017",
      }
    ]
  };
  rs.initiate(cfg);
EOF