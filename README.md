# Cats-on-the-Edge
This repository contains code from my experimention around Raspberry Pi + PiCamera and Azure IoT Edge

## Original Idea
It all started with the idea of preserving endangered species. Given the lack of pictures of endangered species I ended up monitoring my cat since I had plenty of footage for my cat :)

- I wanted to use a PiCamera since 1) I already had one and 2) it has very good resolution and does not add additional HW complexity.
- I wanted to minimize the amount of code so I ended up using [cu] (http://customvision.ai) which now allows you to export a custom model to the edge


I did struggle a bit to find examples to use PiCamera instead of regular USB cameras. Since I could not find any tutorial I thought it was meaningful to publish my code as an example.

This code was built following these tutorials:

I first debugged my code on a Linux VM: 
- Quickstart for Linux devices:
https://docs.microsoft.com/en-us/azure/iot-edge/quickstart-linux

.. and then deployed it on a raspberry Pi 3 module B+
- To setup your Raspberry Pi follow these instructions: https://docs.microsoft.com/en-us/azure/iot-edge/how-to-install-iot-edge-linux-arm

### Note for Raspberry and PiCamera
You will notice that since we are using PiCamera you will have to modify the default Dockerfile to:
- expose the PiCamera to the container (via HostConfig in createOptions: Binds and Devices need to be specified, see [deployment.template.json](https://github.com/elenaterenzi/Cats-on-the-Edge/blob/master/CatsontheEdgeSolution/deployment.template.json))
- modify the [arm32/raspbian Dockerfile](https://github.com/elenaterenzi/Cats-on-the-Edge/blob/master/CatsontheEdgeSolution/modules/cameracapture/arm32.Dockerfile) so that the moduleuser can access the PiCamera (adding the user to the video group)
- modify the [arm32/raspbian Dockerfile](https://github.com/elenaterenzi/Cats-on-the-Edge/blob/master/CatsontheEdgeSolution/modules/cameracapture/arm32.Dockerfile) so that the moduleuser can access the local disk creating a folder where the user has access
