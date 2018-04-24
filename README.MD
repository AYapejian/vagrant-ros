# Vagrant build for ROS(Robotic Operating System) on Ubuntu 16.04(XFCE) with VMware(Fusion included) Provisioners

## Status: WIP

After spending way too much time trying to get a stable install of ROS on MacOS 10.13.x I settled for this compromise.  The guest VM image here is almost as good, 3D accelleration is working for the ROS gui apps and a catkin workspace is setup with vagrant sync'd folders allowing editing from the host while ssh provides an easy CLI access for running other ros utilities and building projects.

## Prereqs
1. Currently only VMWare Fusion for MacOS is setup, must have the vmware-fusion plugin
2. Install the `vagrant-reload` plugin with `vagrant plugin install vagrant-reload`

## Gettings Started
1. `vagrant up` from repository dir, this should open the VMWare GUI and display the XFCE desktop once complete
    a. __NOTE: This will take awhile initially, ROS has a -lot- of dependencies and we're installing the `ros-<version>-desktop` package with most of it preselected for install__
2. `vagrant ssh` to ssh into the guest box

## Take it for a test spin
Follow below to launch one of the ROS pre-packaged tutorials/worlds to see it all working
### TODO:

## Using the Guest Image
### Default Workspace

### Running Gazebo

### Common Tasks

## ROS Bridge Server

# TODO:
* Finish XFCE util apps setup
* Document pre-reqs / Getting started / Resources
* Sample post-boot commands and workspace setup
* Document shares
* Setup other vmware providers
* Document ROS bridge server `roslaunch rosbridge_server rosbridge_websocket.launch`
