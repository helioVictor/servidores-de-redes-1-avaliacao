# Sistema de monitoramento
    
## Tecnologias usadas
- Vagrant
- VirtualBox
- Shell script

## Informações da máquina virtual
- Ubuntu (ubuntu/focal64)
- Apache2

## Setup (Vagrant)

### Instalação de dependências

```sh
 sudo apt install virtualbox vagrant
```

### Executar Vagrantfile

```sh
 vagrant up
```

### Entrar na máquina virtual

```sh
 vagrant ssh
```

## Setup (Ubuntu - VirtualBox)

### Execução do arquivo `main_script.sh`

Primeiramente, deve conceder permissão de execução para o arquivo `main_script.sh`

```sh
 chmod +x main_script.sh
```

Após isso, é necessário a execução deste arquivo

```sh
 ./main_script.sh
```
