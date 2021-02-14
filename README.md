#go-web-hello-world
----------
Go-web-hello-world is a piece of demo go code to [listen for HTTP Connections](https://gowebexamples.com/hello-world/). 
This project will introduce this app running in docker based virtualbox vm or guest vm.

#Build Go app env
----------
### Task 0: Install a ubuntu 16.04 server 64-bit
- Install [virtualbox](https://www.virtualbox.org/wiki/Linux_Downloads)
- Download ubuntu-16.04.7-server-amd64.iso (16.04.6 is deprecated)
- Install [ubuntu](https://askubuntu.com/questions/142549/how-to-install-ubuntu-on-virtualbox) on virtualbox 
- Create a new NAT network, create a new Host Network Adapter/DHCP server
- Create a new host-only adapter1(for internet access)/[NAT network](https://www.nakivo.com/blog/virtualbox-network-setting-guide/) adapter2 
- Port forward from host to guest in NAT network

### Task 1: Update system
- Set first Adapter and second Adapter in network interface to allow [internet](https://stackoverflow.com/questions/36839573/static-ip-in-virtualbox-machine-with-ubuntu-16-04) 
- The [SSH](https://phoenixnap.com/kb/how-to-enable-ssh-on-ubuntu) server is not installed by default on Ubuntu systems. Therefore, we should update package repository and install the OpenSSH software package via VM ui 
- Check ssh service in VM, and log into vm guest with SSH ($ ssh user@localhost -p 2222)

### Task 2: install gitlab-ce version in the host
- Gitlab will use the default account's username root to login or another defined user. Therefore, we should enable root account password before installation
- Install gitlab-ce
- Login and initialise password

### Task 3: create a demo group/project in gitlab
- Create a new group in Admin Area
- Create a new project under group 'demo' 
- Copy paste hello-world go code and change ListenAndServe to port 8081

### Task 4: build the app and expose ($ go run) the service to 8081 port
- Use 'sudo apt install golang-go' to install Go in guest vm
- Replace the code from "Hello, you've requested: %s\n" to 'Go Web Hello World!', and commit
- Use 'git clone http://127.0.0.1/demo/go-web-hello-world.git' to clone the project from repo
- Run this Go code with 'go run go-web-hello-world/hello-world.go', and visit from host side

### Task 5: install docker
- Install Docker Engine from convenience script "get-docker.sh"
- Add current user to docker group
- Log out and back in for this user
- Try to update docker from apt package to gain the latest version

### Task 6: run the app in container
- Build Dockerfile from golang:1.14.0-alpine. Copy source code from local to container and expose port 8081. Build the app and run the binary program produced
- Run "$ docker build ." to build image
- Sidekiq has taken port 8082 in guest, so bind container expose port 8081 to guest local port 8083. "$ docker run -p 8083:8081 xxxxxxxxx"

### Task 7: push image to dockerhub
- Tag built image via "$ docker tag xxxxxx username/go-web-hello-world:v0.1"
- Create go-web-hello-world repository in docker hub
- Push taged image to docker hub "$ docker push username/go-web-hello-world:v0.1"

### Task 8: document the procedure in a MarkDown file
This README.md


