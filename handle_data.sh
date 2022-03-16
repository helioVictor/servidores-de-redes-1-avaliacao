#!bin/bash
FILENAME_CODE="content_file.html"
FILENAME="content_file.txt"

# Get current time (Hour and minutes)
GET_TIME=$(date --iso-8601=s)

# Get hostname
GET_HOSTNAME=$(hostname)

# Get total memory USED
GET_TOTAL_MEMORY_USED=$(free -h | grep Mem | awk '{print $3}')

# Get total memory avaliable ()
GET_TOTAL_MEMORY_AVALIABLE=$(free -h | grep Mem | awk '{print $7}')

# Get PID and Process name 
GET_PID_AND_PROCESS_NAME=$(ps -o pid,%mem,rss,comm ax | sort -b -k2 | tail -n 2 | awk 'FNR == 1 {printf "%s %s\n",$2,$4}')

# Get partitions information
GET_PARTIONS_INFO=$(df -h | grep -v 'loop' | awk 'NR>1 {printf "%s %s %s\n",$2, $5x, $6}')

# Get total of bytes and packets transferred and received (bytes)
GET_INTERFACES_INFO=$(cat /proc/net/dev | awk 'NR>2 {printf "%s %s %s %s %s\n",$1, $2, $3, $10, $11}')

echo $GET_TIME >> $FILENAME
echo $GET_HOSTNAME >> $FILENAME
echo $GET_TOTAL_MEMORY_USED >> $FILENAME
echo $GET_TOTAL_MEMORY_AVALIABLE >> $FILENAME
echo $GET_PID_AND_PROCESS_NAME >> $FILENAME
echo $GET_PARTIONS_INFO >> $FILENAME
echo $GET_INTERFACES_INFO >> $FILENAME

echo '<div class="card m-3">' >> $FILENAME_CODE
echo '    <div class="card-body">' >> $FILENAME_CODE
echo "            <p><b>Data [ISO8601]:</b> $GET_TIME</p>" >> $FILENAME_CODE
echo "            <p><b>Nome da máquina:</b> $GET_HOSTNAME</p>" >> $FILENAME_CODE
echo "            <p><b>Total de memória RAM usada:</b> $GET_TOTAL_MEMORY_USED</p>" >> $FILENAME_CODE
echo "            <p><b>Total de memória RAM disponível:</b> $GET_TOTAL_MEMORY_AVALIABLE</p>" >> $FILENAME_CODE
echo "            <p><b>O nome do processo que utiliza mais memória e o total de memória RAM utilizada:</b> $GET_PID_AND_PROCESS_NAME</p>" >> $FILENAME_CODE
echo "            <p><b>A listagem das partições contendo ponto de ponto de montagem, tamanho e percentagem de utilização:</b> $GET_PARTIONS_INFO</p>" >> $FILENAME_CODE
echo "            <p><b>O total de bytes e pacotes enviados e recebidos em cada interface de rede:</b> $GET_INTERFACES_INFO</p>" >> $FILENAME_CODE
echo '        </div>' >> $FILENAME_CODE
echo '    </div>' >> $FILENAME_CODE