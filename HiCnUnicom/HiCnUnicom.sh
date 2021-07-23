#!/usr/bin/env bash
## jdmode
### par_hcu='membercenter 13012345678@123456 appId@2a834d71bd261a5e0aaf6ab3342de851fbbae8a633fbadd722888'
#### https://github.com/mixool/HiCnUnicom

function gethcu(){
    wget --no-check-certificate -O /jd/config/hcu.sh https://raw.githubusercontent.com/mixool/HiCnUnicom/master/CnUnicom.sh
    chmod 755 /jd/config/hcu.sh
}

function cronlist_a(){
    cat <<'EOF' >/jd/config/cronlist
5 2,18 * * * sleep $((RANDOM%10)) && bash /jd/config/hcu.sh $par_hcu
EOF
}

function main(){
    #
    gethcu
    #
    cronlist_a
    crontab /jd/config/cronlist
}

main