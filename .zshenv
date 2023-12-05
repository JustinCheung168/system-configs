#PATH variable changes:

#For my personal Bash scripts
export PATH=~/Projects/Bash/bin:$PATH
#For Poetry (Python package manager)
export PATH="/Users/justincheung/.local/bin:$PATH"
#For Maven (Java build automation tool)
export PATH="/opt/apache-maven-3.9.4/bin:$PATH"

#Automatically added:
# For making Python 3.10 installation the default instead of developer tools-installed Python 3.8:
# /Library/Frameworks/Python.framework/Versions/3.10/bin

#For Ruby chruby setup
# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh
# source chruby ruby-3.1.3

#Aliases/functions for convenience:

#cd and ls in one command
cl() {
    if [ $# -eq 0 ]
    then
        ls;
    else
        cd "$1"; ls;
    fi
}

#lazy ls
l() {
    if [ $# -eq 0 ]
    then
        ls;
    else
        ls "$1";
    fi
}

# verbose ls, reveals hidden
ll() {
    if [ $# -eq 0 ]
    then
        ls -ahlF;
    else
        ls -ahlF "$1";
    fi
}

j() {jupyter notebook;}
c() {code .}

go() {

    NO_ENV_FOUND=true

    if [ -f ./bin/activate ]; then
        source ./bin/activate
        echo Entered the environment!
        NO_ENV_FOUND=false
    else
        for name in env envShared envTamagotchi envDiscord; do
            if [ -f ./"$name"/bin/activate ]; then
                source "$name"/bin/activate
                echo Entered the environment "$name"!
                NO_ENV_FOUND=false
            fi
        done
    fi

    if $NO_ENV_FOUND; then
        echo No environment found...
    fi
    }

bingo() { go; }

gos() {
    source ~/Projects/Python/envShared/bin/activate 
    echo Joined envShared! To leave the environment: deactivate
}

math() {
    gos;
    touch ~/Projects/Python/MathSimulationScripts/new_simulation.py
    code ~/Projects/Python/MathSimulationScripts/new_simulation.py
}

uninstall_all_pip_libraries() { 
    pip freeze | xargs pip uninstall -y
}

add_spacer_to_dock() {
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; 
    killall Dock;
}

pi() {
    echo "ssh justin@192.168.1.191";
    ssh justin@192.168.1.191;
}

pimb() {
    echo "ssh fa238137316e@ssh.comporg.hostedpi.com -p 5395";
    echo "fa238137316eCompOrg";
    ssh fa238137316e@ssh.comporg.hostedpi.com -p 5395;
}

push() {
    git add .
    git commit -a -m "$1"
    git push
}

# Attach to the "main" tmux session. Create it if it does not exist
tm() {
    if tmux has-session -t main 2>/dev/null; then
        tmux attach-session -t main
    else
        tmux new-session -s main
    fi
}


# The following gives OS name on Linux.
# OS=`grep 'PRETTY_NAME=' /etc/os-release | sed 's/^.*PRETTY_NAME=//'`
# echo "Welcome to ${OS}! Just ran ~/.zshenv"
echo "Welcome to MacOS! Just ran ~/.zshenv"

