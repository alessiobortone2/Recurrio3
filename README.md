# Recurrio  

Do you enjoy grocery shopping? No? Neither do we. I mean, who likes going to the local supermarket to buy more or less the same stuff again and again, week after week? It's 2017, come on. By now, houses should be able to restock themselves without the need for humans to remember the milk. 
That's why we are building Recurrio, the only solution that restocks your house automatically, forever. 

Check us out at https://www.whitesurwhite.com/recurr

Alessio, Nick, Denis, Will 

## Getting started

Please clone: git@github.com:alessiobortone2/Recurrio3.git

Install Cocoapods by `sudo gem install cocoapods`
Run `pod install`
Then `brew install swiftlint`

## Usage

Once Arduino is correctly wired up, upload the Arduino code to the device through the Arduino IDE.

Clone the repository and open Recurrio.xcodeproj with Xcode.

Connect an iPhone or iPad to the computer and run the product on this device through the Xcode program.

Enable your phone's bluetooth.

Run the app and connect to the Arduino device to make use of the weight sensing functionality.

## Credit for the work of others

The code used in our bluetooth connection and the reception of data by the program was taken and adapted from <a href="https://github.com/hoiberg">Hoiberg</a>'s <a href="https://github.com/hoiberg/HM10-BluetoothSerial-iOS/">HM10 Bluetooth Serial iOS</a> app. Many thanks go to Hoiberg for the code.

## Running tests

Unit Testing & Code Coverage are both implemented within Xcode

Linter of choice is SwiftLint 


## User stories 


As a User, 
so that I can keep my household under control, 
I want to see a list of FMCG products in my app

As a User, 
so that I can keep an eye on the stocks, 
I want to see the remaining percentage of product in my app

As a User, 
so that I can update the tray manually, 
I want to add a product to the list  // (this feature will be deprecated once we add the scanner to the tray)

As a User, 
so that I can be notified before a re-order, 
I want to see the levels going down

As a User,
so that I can flick through from one group of sensors (tray) to the other, 
I want to have a Navigation Tab, covering products in the Fridge, Bathroom, Pantry and so on.

As a User,
so that I can test the prototype in real life,
I want to discover & receive data from my peripheral

As a User,
so that I can visualise levels of products,
I want to use that data to update the levels

As a User,
so that I can make the system work,
I want to be able to transmit data from Arduino (HW feature)

As a User,
so that I can sign in and store my credit card securely,
I want to be able to Login With Amazon (LWA)

As a User,
so that I can re-order automatically,
I want to be able to connect with DRS (Dash Replenishment Service)

