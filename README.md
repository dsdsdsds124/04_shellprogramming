선수 지식

명령어 
grep CMD
# grep OPTIONS PATTERNS file1
OPRTIONS : -i, -v, -l, -n, -r, -w
PATTERNS : * . ^root root$ [abc] [a-c] [^a]

sed CMD
sed -n '1,3p' /etc/hosts
sed '1,3d' /etc/hosts
sed -i '/main/s/192.168.10.10/192.168.10.20/' /etc/hosts

awk CMD
awk 'statement' file1
awk '[action]' file1
awk 'statement [action]' file1


쉘의 특성
Redirection 	(<, 0<, >, 1>, >>, 1>>, 2>, 2>>)
Pipe 		(|)
Variable 
Metacharacter	('', "", ``, ;)
History
Alias
Function
	(선언)fun() {CMD; CMD;}
	(실행)fun
	(확인)typeset -f
	(해제)unset -f fun
Environment File (/etc/profile, ~/.bash_profile, ~/.bashrc)

주석처리
한줄 주석 	#
여러줄 주석	: << EFO ~ EOF

입력 출력

산술연산
expr 1 + 2
expr 3 - 1
expr 3 \* 3
expr 10 / 2
expr 10 % 3

조건문 if case
    if 문
        if 조건 ; then
            statement1
        elif 조건 ; then
            statement2
        else
	    statement3
        fi
case 문
    case VAR in
        조건1) statement1;;
        조건2) statement2;;
        *)     statement3;;
	esac

반복문 for 문, while 문
    for 문 : for 문 + seq CMD
        for var in var_list
        do
	    statement
        done
    
    while 문 : while 문 + continue/break
	while 조건
        do
	    statement
	done

함수
    선언
	fun() { CMD; CMD; }
    실행
        fun
    확인
        typeset -f
    해제
        unset -f fun
    함수 입력 : 인자($1, $2, $3, ..)
    함수 출력 : echo $RET

IO 리다이렉션과 자식 프로세스
    for LINE in $(cat file1)
    do
        echo $LINE
    done
    
    cat file1 | while read LINE
    do
        echo $LINE
    done > file2

시그널 제어(Signal Trap)
    시그널 무시
    시그널 받으면 개발자가 원하는 동작

디버깅
    bash -x script.sh
    bash -xv script.sh

옵션 처리
    getopts CMD + while CMD + case CMD
    예) # ssh.sh -p 80 192.168.10.20
    while getopts p: options
    do
        case $options in
	    p ) P_ACTION ;;
	    \?) Usage    ;;
	    * ) Usage    ;;
	esac
    done

    shift $(expr $OPTIND - 1)
    if [ $# -ne 1 ] ; then
        Usage
    fi
    echo "$# : $@"
