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
                    e6:05:73:c1:63:69:73:a5:19:22:01:d5:7c:94:47:
                    7d:78:80:7a:c0:e7:03:71:5a:c4:8a:00:02:3d:f8:
                    4c:a6:77:83:84:7a:ee:fc:0e:e4:38:6b:45:b6:b9:
                    04:1e:48:fe:5c:04:41:d1:8d:32:73:ee:ed:90:7b:
                    e7:ab:58:b1:46:d5:98:77:3c:7e:3f:a8:8e:69:29:
                    1f:8d:7c:e3:c7:4e:6b:89:55:d9:18:d5:04:2e:56:
                    4a:94:7d:fb:34:90:e7:0f:bf:ef:e0:bf:00:8c:95:
                    b0:f0:0f:c8:0f:bc:95:1a:ce:0d:2b:67:80:71:f4:
                    7c:bd:86:68:8d:33:7c:dd:a8:2c:df:96:26:c0:ea:
                    87:87:3a:b1:8d:b9:1a:fc:10:63:36:47:66:c8:bd:
                    1f:3f:77:c7:a7:d3:80:ea:e4:0a:48:82:c6:59:fa:
                    60:e6:c1:06:c5:4f:a0:ab:96:4a:67:9b:43:74:01:
                    ef:5a:7d:2f:e6:6a:ea:c0:69:7c:0d:10:65:d1:66:
                    5e:02:db:1a:86:0e:50:a9:ff:4f:64:77:c7:e0:58:
                    ce:32:6e:d1:4e:84:ef:ef:fa:cc:42:64:1f:5e:90:
                    43:08:2d:e3:49:88:42:5e:ef:a9:df:55:8f:5a:e2:
                    25:9e:2b:8d:d3:0d:a0:55:37:1c:d3:a4:63:db:02:
                    7e:27:54:6a:50:70:0f:1b:5c:77:5e:55:f8:e0:14:
                    a0:93:bf:b2:80:bb:4c:e2:03:6a:6c:dd:ca:9a:9f:
                    49:af:35:1a:0e:8c:c6:28:f0:1c:00:20:f8:45:e3:
                    86:45:d3:be:50:66:a9:d2:e8:d2:8a:ce:12:bd:e4:
                    64:43:21:43:9a:ae:c0:7d:6d:41:c1:31:e1:1e:9e:
                    9e:6d:1d:d5:f6:39:e3:2a:79:44:fd:8e:82:6f:6f:
                    72:6b:eb:bb:ec:1b:bc:cc:76:2f:99:0e:5e:12:9f:
                    ed:70:e7:bb:04:29:6b:5b:ea:6d:a5:48:59:8c:dc:
                    39:3b:f0:1c:af:13:c7:86:b3:5f:7e:10:ea:f7:b0:
                    51:0c:cc:17:37:e4:43:f3:86:7d:35:e3:ef:04:64:
                    bd:0a:62:bb:78:c0:ea:bc:2e:0a:d0:17:26:a8:aa:
                    6a:ab:25:c9:94:28:d0:18:2d:1c:be:3e:14:c9:00:
                    f4:7a:ba:69:df:6f:b5:85:ed:74:00:21:e2:c7:d9:
                    cc:cd:0d:15:dd:3b:af:d9:1e:46:c4:73:ed:25:d9:
                    a9:09:35:d0:63:3c:2b:90:5c:a2:24:77:7c:d8:63:
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
         f0:8a:39:6f:ab:e3:ac:ee:b6:3b:19:cb:f7:ed:9a:99:7b:51:
         e9:79:1c:21:f3:0d:fc:8d:08:9e:68:6a:32:f6:17:23:20:40:
         17:ca:44:09:e2:e9:3e:e6:3d:a8:67:d5:6a:8b:70:7a:79:bc:
         22:e6:e9:d3:19:ee:b9:b4:1b:34:1c:02:18:97:3f:8f:29:a1:
         d0:01:ac:04:fa:a2:d5:5b:06:cc:52:3e:d6:ba:76:f4:29:17:
         3e:c5:2a:92:df:c7:0d:1b:d7:25:f5:1e:aa:3c:26:46:9c:2c:
         78:7d:ca:f8:83:6f:a9:ca:fc:22:02:e0:4a:6e:b7:59:82:7a:
         21:1f:af:48:45:b4:de:a5:68:b8:19:c6:a9:bc:d8:ca:41:24:
         f1:73:c3:bf:a6:19:18:c1:6d:a7:0a:39:d0:4a:70:2b:1b:84:
         36:6a:4e:84:07:a3:be:7d:82:6b:3e:85:2b:ab:65:31:7f:5f:
         f3:d1:46:10:a6:ac:1e:fe:88:56:f9:1f:d8:fe:f9:c7:1f:b3:
         0a:4c:4f:98:2e:fd:1e:bd:0c:41:58:13:86:15:16:72:aa:a8:
         38:f7:1a:f5:ed:dd:62:88:c0:d6:c0:27:57:eb:b0:1f:67:cf:
         50:2d:49:65:ad:e5:9f:74:ff:7f:1c:22:38:42:ed:c8:5f:6c:
         d0:cb:43:89:53:ab:23:b4:d6:69:ca:d0:79:f7:d4:65:76:04:
         c3:7c:38:7e:b5:05:06:8e:e4:d9:2f:6e:7c:e4:30:f8:89:e8:
         cf:79:89:45:bf:0d:50:0c:bd:e8:bf:ae:d0:89:34:69:98:7d:
         da:19:97:43:e0:74:52:69:65:86:2e:9e:23:95:c7:c9:8d:16:
         23:30:c9:c6:f6:c0:fc:5d:65:28:d2:8e:da:44:6e:73:43:43:
         89:24:b1:8e:3a:52:7a:13:b8:b9:6e:9c:cb:7c:37:0f:b0:f1:
         30:ae:43:1c:c8:4c:6e:41:e1:99:f0:1e:0b:f5:ba:67:76:47:
         24:04:eb:74:5b:51:3b:90:e9:1c:aa:f4:9b:c2:43:8a:89:cb:
         37:44:4c:ab:52:32:54:0f:57:4f:7e:fe:14:b6:02:7c:e9:a8:
         06:a7:9c:2b:a2:7b:09:70:e4:43:9e:5b:c3:b0:2b:52:b9:39:
         14:6d:73:dc:9d:fd:b8:44:9a:c4:cc:a1:92:ab:cd:b3:77:18:
         40:a2:ef:f3:06:ba:f4:72:3a:77:fc:3d:ae:64:e9:10:35:be:
         d7:b4:ed:e1:39:8a:a3:cd:00:4c:bf:ea:9a:f4:51:e5:05:c0:
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
                    e1:59:41:2c:cb:b8:8b:9f:c3:68:45:50:6e:04:d0:
                    72:b7:a5:6d:17:b6:d1:19:42:bd:09:b4:c2:32:ec:
                    8d:69:b2:02:05:62:49:b3:5c:ee:ed:67:21:de:88:
                    c2:e6:f7:4b:b5:ae:31:ec:07:f3:15:b2:7e:87:c3:
                    4b:b5:4d:7e:4c:fe:45:9f:61:9a:ac:24:d6:4e:75:
                    d2:f0:e2:55:7b:02:6e:24:bb:6e:04:5d:02:d9:98:
                    0e:2c:87:6f:5f:cc:10:c6:c3:ec:75:c1:dd:ed:e9:
                    b5:59:9e:a7:67:e4:7c:13:ab:2d:6c:0d:31:55:dd:
                    ff:3e:7f:c3:ff:b2:0d:39:20:0c:8c:db:7e:48:0a:
                    e2:0f:0c:8a:6e:f9:2a:a9:6f:60:c8:5a:18:69:4a:
                    ea:b4:05:04:a6:72:1a:5d:c0:96:01:de:21:c2:84:
                    32:58:c4:20:ad:d7:92:81:90:f7:75:cf:62:16:29:
                    05:14:f8:cf:87:19:d1:50:be:b4:6a:6b:e9:a9:ff:
                    51:32:de:c6:0b:f7:2a:f4:87:af:f5:d7:ab:d5:90:
                    8d:c6:b0:3f:c3:02:4f:0b:39:0e:bf:e4:46:fd:26:
                    2f:dd:29:21:1e:82:0a:62:ce:80:7b:55:c2:19:1e:
                    ce:aa:1a:ea:e8:a9:8a:4b:18:bb:b8:2c:80:47:af:
                    5f:f6:f2:a8:1e:84:96:5d:03:ab:64:60:97:02:e4:
                    e1:5a:6b:15:5e:9c:7c:b3:d6:1f:4a:9d:fb:1d:36:
                    8e:13:af:c9:3a:40:8c:45:6e:cb:de:d9:d5:64:fa:
                    d6:d7:72:2a:42:60:79:30:ec:63:0f:51:77:4f:0f:
                    a3:66:72:3f:62:b6:fd:e2:1e:a1:5b:a3:a8:8b:70:
                    a5:45:6d:f1:54:65:44:7d:78:fa:b4:ed:67:0c:d0:
                    ca:8b:7e:50:48:02:db:dd:b4:82:f4:be:b4:46:96:
                    a5:52:3b:cf:e7:f0:aa:52:eb:d2:07:02:20:a4:81:
                    23:c7:1e:10:e2:e5:15:04:bc:6d:49:5a:ee:52:3a:
                    77:f7:65:8f:14:72:4b:f5:c6:fd:81:46:64:14:b4:
                    b8:b9:ee:21:cf:59:14:00:3e:ea:e8:53:65:eb:d0:
                    d0:0a:86:cf:50:4a:2d:82:dc:b7:bb:c1:d1:56:54:
                    da:50:68:d5:e7:b6:da:ce:1c:06:ae:34:91:d2:c5:
                    5b:8a:c3:10:31:4e:a5:a1:91:8a:b8:15:55:aa:cf:
                    44:81:64:b8:4f:fe:af:9d:3e:e2:38:81:d1:c9:6c:
                    48:56:f1:9e:52:c7:e2:83:3d:03:74:3d:93:b9:0e:
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
         44:6f:27:06:c3:cc:a3:4b:83:13:e6:aa:20:c3:5b:01:30:07:
         c9:e7:1e:29:0f:4d:03:1e:a2:e2:86:ab:40:c7:f8:d7:1e:94:
         b5:c8:f6:c4:b0:d9:82:57:6f:40:00:01:bf:ca:29:2b:8b:8e:
         a8:94:58:91:99:cb:03:b3:35:b1:89:d4:b9:ec:b2:22:a1:d2:
         81:af:ef:23:13:af:f2:ca:12:9c:3a:a7:52:df:87:13:f2:c7:
         c5:f9:27:0f:3d:20:7c:0e:70:a1:8b:98:c6:8d:93:5f:20:42:
         98:81:6a:3c:ee:fb:bf:8f:dd:10:c1:4b:8d:a3:a4:1c:9a:8d:
         e6:3b:fd:fd:d4:1b:87:5d:6b:33:50:8d:19:4b:cf:81:32:ed:
         2c:1a:55:29:06:9f:d9:59:c8:a0:ac:ea:6d:ea:03:68:9e:01:
         91:0f:e8:c7:b0:50:8e:fe:46:c3:c2:9d:d9:12:11:42:50:20:
         8c:03:69:01:5a:91:5e:f9:03:95:d5:8d:26:41:7a:1d:3a:4a:
         44:29:f8:5f:ea:a3:55:b9:e7:f4:44:ff:e9:8b:d5:66:87:d4:
         fc:f0:06:65:85:fd:b7:80:3a:37:02:0a:21:24:b1:5c:10:13:
         de:39:06:53:13:05:36:99:d1:81:73:a6:29:fc:ff:40:c5:99:
         14:f0:85:d2:27:48:f6:ee:1d:ab:81:d9:d0:33:55:50:ea:af:
         25:e0:bc:8a:79:32:6a:1e:e2:63:5e:f4:45:36:99:c0:32:ef:
         f3:65:d5:3d:47:23:c6:d1:9d:c9:57:24:4a:60:92:c2:7e:74:
         42:f3:86:d7:99:9b:61:c3:84:b1:6e:f8:07:9c:fb:96:15:d1:
         f8:49:b5:3f:f4:10:a3:b9:96:a7:72:ef:49:17:b1:97:ac:a9:
         ce:95:15:f0:6f:af:7a:fb:21:99:31:18:5e:e9:a0:d8:e0:82:
         33:c8:3a:c7:ce:e2:5f:f2:64:0b:9f:d9:dc:55:b7:38:7d:20:
         7e:3c:47:ac:e5:e7:99:21:8b:0a:4b:22:a4:99:b0:89:07:6e:
         0f:ad:a2:8b:4b:06:ae:86:73:58:fb:33:ac:9a:95:3b:ab:32:
         ec:ea:a9:d9:a8:f8:ab:d7:00:60:08:02:a0:e3:45:69:c4:ec:
         3b:31:79:7d:5b:4f:6f:11:80:a0:fd:93:42:74:b4:2c:a5:31:
         b9:32:06:a6:a6:b9:1d:47:64:d5:42:a1:86:40:f2:d7:b0:c3:
         56:79:54:dc:86:96:8c:e7:de:27:d7:ba:12:52:32:54:b2:34:
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
                    02:db:d2:7b:3a:d4:1a:2b:6a:f3:54:9c:1e:9c:c3:
                    38:85:b6:7a:35:8b:1b:13:75:dc:24:ad:fd:be:6b:
                    da:38:4c:25:a6:f0:03:9b:c7:17:b7:f7:76:f0:03:
                    5e:10:52:98:0c:d8:de:ab:fb:86:56:a3:ac:f1:58:
                    42:02:4b:3c:31:40:2d:13:f6:d8:af:64:08:0c:8f:
                    20:e5:06:15:5a:a7:c7:41:c8:ad:97:36:a6:54:c7:
                    00:41:16:9e:bc:6c:f8:0b:53:26:76:54:62:fb:4f:
                    e3:fd:8b:b3:7c:e9:78:d2:c0:71:a5:4e:0f:26:a8:
                    e9:b9:a0:00:fc:da:93:8c:47:22:e1:f6:3f:e9:fb:
                    7e:79:90:98:19:3a:16:e0:7d:73:86:f9:f2:94:97:
                    22:93:9d:c7:e9:bd:ed:47:d9:b5:89:ea:78:d6:d1:
                    54:55:11:00:a2:ea:09:dc:74:ce:b9:f8:83:62:ed:
                    87:04:98:68:d0:6d:ae:9f:55:8f:7d:94:fb:b8:ca:
                    86:1e:d6:78:85:b5:ba:b3:d0:5e:44:7f:1f:47:eb:
                    4e:89:c4:4c:26:2b:2d:a5:30:4c:a1:ce:8c:a6:85:
                    5f:a0:95:a8:c4:e2:1e:45:4a:96:db:99:f0:d0:f3:
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
         72:e7:20:19:39:3a:55:0c:21:c3:0d:06:04:16:8c:87:b3:0b:
         49:80:1b:50:44:e2:bb:f2:b1:7e:bd:c0:a5:05:ea:20:c3:48:
         83:d3:52:86:67:d0:68:da:7e:6f:05:c0:dc:ed:43:55:90:64:
         b8:66:d0:d6:60:75:3b:57:34:a5:f9:cd:8f:6b:69:c9:95:43:
         b9:cf:67:6d:e8:14:fe:dd:20:3e:d5:84:38:f8:c0:9d:9e:42:
         e8:4e:9b:cb:7b:68:47:a5:c2:bc:47:7c:0c:4f:7f:3f:75:f8:
         80:67:7d:c9:1f:24:79:a9:97:3a:e5:b9:33:71:18:c0:81:fa:
         38:fc:3a:fb:5c:1d:27:b3:3e:79:45:5d:e9:e8:60:47:ce:7b:
         fb:78:33:a8:35:50:51:76:47:9b:68:bd:d9:1e:87:f2:6d:23:
         6d:8c:08:9a:76:e3:71:23:84:9f:90:f7:d0:d1:24:1c:e3:0c:
         6e:8e:95:73:0a:05:7e:ae:f3:fb:67:40:57:62:42:c4:a8:09:
         fb:d4:ea:8c:73:83:50:41:d4:e6:00:2a:82:54:2c:3a:f8:39:
         b0:96:5e:11:a2:37:bf:35:99:be:eb:d2:81:c0:31:a5:ac:07:
         60:95:9d:2d:72:a7:a8:05:26:3e:f0:96:de:5a:40:7c:0d:43:
         99:a6:35:24:69:cc:90:aa:53:46:28:b0:c1:f7:07:40:70:61:
         de:4c:a2:de:aa:bd:27:51:70:50:ee:ff:d5:4f:1b:9c:79:ef:
         8d:69:3d:67:d9:5a:d4:fd:e5:a6:b1:71:f7:b2:d5:a4:10:9b:
         32:70:b7:c8:b9:af:bc:0b:ee:8a:a7:9a:37:04:ee:4a:51:31:
         f0:a0:c8:66:93:54:ec:6c:1a:b9:71:fb:ad:52:f4:90:87:3b:
         df:26:bf:b5:b5:7b:1e:b0:d2:42:24:2f:2f:30:7d:75:b8:53:
         16:91:9b:75:9e:f4:83:85:d0:e2:45:c9:49:af:b9:ce:fb:bc:
         f4:ae:99:88:55:f2:2b:a7:76:a2:30:0d:75:0e:cc:e7:ab:2d:
         77:3d:bb:2c:48:f0:84:4a:39:12:fe:c5:9d:1d:50:c3:3c:3f:
         2d:f8:82:bd:5d:7a:ca:8b:de:68:93:15:4b:c0:f6:44:d0:db:
         39:17:bd:e8:7c:05:a7:ec:b6:98:fb:a4:df:56:81:54:cb:f2:
         52:37:7c:fc:b7:ac:46:fe:bd:fd:31:33:72:fc:46:0e:e7:8a:
         f8:d2:0b:b8:c8:a2:09:02:f9:b9:14:bc:e3:86:bc:22:6e:0e:
         bd:cf:b0:46:bd:f8:43:d2
Verify ceritificate...
This must be ok
intermediate/certs/www.bar.com.cert.pem: OK
