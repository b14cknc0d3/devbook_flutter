# devbook

A new Flutter project.

## Getting Started
## Features

- [x] Built on [GetX](https://pub.dev/packages/get) Architecture Pattern
- [x] Authentication using Email
- [x] Users can send text to users
- [x] User can create post
- [ ] Users can view other Profiles(See their bio and pictur
- [ ] realtime chat list
- [x] realtime message
- [ ] users can comments
- [ ] users can like 
- [ ] users can send image,file,video
- [ ] handle permission with cloud function for chat
## Setting up appwrite project
## Installation

### Appwrite

Appwrite backend server is designed to run in a container environment. Running your server is as easy as running one command from your terminal. You can either run Appwrite on your localhost using docker-compose or on any other container orchestration tool like Kubernetes, Docker Swarm or Rancher.

The easiest way to start running your Appwrite server is by running our docker-compose file. Before running the installation command make sure you have [Docker](https://www.docker.com/products/docker-desktop) installed on your machine:

### Unix

```bash
docker run -it --rm \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume "$(pwd)"/appwrite:/usr/src/code/appwrite:rw \
    --entrypoint="install" \
    appwrite/appwrite:0.12.1
```

### Windows

#### CMD

```cmd
docker run -it --rm ^
    --volume //var/run/docker.sock:/var/run/docker.sock ^
    --volume "%cd%"/appwrite:/usr/src/code/appwrite:rw ^
    --entrypoint="install" ^
    appwrite/appwrite:0.12.1
```

#### PowerShell

```powershell
docker run -it --rm ,
    --volume /var/run/docker.sock:/var/run/docker.sock ,
    --volume ${pwd}/appwrite:/usr/src/code/appwrite:rw ,
    --entrypoint="install" ,
    appwrite/appwrite:0.12.1
```

Once the Docker installation completes, go to <http://localhost> to access the Appwrite console from your browser. Please note that on non-linux native hosts, the server might take a few minutes to start after installation completes.

For advanced production and custom installation, check out our Docker [environment variables](docs/tutorials/environment-variables.md) docs. You can also use our public [docker-compose.yml](https://appwrite.io/docker-compose.yml) file to manually set up and environment.
### Flutter

To build and run this project:

1. Get Flutter [here](https://docs.flutter.dev/get-started/install) if you don't already have it
2. Clone this repository
3. `cd` into the repo folder
4. Run `flutter pub get` to get the dependencies
5. Run `flutter run-android` or `flutter run-ios` to build the app

(Please note that a Mac with XCode is required to build for iOS)

### Appwrite

To setup your Appwrite project:

1. Open your browser and go to your <http://localhost>
2. Create your account and login.
3. Click on `Create Project`.
4. Enter a Name and custom Project ID for your project and click create.

At this moment your Dashboard is ready to use.

| <img src = ".github\images\dev_book1.png" height = "500">   | <img src = ".github\images\dev_book2.png" height = "500">   |  <img src = ".github\images\dev_book3.png" height = "500">  |
|:-: |:-: |--- |
|  <img src = ".github\images\dev_book4.png" height = "500">  |  <img src = ".github\images\dev_book5.png" height = "500">  