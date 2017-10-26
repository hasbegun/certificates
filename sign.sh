#!/bin/bash

CA_DIR=root/ca

if [ ! -f $CA_DIR/certs/ca.cert.pem ];
then
  root_ca.sh
  intermediate_ca.sh
fi

if [ -z $1 ]; then
	echo "Signing requires target site. But it is empty."
	exit
else
	TARGET=$1
fi

cd $CA_DIR
echo "`pwd`"

if [ ! -f intermediate/private/$TARGET.key.pem ]; then
  echo "Generate key for $TARGET"
  openssl genrsa -out intermediate/private/$TARGET.key.pem 2048
  chmod 400 intermediate/private/$TARGET.key.pem
  openssl req -config intermediate/openssl.cnf \
        -key intermediate/private/$TARGET.key.pem \
        -new -sha256 -out intermediate/csr/$TARGET.csr.pem \
        -subj "/C=US/ST=California/L=Menlo Park/O=Menlo Security, Inc./OU=QE Department/CN=$TARGET"
fi
if [ ! -f intermediate/certs/$TARGET.cert.pem ]; then
  echo "Generate csr for $TARGET"
  openssl ca -batch -config intermediate/openssl.cnf \
        -extensions server_cert -days 365 -notext -md sha256 \
        -in intermediate/csr/$TARGET.csr.pem \
        -out intermediate/certs/$TARGET.cert.pem
  chmod 444 intermediate/certs/$TARGET.cert.pem
fi
echo "Show $TARGET"
openssl x509 -noout -text \
      -in intermediate/certs/$TARGET.cert.pem

echo "Verify ceritificate..."
echo "This must be ok"
openssl verify -CAfile intermediate/certs/ca-chain.cert.pem \
      intermediate/certs/$TARGET.cert.pem

if [ ! -f ../../ca-chain.cert.pem ]; then
  cp intermediate/certs/ca-chain.cert.pem ../../
fi
cat intermediate/certs/$TARGET.cert.pem intermediate/private/$TARGET.key.pem > ../../$TARGET.pem
