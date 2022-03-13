#!/bin/bash
cd "$(dirname "$0")"
current_dir=$(pwd)
source ${current_dir}/generate_files.sh

generate_content_file
generate_html_body
generate_maintenance_html_body

source ${current_dir}/config_cron.sh
