FROM node:20

# Instalar dependências necessárias
RUN apt-get update && apt-get install -y curl

# Baixar e instalar Bun
RUN curl -fsSL https://bun.sh/install | bash

# Configurar path para o Bun
ENV PATH="/root/.bun/bin:$PATH"

# Define o diretório de trabalho
WORKDIR /usr/src/app

# Copie os arquivos do projeto
COPY . .

# Instale as dependências usando Bun
RUN bun install

# Exponha a porta que sua aplicação utiliza
EXPOSE 3333

# Comando para iniciar o aplicativo
CMD ["bun", "start"]
