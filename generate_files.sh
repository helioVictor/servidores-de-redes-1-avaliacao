#!/bin/bash

current_dir=$(pwd)
source ${current_dir}/handle_data.sh

generate_content_file () {
    if [ ! -f 'content_file.txt' ]; then
        $(touch content_file.txt)
    fi
}

generate_content_file_html () {
    if [ ! -f 'content_file.html' ]; then
        $(touch content_file.html)
    fi
}

generate_index_html () {
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
    if [ ! -f 'maintenance_file.html' ]; then
        $(touch maintenance_file.html)
    fi
    
    cat > maintenance_file.html << END
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[Em manutenção] Hellio - Sistema de monitoramento</title>
    <link 
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
        rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
        crossorigin="anonymous"
    >
    <link rel="stylesheet" href="myProjects/webProject/icofont/css/icofont.min.css">
</head>
<body>
    <div class="m-3 d-flex align-items-center flex-column">
        <h1>Página em manutenção</h1>
        <p>00:00h - 06:00h</p>
    <div>
</body>
</html>
END
}