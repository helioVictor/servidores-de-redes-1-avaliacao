source /home/helio/8-periodo/1-avaliacao-servidores-de-redes/handle_data.sh

generate_content_file () {
    if [ ! -f 'content_file.txt' ]; then
        $(touch content_file.txt)
    fi
}

generate_html_body () {
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
    <link 
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
        rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
        crossorigin="anonymous"
    >
    <title>Hellio - Sistema de monitoramento</title>
    <style>
        body {
            margin: 0;
            background-color: #fff;
        }
        .card {
            background-color: #fdfdfd;
        }
        p {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="m-3">
        <h1>Sistema de monitoramento</h1>
        <h2>Logs</h2>
    </div>
    <div class="col">
        $(cat content_file.html)
    </div>
</body>
</html> 
END
}

generate_maintenance_html_body () {
    if [ ! -f 'maintenance.html' ]; then
        $(touch maintenance.html)
    fi
    
    cat > maintenance.html << END
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Maintenance page</h1>
    <p>00:00h - 06:00h</p>
</body>
</html>
END
}