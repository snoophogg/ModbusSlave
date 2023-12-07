# ModbusSlave

`docker-compose up --build diagslave`
`docker buildx build --platform linux/arm64,linux/arm/v7,linux/amd64 -t snoophogg/modbusslave:latest --push .`
`docker buildx build --load -t snoophogg/modbusslave:latest .`
`docker run --rm snoophogg/modbusslave`

[diagslave](https://www.modbusdriver.com/diagslave.html)
[License-Free](https://www.modbusdriver.com/info/LICENSE-FREE)