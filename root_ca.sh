#!/bin/bash

CA_DIR=root/ca
if [ ! -d $CA_DIR ]; then
  mkdir -p $CA_DIR
  mkdir -p $CA_DIR/certs
  mkdir -p $CA_DIR/crl
  mkdir -p $CA_DIR/newcerts
  mkdir -p $CA_DIR/private
  chmod 700 $CA_DIR/private
  touch $CA_DIR/index.txt
  echo '01' > $CA_DIR/serial
fi

cd $CA_DIR
echo "ROOT CA Location: `pwd`"
if [ ! -f openssl.cnf ]; then
  cat <<-EOF > openssl.cnf
  # OpenSSL root CA configuration file.

  [ ca ]
  # man ca
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
  private_key       = \$dir/private/ca.key.pem
  certificate       = \$dir/certs/ca.cert.pem

  # For certificate revocation lists.
  crlnumber         = \$dir/crlnumber
  crl               = \$dir/crl/ca.crl.pem
  crl_extensions    = crl_ext
  default_crl_days  = 30

  # SHA-1 is deprecated, so use SHA-2 instead.
  default_md        = sha256

  name_opt          = ca_default
  cert_opt          = ca_default
  default_days      = 375
  preserve          = no
  policy            = policy_strict

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
  # Options for the req tool (man req).
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

if [ ! -f private/ca.key.pem ]; then
  echo "Create CA key...."
  openssl genrsa -out private/ca.key.pem 4096
  chmod 400 private/ca.key.pem

  echo "Creat CA Cert..."
  openssl req -config openssl.cnf \
        -key private/ca.key.pem \
        -new -x509 -days 7300 -sha256 -extensions v3_ca \
        -out certs/ca.cert.pem \
        -subj "/C=US/ST=California/L=Menlo Park/O=Menlo Security, Inc./OU=QE Department/CN=INETEMU Root CA"

  chmod 444 certs/ca.cert.pem
fi
openssl x509 -noout -text -in certs/ca.cert.pem
