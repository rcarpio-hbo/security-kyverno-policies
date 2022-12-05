#!/bin/bash

get_rules () {
    local rule_list=""
    for folder in $(ls templates)
    do
        rule_list+="- \*\*$folder\*\*\n"
        for rule in $(ls templates/$folder)
        do
            rule_list+="   - [$rule](./template/$folder/$rule)\n"
        done
    done
    echo "$rule_list"
}

awk -v data="$(get_rules)" '
BEGIN {p=1} 
/^<!-- BEGIN_AVAILABLE_RULES -->/ {print; print data;p=0}
/^<!-- END_AVAILABLE_RULES -->/ {p=1}
p
' README.md.gotmpl > README.tmp && mv README.tmp README.md.gotmpl

helm-docs







# #!/bin/bash

# for folder in $(ls templates)
# do
#     echo "* $folder"
#     for rule in $(ls templates/$folder)
#     do
#         echo "  * [$rule](./template/$folder/$rule)"
#     done
# done