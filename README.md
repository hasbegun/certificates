# certificates

This project generate a root, an intermediate CA, a certificate for specific site and sign.
When use self-signed cert, browsers show a warning that the site is not secire.
But while in dev and test just don't want to see this warning.

To run the program, simply runt sign.sh www.bar.com
It will generate Root CA and Intermediate CA and cert for www.bar.com and signs.

At the end ca-chain.cert.pem, and www.bar.com.pem. This www.bar.com.pem contains cert and key.
In order to make the browser your sig-signed cert, add trust this ca-chain.cert.pem and load www.bar.com.pem on your web server.
That's it!
