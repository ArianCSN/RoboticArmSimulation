clc ;
clear All ;
close All ;

% Define a robotic rigid body tree (RBT)
% representing a robot with multiple bodies and joints
robot = robotics.RigidBodyTree;


body1 = robotics.RigidBody('H1'); % Define the first body (H1)
body1.Inertia = [1 1 1 0 0 0]; % Set inertia properties
jnt1 = robotics.Joint('jnt1', 'revolute'); % Create a revolute joint
jnt1.HomePosition = pi/4; % Set the home position
jnt1.PositionLimits = [-pi/6 pi/6]; % Set joint position limits
tform1 = trvec2tform([0 1 0]); % Create a fixed transform
setFixedTransform(jnt1, tform1); % Associate joint with transform
body1.Joint = jnt1; % Attach joint to body
addBody(robot, body1, 'base'); % Add body to robot

% Define the second body (H2)
body2 = robotics.RigidBody('H2');
body2.Mass = 2; % Set mass
body2.CenterOfMass = [1 1 1]; % Set center of mass
jnt2 = robotics.Joint('jnt2', 'revolute'); % Create another revolute joint
jnt2.HomePosition = 0;
jnt2.PositionLimits = [-pi pi];
tform2 = trvec2tform([1 1 0]);
setFixedTransform(jnt2, tform2);
body2.Joint = jnt2;
addBody(robot, body2, 'H1'); % Attach to previous body

% Define the third body (H3)
body3 = robotics.RigidBody('H3');
body3.Mass = 3;
body3.Inertia = [2 2 2 0 0 0];
jnt3 = robotics.Joint('jnt3', 'prismatic'); % Create a prismatic joint
tform3 = trvec2tform([1 0 0]);
setFixedTransform(jnt3, tform3);
body3.Joint = jnt3;
addBody(robot, body3, 'H2');

% Define the fourth body (H4)
body4 = robotics.RigidBody('H4');
body4.Mass = 1.5;
body4.CenterOfMass = [2 1 1];
jnt4 = robotics.Joint('jnt4', 'revolute');
jnt4.HomePosition = pi/3;
tform4 = trvec2tform([2 2 2]);
setFixedTransform(jnt4, tform4);
body4.Joint = jnt4;
addBody(robot, body4, 'base');

% Define the fifth body (H5)
body5 = robotics.RigidBody('H5');
jnt5 = robotics.Joint('jnt5', 'revolute');
jnt5.HomePosition = pi/2;
tform5 = trvec2tform([1 0 0]);
setFixedTransform(jnt5, tform5);
body5.Joint = jnt5;
addBody(robot, body5, 'H4');

% Define the sixth body (H6)
body6 = robotics.RigidBody('H6');
body6.Mass = 2;
jnt6 = robotics.Joint('jnt6', 'revolute');
jnt6.HomePosition = pi/4;
jnt6.PositionLimits = [-pi/2 pi/2];
tform6 = trvec2tform([1 1 0]);
setFixedTransform(jnt6, tform6);
body6.Joint = jnt6;
addBody(robot, body6, 'H5');

% Display the robot
show(robot);
showdetails(robot);
