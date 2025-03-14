FROM node:latest

WORKDIR /app

ADD ./package.json package.json
RUN npm install
RUN npm i -g nodemon

EXPOSE 7001 7001

ADD ./node_modules node_modules
ADD ./lib lib
ADD ./views views
ADD ./app.js app.js
ADD ./config.js config.js
ADD ./idp-public-cert.pem idp-public-cert.pem
ADD ./idp-private-key.pem idp-private-key.pem
ADD ./public public


ENTRYPOINT [ "nodemon", "app.js", "--issuer", "urn:pallas:idp", "--acsUrl", "https://dev-42599363.okta.com/sso/saml2/0oantt4kqfFygloDu5d7", "--aud", "https://www.okta.com/saml2/service-provider/spzxhlfkyzkwtwidfbxj", "--cert", "idp-public-cert.pem", "--key", "idp-private-key.pem", "--host", "0.0.0.0", "--port", "7001" ]

# --acsUrl https://trial-4744604.okta.com/sso/saml2/0oaoryjzjrwQpdXnj697 \
# --audience https://www.okta.com/saml2/service-provider/spowpcfarawhczoqgvei \
# --host 0.0.0.0 \
# --port 7000 \
# --configFile /home/ubuntu/dchen/saml-idp/config-idp.js \
# --cert /home/ubuntu/dchen/saml-idp/idp-public-cert.pem \
# --key /home/ubuntu/dchen/saml-idp/idp-private-key.pem