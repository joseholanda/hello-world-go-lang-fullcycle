FROM golang:1.17-alpine as builder

WORKDIR /app

COPY *.go ./

RUN go mod init exemplo/hello \ 
    && go build -o app .

# Criar uma imagem final leve
FROM scratch

# Copiar o binário estático do estágio anterior
COPY --from=builder /app/ .

# Definir o comando padrão a ser executado quando o container iniciar
CMD ["/app"]