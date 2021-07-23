#!/usr/bin/env bash
## jdmode
### par_mimotion='18812345678@password@10000-20000 19912345678@password@2000-3000'
#### https://github.com/mixool/mimotion

function getmimotion(){
    wget --no-check-certificate -O /jd/config/mimotion.sh https://github.com/mixool/mimotion/raw/main/mimotion.sh
    chmod 755 /jd/config/mimotion.sh
}

function cronlist_a(){
    cat <<'EOF' >/jd/config/cronlist
5 18 * * * sleep $((RANDOM%10)) && bash /jd/config/mimotion.sh $par_mimotion
EOF
}

function main(){
    #
    getmimotion
    #
    cronlist_a
    crontab /jd/config/cronlist
}

main