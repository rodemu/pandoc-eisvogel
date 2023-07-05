$env:COMPOSE_CONVERT_WINDOWS_PATHS=1
$output_file = [System.IO.Path]::GetFileNameWithoutExtension($args[0]) + ".pdf";

# for Docker Desktop
# $pandoc_templates = "/" + ${env:userprofile}.Replace("\", "/").Replace(":", "") +  "/.templates/pandoc";
# for Rancher Desktop
$pandoc_templates = ${env:userprofile} +  "\.templates\pandoc";

docker run --rm `
       --name pandoc `
       --volume "$(pwd):/data" `
       --volume "${pandoc_templates}:/tmp/pandoc_templates" `
       practice:latest `
       $args[0] `
       -o $output_file `
       --filter pandoc-plantuml `
       --filter pandoc-crossref `
       --metadata-file="/tmp/pandoc_templates/crossref_config.yaml" `
       --standalone `
       --data-dir=/opt/pandoc `
       --template eisvogel `
       --pdf-engine lualatex `
       -V lang=ja `
       -V luatexjapresetoptions=haranoaji `
       -V CJKmainfont=HaranoAjiGothic `
       -V caption-justification=centering `
       -N `
       -M listings `
       --listings `
       -H /tmp/pandoc_templates/header.tex `
       -V linkcolor=blue `
       -V table-use-row-colors=true
