source /home/helio/8-periodo/1-avaliacao-servidores-de-redes/handle_data.sh

generate_content_file () {
    if [ ! -f 'content_file.txt' ]; then
        $(touch content_file.txt)
    fi
}

generate_html_file () {
    # INDEX_PATH='/var/www/html'
    if [ ! -f 'index.html' ]; then
        $(touch index.html)
    fi
    
    cat > index.html << END
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    $(cat content_file.html)
</body>
</html>
END
}