#!/bin/bash
cd "$(dirname "$0")"
current_dir=$(pwd)
source ${current_dir}/generate_files.sh

generate_content_file
generate_content_file_html
generate_index_html
generate_maintenance_html_body

source ${current_dir}/config_cron.sh
