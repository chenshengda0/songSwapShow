FROM ethereum/client-go
RUN mkdir /ethereum
COPY ./money/genesis.json /opt/genesis.json
RUN geth --datadir /ethereum init /opt/genesis.json

ENTRYPOINT [ "geth" ]

#personal.sendTransaction( {from: eth.accounts[0], to: "0x092F25536eE6f280EacdacB51670867F5c782dFF", value: web3.toWei(50000,"ether")} )