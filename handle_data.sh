#!bin/bash
FILENAME_CODE="content_file.html"
FILENAME="content_file.txt"

# Get current time (Hour and minutes)
GET_TIME=$(date --iso-8601=s)

$(echo "<p>$GET_TIME</p>" >> $FILENAME)

# Get hostname
GET_HOSTNAME=$(hostname)

$(echo $GET_HOSTNAME >> $FILENAME)

# Get total memory USED
GET_TOTAL_MEMORY_USED=$(free -h | grep Mem | awk '{print $3}')

$(echo $GET_TOTAL_MEMORY_USED >> $FILENAME)

# Get total memory avaliable ()
GET_TOTAL_MEMORY_AVALIABLE=$(free -h | grep Mem | awk '{print $7}')

$(echo $GET_TOTAL_MEMORY_AVALIABLE >> $FILENAME)

# Get PID and Process name 
GET_PID_AND_PROCESS_NAME=$(ps -o pid,%mem,rss,comm ax | sort -b -k2 | tail -n 2 | awk 'FNR == 1 {printf "%s %s\n",$2,$4}')

$(echo $GET_PID_AND_PROCESS_NAME >> $FILENAME)

# Get partitions information
GET_PARTIONS_INFO=$(df -h | grep -v 'loop' | awk 'NR>1 {printf "%s %s %s\n",$2, $5x, $6}')

$(echo $GET_PARTIONS_INFO >> $FILENAME)

# Get total of bytes and packets transferred and received (bytes)
GET_INTERFACES_INFO=$(cat /proc/net/dev | awk 'NR>2 {printf "%s %s %s %s %s\n",$1, $2, $3, $10, $11}')

$(echo $GET_INTERFACES_INFO >> $FILENAME)

$(echo '<div>' >> $FILENAME_CODE)
$(echo "        <p>Data (ISO8601): $GET_TIME</p>" >> $FILENAME_CODE)
$(echo "        <p>Nome da máquina: $GET_HOSTNAME</p>" >> $FILENAME_CODE)
$(echo "        <p>Total de memória RAM usada: $GET_TOTAL_MEMORY_USED</p>" >> $FILENAME_CODE)
$(echo "        <p>Total de memória RAM disponível: $GET_TOTAL_MEMORY_AVALIABLE</p>" >> $FILENAME_CODE)
$(echo "        <p>O nome do processo que utiliza mais memória e o total de memória RAM utilizada: $GET_PID_AND_PROCESS_NAME</p>" >> $FILENAME_CODE)
$(echo "        <p>A listagem das partições contendo ponto de ponto de montagem, tamanho e percentagem de utilização: $GET_PARTIONS_INFO</p>" >> $FILENAME_CODE)
$(echo "        <p>O total de bytes e pacotes enviados e recebidos em cada interface de rede: $GET_INTERFACES_INFO</p>" >> $FILENAME_CODE)
$(echo '    </div>' >> $FILENAME_CODE)
$(echo '<hr>' >> $FILENAME_CODE)