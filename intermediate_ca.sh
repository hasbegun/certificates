#!/bin/bash

INTERM_DIR=root/ca/intermediate
if [ ! -d $INTERM_DIR ]; then
  mkdir -p $INTERM_DIR/certs
  mkdir -p $INTERM_DIR/crl
  mkdir -p $INTERM_DIR/csr
  mkdir -p $INTERM_DIR/newcerts
  mkdir -p $INTERM_DIR/private

  chmod 700 $INTERM_DIR/private
  touch $INTERM_DIR/index.txt
  echo 01 > $INTERM_DIR/serial
fi

cd $INTERM_DIR
echo "Intermediate CA Location: `pwd`"
if [ ! -f openssl.cnf ]; then
  cat <<-EOF > openssl.cnf
  # OpenSSL intermediate CA configuration file.

  [ ca ]
  default_ca = CA_default

  [ CA_default ]
  # Directory and file locations.
  dir               = `pwd`
  certs             = \$dir/certs
  crl_dir           = \$dir/crl
  new_certs_dir     = \$dir/newcerts
  database          = \$dir/index.txt
  serial            = \$dir/serial
  RANDFILE          = \$dir/private/.rand

  # The root key and root certificate.
  private_key       = \$dir/private/intermediate.key.pem
  certificate       = \$dir/certs/intermediate.cert.pem

  # For certificate revocation lists.
  crlnumber         = \$dir/crlnumber
  crl               = \$dir/crl/intermediate.crl.pem
  crl_extensions    = crl_ext
  default_crl_days  = 30

  # SHA-1 is deprecated, so use SHA-2 instead.
  default_md        = sha256

  name_opt          = ca_default
  cert_opt          = ca_default
  default_days      = 375
  preserve          = no
  policy            = policy_loose

  [ policy_strict ]
  # The root CA should only sign intermediate certificates that match.
  # See the POLICY FORMAT section of man ca.
  countryName             = match
  stateOrProvinceName     = match
  organizationName        = match
  organizationalUnitName  = optional
  commonName              = supplied
  emailAddress            = optional

  [ policy_loose ]
  # Allow the intermediate CA to sign a more diverse range of certificates.
  # See the POLICY FORMAT section of the ca man page.
  countryName             = optional
  stateOrProvinceName     = optional
  localityName            = optional
  organizationName        = optional
  organizationalUnitName  = optional
  commonName              = supplied
  emailAddress            = optional

  [ req ]
  # Options for the req tool.
  default_bits        = 2048
  distinguished_name  = req_distinguished_name
  string_mask         = utf8only

  # SHA-1 is deprecated, so use SHA-2 instead.
  default_md          = sha256

  # Extension to add when the -x509 option is used.
  x509_extensions     = v3_ca

  [ req_distinguished_name ]
  # See <https://en.wikipedia.org/wiki/Certificate_signing_request>.
  countryName                     = Country Name (2 letter code)
  stateOrProvinceName             = State or Province Name
  localityName                    = Locality Name
  0.organizationName              = Organization Name
  organizationalUnitName          = Organizational Unit Name
  commonName                      = Common Name
  emailAddress                    = Email Address

  # Optionally, specify some defaults.
  countryName_default             = US
  stateOrProvinceName_default     = California
  localityName_default            = Palo Alto
  0.organizationName_default      = Menlo Security Inc.
  organizationalUnitName_default  = R&D
  emailAddress_default            = inho.choi@menlosecurity.com

  [ v3_ca ]
  # Extensions for a typical CA (man x509v3_config).
  subjectKeyIdentifier = hash
  authorityKeyIdentifier = keyid:always,issuer
  basicConstraints = critical, CA:true
  keyUsage = critical, digitalSignature, cRLSign, keyCertSign

  [ v3_intermediate_ca ]
  # Extensions for a typical intermediate CA (man x509v3_config).
  subjectKeyIdentifier = hash
  authorityKeyIdentifier = keyid:always,issuer
  basicConstraints = critical, CA:true, pathlen:0
  keyUsage = critical, digitalSignature, cRLSign, keyCertSign

  [ usr_cert ]
  # Extensions for client certificates (man x509v3_config).
  basicConstraints = CA:FALSE
  nsCertType = client, email
  nsComment = "OpenSSL Generated Client Certificate"
  subjectKeyIdentifier = hash
  authorityKeyIdentifier = keyid,issuer
  keyUsage = critical, nonRepudiation, digitalSignature, keyEncipherment
  extendedKeyUsage = clientAuth, emailProtection

  [ server_cert ]
  # Extensions for server certificates (man x509v3_config).
  basicConstraints = CA:FALSE
  nsCertType = server
  nsComment = "OpenSSL Generated Server Certificate"
  subjectKeyIdentifier = hash
  authorityKeyIdentifier = keyid,issuer:always
  keyUsage = critical, digitalSignature, keyEncipherment
  extendedKeyUsage = serverAuth

  [ crl_ext ]
  # Extension for CRLs (man x509v3_config).
  authorityKeyIdentifier=keyid:always

  [ ocsp ]
  # Extension for OCSP signing certificates (man ocsp).
  basicConstraints = CA:FALSE
  subjectKeyIdentifier = hash
  authorityKeyIdentifier = keyid,issuer
  keyUsage = critical, digitalSignature
  extendedKeyUsage = critical, OCSPSigning
EOF
fi

echo "`pwd`"
echo "cd to root/ca"
cd ..
echo "`pwd`"
if [ ! -f intermediate/private/intermediate.key.pem ]; then
  openssl genrsa -out intermediate/private/intermediate.key.pem 4096
  chmod 400 intermediate/private/intermediate.key.pem
  openssl req -config intermediate/openssl.cnf -new -sha256 \
        -key intermediate/private/intermediate.key.pem \
        -out intermediate/csr/intermediate.csr.pem \
        -subj "/C=US/ST=California/L=Menlo Park/O=Menlo Security, Inc./OU=QE Department/CN=INETEMU Intermediate CA"
fi

if [ ! -f intermediate/certs/intermediate.cert.pem ]; then
  openssl ca -batch -config openssl.cnf -extensions v3_intermediate_ca \
        -days 3650 -notext -md sha256 \
        -in intermediate/csr/intermediate.csr.pem \
        -out intermediate/certs/intermediate.cert.pem
fi

echo "Display intermediate pem."
openssl x509 -noout -text -in intermediate/certs/intermediate.cert.pem

echo "Verify the intermediate certificate."
echo
echo "This must show 'OK'"
openssl verify -CAfile certs/ca.cert.pem \
        intermediate/certs/intermediate.cert.pem

echo "Create the certificate chain file."
cat intermediate/certs/intermediate.cert.pem \
    certs/ca.cert.pem > intermediate/certs/ca-chain.cert.pem
chmod 444 intermediate/certs/ca-chain.cert.pem
