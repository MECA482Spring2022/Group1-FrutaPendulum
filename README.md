# Group1-FrutaPendulum
# California State University, Chico
Final project for MECA 482 controls spring 2022 semsters 
Team mebersPhin Francis, Jacob Hanson, Emmett Kiggins, Isaac Pendilla, Daniel Villalobos

Futura Pendulum
MECA 482: Control System Design

By
Phinease Francis
Jacob Hanson
Emmett Kiggins
Isaac Pendilla
Daniel Villalobos





Spring 2022 - Group 1
May 20th, 2022



California State University, Chico
Department of Mechanical and Mechatronic Engineering and Sustainable Manufacturing
400 W 1st St, Chico, CA 95929



Table of Contents
Introduction
Model
Sensor Calibration
Controller Design and Simulation
Appendix A: Simulation Code
References

































Introduction
The furuta pendulum is a device that has a driven arm that rotates in the horizontal plane. This arm is attached to a pendulum which freely rotates in the vertical plane. The point of this device is to keep the pendulum balancing above the driven arm, and to swing the pendulum back into this position if it were to be knocked over. 

This report will go over a prototype for the design of a furuta pendulum, including a mathematical model of the system, diagrams of the project, and a summary of the simulation results. The capabilities for the system include achieving self balancing through the method of correcting its alignment when experiencing external force. It also must return the pendulum to its upright position when experiencing up to 25 newtons of external force.



Figure #. Front view of the operational diagram.

This is the front viewpoint for the design of the Furuta Pendulum. This includes a motor that can spin the driven shaft to swing the pendulum into its upright position if needed. The sensor connected to the driven shaft monitors the position of the pendulum and the sensor on the motor is to monitor the rotation of the motor. 

Figure #. Top view of the operational diagram.

Figure # shows the top view for the design. This viewpoint gives a better view of the two bearings that support the driven shaft. It also shows the horizontal rotation of the driven shaft. 

Figure #. Logical viewpoint of the Furuta Pendulum.

 The figure above shows the logical viewpoint of the Furuta Pendulum. 

Model

Figure #. Furuta Pendulum model (Cazzolato and Prime, 2011).
The parameters for this project are:
x1 - Rotational position of Arm 1 in the x-axis
x2 - Rotational position of Arm 2 in the x-axis
y1 - Rotational position of Arm 1 in the y-axis
y2 - Rotational position of Arm 2 in the y-axis
z1 - Rotational position of Arm 1 in the z-axis
z2 - Rotational position of Arm 2 in the z-axis
l1 - Distance from the center of mass of Arm 1 to the z-axis
l2 - Distance from the center of mass of Arm 2 to the x-axis
L1 - Length of Arm 1
L2 - Length of Arm 2
m1 - Mass for Arm 1
m2 - Mass for Arm 2
θ1 - Angular position of Arm 1 in radians
θ2 - Angular position of Arm 2 in radians
𝜏1 - Torque from DC motor
𝜏2 - Torque on pendulum



The potential and kinetic energy can be shown with the equations from Cazzolato and Prime below.


With the energies defined, the lagrangian can be described with the following equation.



Using this, the Euler-Lagrange is:

Where,
qi = [𝜃1 ,𝜃2]T : generalized coordinate
bi = [b1 ,b2]T : generalized viscous damping coefficient
Qi = [𝜏1 ,𝜏2]T : generalized torque

Evaluating for Qi = 𝜃1 gives:


And for Qi = 𝜃2 gives:


The linear velocities for the center of masses in arm one and two are shown below. 



And the linear acceleration for both arms through the center of mass is represented by:






Due to the geometry of the two arms, the moment inertia in the axis of the arm is negligible. The rotational symmetry of the arms also allows the assumption that the moments of inertia in two of the principal axes are equal. The simplified inertia matrices are shown below.








Sensor Calibration

Controller Design and Simulation











Figure  . Coppeliasim Model of Furuta Pendulum System

Appendix A: Simulation Code




References
Apkarian, J., Lacheray, H., & Martin, P. (2012). Student Workbook Inverted Pendulum Experiment for Matlab®/Simulink® Users. Quanser.
Cazzolato, B. S., & Prime, Z. (2011). On the dynamics of the Furuta pendulum. Journal of Control Science and Engineering, 2011, 1–8. https://doi.org/10.1155/2011/528341
Hernández-Guzmán, V. M., & Silva-Ortigoza, R. (2018). Control of a Furuta pendulum. Automatic Control with Experiments, 869–919. https://doi.org/10.1007/978-3-319-75804-6_15
Nise, N. S. (2015). Control Systems Engineering. Wiley. 





