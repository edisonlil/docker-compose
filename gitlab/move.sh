#!/bin/bash

source ./log.sh

function check_env_by_cmd_v(){
 command -v $1 > /dev/null 2>$1 || (error "Need to install ##$1## command first and run this script again." && exit 1)
}
# gitlab 数据迁移
# 用户输入参数  move --gzip --host remote host  --username root --password 123 
# 1.检查有没有安装FTP
# 2.扫描当前目录的docker-compose文件的volumes项,得到要迁移的路径
# 3.遍历路径进行远程SCP进行传输
#

#Check the required commands ahead of time.
check_env_by_cmd_v ssh
check_env_by_cmd_v scp
check_env_by_cmd_v scp
check_env_by_cmd_v expect

#Declares an array to store external parameters.
declare -A dic;

#default params...
dic[remote_host]=115.159.157.148
dic[remote_port]=6666
dic[username]=root
dic[password]=asd1234567@
dic[zip]=1


#Check for docker-compose files in the current directory.
if [[ ! -e "docker-compose.yml" ]]
then
  error "The current directory could not be found docker-compose.yml"
  exit 1;
fi

#Save the current path for easy restart.
base_path=$PWD

#Stop the container to prevent the volume data from being updated during the transfer.
docker-compose down


function help_move() {
  echo -e "Usage: move [OPINONS] COMMAND

  A cicd tool for move.

  Options:
        --host string remote host address.
        ...


  ";
}

function parse_params() {
  case $1 in
  "-v")
    echo "move version 1.0.0";
    exit 1;
  ;;
  "-h")
    help_move
    exit 1;
  ;;
  *)
    while [[ $# -gt 0 ]]; do
      option=$1;
      shift 1;
      if [[ "$option" == -* ]];then
      case "$option" in
        "--host")
          dic[remote_host]=$1;
          shift 1;
        ;;
        "--port")
          dic[remote_port]=$1;
          shift 1;
        ;;
        "-p")
          dic[remote_port]=$1;
          shift 1;
        ;;
        "--username")
          dic[username]=$1;
          shift 1;
        ;;
        "-u")
          dic[username]=$1;
          shift 1;
        ;;
        "--password")
          dic[password]=$1;
          shift 1;
        ;;
        "-pwd")
          dic[password]=$1;
          shift 1;
        ;;
        "--zip")
          check_env_by_cmd_v zip
          dic[zip]=1
        ;;
      *)error "unknown parameter or command $option ." ; exit 1 ; break;;
      esac
     else
       error "unknown parameter or command $option ." ; exit 1 ; break;
     fi
    done
  ;;esac
}



function check_params(){

   if [[ -z "${dic[remote_host]}" ]]; then
     error "host params required.";
     exit 1;
   elif [[ -z "${dic[username]}" ]]; then
      error "username params required.";
      exit 1;
   elif [[ -z "${dic[password]}" ]]; then
      error "password params required.";
      exit 1;
   fi;
}

declare -a volumes;
function get_volumes_path(){

  str=`awk -F ':' '

    ($1 !~ "-"){
      next;
    }

    ($1 ~ "/"){
      gsub("- ","")
      print $1
    }

  ' ./docker-compose.yml`;

  volumes=(`echo $str | tr ' ' ' '`);
  echo ${volumes[0]}
}

function remote_command_exec() {

    local remote_command="ssh -p ${dic[remote_port]} ${dic[username]}@${dic[remote_host]} $1"
    expect << EOF
    set timeout -1
    spawn bash -c "$remote_command"
    expect {
      "password" {send "${dic[password]}\r"}
    }
    expect eof
EOF

}

function remote_mkdir() {

   info "开始远程预先创建目录"
   for path in "$@"
   do
      if [[ -d $path ]]; then

        child_paths=`ls -R $path | awk '($1 ~ "^/"){
            gsub(":","")
            print $1
        }' | tr '\n' ' '`;
        for child_path in $child_paths
        do
           info "远程预先创建目录:$child_path"
           if [[ -d $path ]]; then
             remote_command "mkdir -p $child_path"
           fi
        done
      fi

   done

}

parse_params "$@"
check_params

get_volumes_path
#remote_mkdir "${volumes[@]}"
info "开始迁移"
for path in "${volumes[@]}"
do
   info "开始迁移${path}目录"

   if [[ ${dic[zip]} -eq 1 ]]
   then
    info "开始压缩$path"
    cd "${path}" && cd ../
    filename=`echo ${path} | awk -F "/" '{print $NF}'`
    zip -r "${filename}.zip" "${path}"

    remote_command="scp -C -p -P ${dic[remote_port]} ${path}.zip ${dic[username]}@${dic[remote_host]}:${PWD}";

    remote_command_exec "mkdir -p $PWD"
   else
    remote_command="scp -C -p -P ${dic[remote_port]} -r ${path} ${dic[username]}@${dic[remote_host]}:${path}";
   fi
	 expect << EOF
	  set timeout -1
    spawn bash -c "$remote_command"
    expect {
    "password" {send "${dic[password]}\r"}
    }
    expect eof
EOF

  if [[ ${dic[zip]} -eq 1 ]]
  then
    #顺便帮对面解压,哈哈哈
    remote_command_exec "unzip ${path}.zip"
  fi
done

#restart...
cd "$base_path"
docker-compose up -d









