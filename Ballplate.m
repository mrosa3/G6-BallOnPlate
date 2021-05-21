clear;clc;
sim=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
    sim.simxFinish(-1); % just in case, close all opened connections
    clientID=sim.simxStart('127.0.0.1',19999,true,true,5000,5);

    %System properties
    
            m   = 0.111; %mass of ball
            R   = 0.015; %radius of ball
            g   = 9.8; %gravitational constant
            L   = 1.0; %meters
            d   = 0.03; %distance from center of gear to lever arm
            J   = 2/3*m*R^2; %inertia of hollow ball

        
            %Desired specifications
            pos = 5;
            Ts  = 3;

            %Natural frequency and damping ratio
            z   = (-log(pos/100))/(sqrt(pi^2+log(pos/100)^2));
            wn  = 4/(z*Ts);
            
            %P_ball=2*m*g*d*R^2/(L*(m*R^2+J)*s^2)%Transfer function of ball position and gear angle
            P_ball  = 2*m*g*d*R^2/(L*(m*R^2+J)); %numerator
            num     = [P_ball];
            den     = [1 0 0];

            K_p = wn^2/P_ball; %Proportional gain
            K_d = 2*z*wn/P_ball; %Derivative gain
            
                
if (clientID>-1)
        disp('Connected to remote API server');
        set_param('Sysmodel','SimulationCommand','start');
        h=[0,0,0];
    %allocating joint information
    [r,h(1)]=sim.simxGetObjectHandle(clientID,'Motorx',sim.simx_opmode_blocking);
    [r,h(2)]=sim.simxGetObjectHandle(clientID,'MotorY',sim.simx_opmode_blocking);
    [r,h(3)]=sim.simxGetObjectHandle(clientID,'ball',sim.simx_opmode_blocking);
    
    while true
        [r,pball]=sim.simxGetObjectPosition(clientID,h(3),-1,sim.simx_opmode_blocking);
           xcoord=pball(1);
           ycoord=pball(2);
           
           
           %Coppelia to simulink
           set_param('Sysmodel/xpos','Value',num2str(xcoord));
           pause(0.005)
           set_param('Sysmodel/ypos','Value',num2str(ycoord));
           pause(0.005)
           set_param('Sysmodel','SimulationCommand','start');                      
           
           %Calculated output for desired position
           A=out.SimX.Data(:,1);
           xaxis=A(1);
           B=out.SimY.Data(:,1);
           yaxis=B(1);
           
           %Set positions
           sim.simxSetJointTargetPosition(clientID,h(1),xaxis,sim.simx_opmode_streaming);
           sim.simxSetJointTargetPosition(clientID,h(2),yaxis,sim.simx_opmode_streaming);
           
           
    end
         else
        disp('Failed connecting to remote API server');
    end
    sim.delete(); % call the destructor!
    
    disp('Program ended');