Git ssh container
=================

An image to serve your git repo's over ssh


Quickstart
----------

The following commands will

1. build the image:
1. create a new SSH pair (without a passphrase)
1. run the container to serve a specific local repo
1. configure ssh to connect to the container
1. checkout the repo in another location

```Shell
    docker build -t ssh-git .
    ssh-keygen -f ~/.ssh/docker-ssh-git
    docker run -p 32770:22 -d --env=PUBLIC_KEY=(cat ~/.ssh/docker-ssh-git.pub ) -v /path/to/yourrepo:/data/reponame ssh-git
    cat >> ~/.ssh/config <'EOF'
    Host git.loc
    HostName localhost
    Port 32770
    User git
    IdentityFile ~/.ssh/docker-ssh-git
    EOF
    git clone git.loc:/data/reponame /tmp/repocheckout
```
