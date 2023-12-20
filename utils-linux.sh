
# show env variables
printenv
env
echo $VAR_NAME

alias getnamespace="kubectl config view --minify --output 'jsonpath={..namespace}'"
alias k="kubectl"
alias kgp="kubectl get pods"
alias kdp="kubectl describe pod"
alias kl="kubectl logs"
alias kpf="kubectl port forward"
alias kgrq="kubectl get ResourceQuota"
alias kgcm="kubectl get cm"
alias kgs="kubectl get secrets"
alias kgsrv="kubectl det service"
alias kgd="kubectl get deployment"
alias kgrs="kubectl get rs"
alias kg="kubectl get"
alias kgi="kubectl get ingress"
alias kd="kubectl describe"
alias kgn="kubectl get nodes"
alias kgss="kubectl get statefulset"
alias kgnp="kubectl get networkpolicies.crd.projectcalico.org "
alias kgns="kubectl get networksets.crd.projectcalico.org"
alias kgvs="kubectl get virtualservices.networking.istio.io "
alias kdvs="kubectl describe virtualservices.networking.istio.io "
function kex(){
    kubectl exec -i -t $1 "--" sh -c "clear; (bash || ash || sh)"
}

function kexi(){
    kubectl exec -i -t $1 -c istio-proxy  "--" sh -c "clear;(bash || ash || sh)"
}

function klf(){
    kubectl logs $1 > ~/rshb/Debug/broken-pipes/$1.json
}

function klfp(){
    kubectl logs $1 > ~/rshb/Debug/broken-pipes/$1-previous.json
}

# 111111111111111111111111
killport() {
    local port=$1
    sudo fuser -k $port/tcp
    echo "Процессы на порту $port успешно завершены."
}

# Алиас для функции killport
alias kp=killport

# 22222222222222222222222
killport() {
    local port=$1
    local process_id=$(lsof -ti:$port)
    if [ -n "$process_id" ]; then
        kill -9 $process_id
        echo "Процессы на порту $port успешно завершены."
    else
        echo "На порту $port не обнаружены активные процессы."
    fi
}

# Алиас для функции killport
alias kp=killport