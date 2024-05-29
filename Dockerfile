FROM ubuntu:jammy

RUN apt update && apt install wget -y

# instalar Powershell Core con un script
WORKDIR /root
COPY ./script-instalacion-pwsh.sh .
RUN chmod u+x script-instalacion-pwsh.sh && sh -c ./script-instalacion-pwsh.sh && \
	rm script-instalacion-pwsh.sh

# ejecutar el script que le da forma a nuestra instancia de Powershell, instalando módulos, etc
COPY script-pwsh.ps1 .
RUN pwsh -NonInteractive -c ./script-pwsh.ps1 

WORKDIR /
