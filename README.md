# certificates

This project generate a root, an intermediate CA, a certificate for specific site and sign.
When use self-signed cert, browsers show a warning that the site is not secire.
But while in dev and test just don't want to see this warning.

To run the program, simply runt sign.sh www.bar.com
It will generate Root CA and Intermediate CA and cert for www.bar.com and signs.

At the end ca-chain.cert.pem, and www.bar.com.pem. This www.bar.com.pem contains cert and key.
In order to make the browser your sig-signed cert, add trust this ca-chain.cert.pem and load www.bar.com.pem on your web server.
That's it!

Here is the example run on OSX 10.13

$ ./sign.sh www.bar.com
ROOT CA Location: /Users/~~~/certificates/root/ca
Create CA key....
Generating RSA private key, 4096 bit long modulus
................................++
....................................................................++
e is 65537 (0x10001)
Creat CA Cert...
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 11131537861046429765 (0x9a7b2ab50b7be845)
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=US, ST=California, L=Menlo Park, O=Menlo Security, Inc., OU=QE Department, CN=INETEMU Root CA
        Validity
            Not Before: Oct 26 06:40:29 2017 GMT
            Not After : Oct 21 06:40:29 2037 GMT
        Subject: C=US, ST=California, L=Menlo Park, O=Menlo Security, Inc., OU=QE Department, CN=INETEMU Root CA
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (4096 bit)
                Modulus:
                    00:cb:85:5c:4f:0c:30:b0:c8:12:72:cc:5d:2e:7d:
                    ...
                    2e:ac:99:a6:c7:a3:dc:8b:4f:c2:37:dd:75:d6:2c:
                    14:ea:ab
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Subject Key Identifier:
                42:2B:59:D0:21:9C:84:9E:7C:1A:F8:C9:27:61:A2:EA:CB:8F:11:6C
            X509v3 Authority Key Identifier:
                keyid:42:2B:59:D0:21:9C:84:9E:7C:1A:F8:C9:27:61:A2:EA:CB:8F:11:6C

            X509v3 Basic Constraints: critical
                CA:TRUE
            X509v3 Key Usage: critical
                Digital Signature, Certificate Sign, CRL Sign
    Signature Algorithm: sha256WithRSAEncryption
         b7:4c:69:19:50:45:11:13:24:b2:f3:22:a5:64:55:8f:34:11:
         ...
         37:63:5a:2b:82:e6:c1:67
Intermediate CA Location: /Users/~~~/certificates/root/ca/intermediate
/Users/~~~/certificates/root/ca/intermediate
cd to root/ca
/Users/~~~/certificates/root/ca
Generating RSA private key, 4096 bit long modulus
.............................................................................................++
..................................++
e is 65537 (0x10001)
Using configuration from openssl.cnf
Check that the request matches the signature
Signature ok
Certificate Details:
        Serial Number: 1 (0x1)
        Validity
            Not Before: Oct 26 06:40:43 2017 GMT
            Not After : Oct 24 06:40:43 2027 GMT
        Subject:
            countryName               = US
            stateOrProvinceName       = California
            organizationName          = Menlo Security, Inc.
            organizationalUnitName    = QE Department
            commonName                = INETEMU Intermediate CA
        X509v3 extensions:
            X509v3 Subject Key Identifier:
                CD:24:BC:F0:78:10:C9:AE:A1:AE:AF:5F:0B:A0:74:E4:4F:F6:65:2F
            X509v3 Authority Key Identifier:
                keyid:42:2B:59:D0:21:9C:84:9E:7C:1A:F8:C9:27:61:A2:EA:CB:8F:11:6C

            X509v3 Basic Constraints: critical
                CA:TRUE, pathlen:0
            X509v3 Key Usage: critical
                Digital Signature, Certificate Sign, CRL Sign
Certificate is to be certified until Oct 24 06:40:43 2027 GMT (3650 days)

Write out database with 1 new entries
Data Base Updated
Display intermediate pem.
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 1 (0x1)
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=US, ST=California, L=Menlo Park, O=Menlo Security, Inc., OU=QE Department, CN=INETEMU Root CA
        Validity
            Not Before: Oct 26 06:40:43 2017 GMT
            Not After : Oct 24 06:40:43 2027 GMT
        Subject: C=US, ST=California, O=Menlo Security, Inc., OU=QE Department, CN=INETEMU Intermediate CA
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (4096 bit)
                Modulus:
                    00:c0:b4:fc:13:96:c3:ce:0f:73:f8:33:89:27:4d:
                    ...
                    4a:4d:23
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Subject Key Identifier:
                CD:24:BC:F0:78:10:C9:AE:A1:AE:AF:5F:0B:A0:74:E4:4F:F6:65:2F
            X509v3 Authority Key Identifier:
                keyid:42:2B:59:D0:21:9C:84:9E:7C:1A:F8:C9:27:61:A2:EA:CB:8F:11:6C

            X509v3 Basic Constraints: critical
                CA:TRUE, pathlen:0
            X509v3 Key Usage: critical
                Digital Signature, Certificate Sign, CRL Sign
    Signature Algorithm: sha256WithRSAEncryption
         83:20:bd:de:4a:38:7b:f5:3a:9b:7b:6c:a2:32:2e:62:4d:7d:
         ...
         ee:3a:ce:aa:2c:f3:e3:de
Verify the intermediate certificate.

This must show 'OK'
intermediate/certs/intermediate.cert.pem: OK
Create the certificate chain file.
/Users/~~~/certificates/root/ca
Generate key for www.bar.com
Generating RSA private key, 2048 bit long modulus
....+++
......................................+++
e is 65537 (0x10001)
Generate csr for www.bar.com
Using configuration from intermediate/openssl.cnf
Check that the request matches the signature
Signature ok
Certificate Details:
        Serial Number: 1 (0x1)
        Validity
            Not Before: Oct 26 06:40:44 2017 GMT
            Not After : Oct 26 06:40:44 2018 GMT
        Subject:
            countryName               = US
            stateOrProvinceName       = California
            localityName              = Menlo Park
            organizationName          = Menlo Security, Inc.
            organizationalUnitName    = QE Department
            commonName                = www.bar.com
        X509v3 extensions:
            X509v3 Basic Constraints:
                CA:FALSE
            Netscape Cert Type:
                SSL Server
            Netscape Comment:
                OpenSSL Generated Server Certificate
            X509v3 Subject Key Identifier:
                93:A2:C3:BB:F4:EC:52:C4:EB:31:81:51:00:24:25:51:55:BF:C3:4B
            X509v3 Authority Key Identifier:
                keyid:CD:24:BC:F0:78:10:C9:AE:A1:AE:AF:5F:0B:A0:74:E4:4F:F6:65:2F
                DirName:/C=US/ST=California/L=Menlo Park/O=Menlo Security, Inc./OU=QE Department/CN=INETEMU Root CA
                serial:01

            X509v3 Key Usage: critical
                Digital Signature, Key Encipherment
            X509v3 Extended Key Usage:
                TLS Web Server Authentication
Certificate is to be certified until Oct 26 06:40:44 2018 GMT (365 days)

Write out database with 1 new entries
Data Base Updated
Show www.bar.com
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 1 (0x1)
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=US, ST=California, O=Menlo Security, Inc., OU=QE Department, CN=INETEMU Intermediate CA
        Validity
            Not Before: Oct 26 06:40:44 2017 GMT
            Not After : Oct 26 06:40:44 2018 GMT
        Subject: C=US, ST=California, L=Menlo Park, O=Menlo Security, Inc., OU=QE Department, CN=www.bar.com
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:ce:58:b3:2e:75:86:32:6a:4f:f5:8c:03:d1:55:
                    ...
                    5f:87
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Basic Constraints:
                CA:FALSE
            Netscape Cert Type:
                SSL Server
            Netscape Comment:
                OpenSSL Generated Server Certificate
            X509v3 Subject Key Identifier:
                93:A2:C3:BB:F4:EC:52:C4:EB:31:81:51:00:24:25:51:55:BF:C3:4B
            X509v3 Authority Key Identifier:
                keyid:CD:24:BC:F0:78:10:C9:AE:A1:AE:AF:5F:0B:A0:74:E4:4F:F6:65:2F
                DirName:/C=US/ST=California/L=Menlo Park/O=Menlo Security, Inc./OU=QE Department/CN=INETEMU Root CA
                serial:01

            X509v3 Key Usage: critical
                Digital Signature, Key Encipherment
            X509v3 Extended Key Usage:
                TLS Web Server Authentication
    Signature Algorithm: sha256WithRSAEncryption
         ac:66:99:c4:4d:64:a5:c2:e6:cd:8a:e6:4c:ce:b9:1a:a2:8c:
         ...
         bd:cf:b0:46:bd:f8:43:d2
Verify ceritificate...
This must be ok
intermediate/certs/www.bar.com.cert.pem: OK
