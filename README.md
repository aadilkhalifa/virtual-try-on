# AR Virtual Footwear Try-on

An application that mimics a physical shopping experience for the users through the use of Augmented Reality and Computer Vision.

## How to Use 

**Step 1:**

Clone this repo by using the code below:

```
git clone https://github.com/aadilkhalifa/virtual-try-on.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 2:**

Run the app using the command: 

```
flutter run 
```

## Features

The app consists of 2 modules, the vitual footware try-on module and the foot size measurement module.

### Virtual Footware Try-on

This module provides the user with an AR experience to try-on the shoe. The AR module is linked to snapchat making user of the AR shoe filters that Snapchat provides. 

### Foot Size Measurement 

This module provides the user with the ability to measure his/her foot through the app. The user is asked to place the foot on an A4 size paper with the bottom of the foot aligned with the bottom of the sheet and take a picture of the foot along with the paper. A Flask server is hosted online which is where the image captured is sent. The server processes the image and calculates the size which is sent to the app and is displayed to the user.

## Tools & Libraries Used

* [Flutter](https://flutter.dev/) (version 2.8)
* [Flask](https://flask.palletsprojects.com/en/2.1.x/)
* [Dio](https://github.com/flutterchina/dio)
* [http](https://github.com/dart-lang/http)
* [url_launcher](https://github.com/flutter/plugins/tree/main/packages/url_launcher/url_launcher) (to launch snapchat AR filter)
* [camera](https://github.com/flutter/plugins/tree/main/packages/camera/camera) (To make use of mobile camera to capture image)
* [Lens studio](https://lensstudio.snapchat.com/)

## To run server locally
The server has been hosted online and the app sends a request to the remote server. To run the server locally for testing purposes the following can be done.

cd into the server directory

```
cd server
```

Run the Flask server

```
flask run
```
This should start the server at localhost.
