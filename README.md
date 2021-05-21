# MECA_482_G6_BallOnPlate
## Meca 482 Control Systems Design Project

                          Project Members: Matthew Rosa, Mark Nelson, Ian Yasui, Dylan Radey

                                          California State University, Chico

                    College of Mechanical and Mechatronic Engineering and Advance Manufacturing

                                                    Ball on Plate

                                                     Spring 2021

Table of Contents
1. [Introduction](https://github.com/mrosa3/G6-BallOnPlate/blob/main/README.md#1-introduction)
2. [Math Model and System Requirements](https://github.com/mrosa3/G6-BallOnPlate/blob/main/README.md#2-math-model-and-system-requirements)
3. [MATLAB and Testing](https://github.com/mrosa3/G6-BallOnPlate/blob/main/README.md#3-matlab-and-testing)
4. [Simulink](https://github.com/mrosa3/G6-BallOnPlate/blob/main/README.md#4-simulink)
5. [Coppelia](https://github.com/mrosa3/G6-BallOnPlate/blob/main/README.md#5-coppelia)

## 1. Introduction
The ball and plate balancing system consists of a plate which can be tilted by two dual axis servo motors with a ball rolling around on top of the plate. The challenge in this design experiement is to balance the ball on top of the plate to a desired position. This involves using the position of the rotary servo motors attached to the bottom of the plate based on the X-Y position of the ball being measured overhead with a vision sensor. An image of the model can be seen below:
![model](https://user-images.githubusercontent.com/79475735/119054435-7d0cb480-b97c-11eb-9089-aa58715eb148.JPG)
																						
                                            Figure 1: Model of ball and plate system
## 2. Math Model and System Requirements
From the model in figure 1, solving for the equation of motor of the ball gives the nonlinear equation below:

![](Images/nonlineareqn.png)

**Figure 2** : Nonlinear equation of motion

Taking into account the arm of the motor, its relationship to the angle of the plate, and using small angle approximation to linearize the equation gives the following:

![](Images/LinearwArm.png)

**Figure 3** : Linear equation of motion with motor arm

**Figure 4** : ![image](https://user-images.githubusercontent.com/80434019/119133486-ceef2200-b9f0-11eb-97d0-ee4da8c31a8f.png)

## 3. MATLAB and Testing
![2](https://user-images.githubusercontent.com/79475735/119075950-8f034d00-b9a6-11eb-9c38-be996b5b8800.JPG)
![3](https://user-images.githubusercontent.com/79475735/119075953-90cd1080-b9a6-11eb-8f2e-e60293bf8e7c.JPG)
![4](https://user-images.githubusercontent.com/79475735/119075959-91fe3d80-b9a6-11eb-88b6-d1eff546649d.JPG)

## 4. Simulink
![6](https://user-images.githubusercontent.com/79475735/119076328-384a4300-b9a7-11eb-84bf-fa7ae332b0c4.JPG)

## 5. Coppelia
![5](https://user-images.githubusercontent.com/79475735/119076183-f9b48880-b9a6-11eb-9773-8b7485cd161f.JPG)
