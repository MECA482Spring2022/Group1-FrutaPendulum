# Group1-FrutaPendulum
# California State University, Chico
Final project for MECA 482 controls spring 2022 semsters 
Team: Phin Francis, Jacob Hanson, Emmett Kiggins, Isaac Pendilla, Daniel Villalobos
<p align="center">
 
    

Futura Pendulum
MECA 482: Control System Design

By
Phinease Francis
 
Jacob Hanson
 
Emmett Kiggins
 
Isaac Pendilla
 
Daniel Villalobos
<p align="center">

 ![image](https://user-images.githubusercontent.com/105892633/169450137-6e24e8ba-d512-4ff5-b310-f3945275c4e0.png)



Spring 2022 - Group 1
May 20th, 2022



California State University, Chico
Department of Mechanical and Mechatronic Engineering and Sustainable Manufacturing
400 W 1st St, Chico, CA 95929



 Table of Contents
 1)Introduction
 
 2)Model
 
 3)Sensor Calibration
 
 4)Controller Design and Simulation
 
 5)Appendix A: Simulation Code
 
 6)References




Introduction
The furuta pendulum is a device that has a driven arm that rotates in the horizontal plane. This arm is attached to a pendulum which freely rotates in the vertical plane. The point of this device is to keep the pendulum balancing above the driven arm, and to swing the pendulum back into this position if it were to be knocked over. 

This report will go over a prototype for the design of a furuta pendulum, including a mathematical model of the system, diagrams of the project, and a summary of the simulation results. The capabilities for the system include achieving self balancing through the method of correcting its alignment when experiencing external force. It also must return the pendulum to its upright position when experiencing up to 25 newtons of external force.

![image](https://user-images.githubusercontent.com/105892633/169450292-3e73d8a7-4b40-4b9a-8946-72b6630fbc39.png)


Figure #. Front view of the operational diagram.

This is the front viewpoint for the design of the Furuta Pendulum. This includes a motor that can spin the driven shaft to swing the pendulum into its upright position if needed. The sensor connected to the driven shaft monitors the position of the pendulum and the sensor on the motor is to monitor the rotation of the motor. 




![image](https://user-images.githubusercontent.com/105892633/169450324-f9d6e7b6-4f22-4570-857b-fecbe428339c.png)

Figure #. Top view of the operational diagram.

Figure # shows the top view for the design. This viewpoint gives a better view of the two bearings that support the driven shaft. It also shows the horizontal rotation of the driven shaft. 




![image](https://user-images.githubusercontent.com/105892633/169450358-aa3bb1c0-e850-4ada-a13b-6ab4740a0b95.png)




Figure #. Logical viewpoint of the Furuta Pendulum.

 The figure above shows the logical viewpoint of the Furuta Pendulum. 

Model




![image](https://user-images.githubusercontent.com/105892633/169450390-bc2b7d71-5fe5-4313-ac0e-4355bf284ee5.png)





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





![image](https://user-images.githubusercontent.com/105892633/169450466-2534fdf8-136b-4f53-9f96-8dbd256a1f83.png)


With the energies defined, the lagrangian can be described with the following equation.
 
![image](https://user-images.githubusercontent.com/105892633/169450502-5b28acf4-5efa-4895-9352-c2d1ff34244c.png)



Using this, the Euler-Lagrange is:



![image](https://user-images.githubusercontent.com/105892633/169450523-f15fb963-77a1-4fc6-ab3f-54d369fe1206.png)





Where,
qi = [𝜃1 ,𝜃2]T : generalized coordinate
bi = [b1 ,b2]T : generalized viscous damping coefficient
Qi = [𝜏1 ,𝜏2]T : generalized torque

Evaluating for Qi = 𝜃1 gives:


<![image](https://user-images.githubusercontent.com/105892633/169450898-5a098fe2-32a3-49b7-862f-776db5a7aa04.png)>



And for Qi = 𝜃2 gives:

![image](https://user-images.githubusercontent.com/105892633/169450923-12edbb44-c1b3-465f-8ef9-58fcf1f80285.png)


The linear velocities for the center of masses in arm one and two are shown below. 

![image](https://user-images.githubusercontent.com/105892633/169450959-beadc820-590e-4a42-afcb-4f2269afe91c.png)


And the linear acceleration for both arms through the center of mass is represented by:

![image](https://user-images.githubusercontent.com/105892633/169450984-85241185-66d8-441c-827c-f71e739183fc.png)





Due to the geometry of the two arms, the moment inertia in the axis of the arm is negligible. The rotational symmetry of the arms also allows the assumption that the moments of inertia in two of the principal axes are equal. The simplified inertia matrices are shown below.


![image](https://user-images.githubusercontent.com/105892633/169451015-c4b7291d-d426-44d9-a0f1-30ff4961045e.png)


![image](https://user-images.githubusercontent.com/105892633/169451032-b4466ceb-5ded-41f8-ae12-de967d1c925b.png)



![image](https://user-images.githubusercontent.com/105892633/169454801-5e1ac0e7-06d0-4e3e-ab3b-4084aed5f16f.png)




Controller Design and Simulation











Figure  . Coppeliasim Model of Furuta Pendulum System

Appendix A: Simulation Code




References
Apkarian, J., Lacheray, H., & Martin, P. (2012). Student Workbook Inverted Pendulum Experiment for Matlab®/Simulink® Users. Quanser.

 Cazzolato, B. S., & Prime, Z. (2011). On the dynamics of the Furuta pendulum. Journal of Control Science and Engineering, 2011, 1–8. https://doi.org/10.1155/2011/528341

 Hernández-Guzmán, V. M., & Silva-Ortigoza, R. (2018). Control of a Furuta pendulum. Automatic Control with Experiments, 869–919. https://doi.org/10.1007/978-3-319-75804-6_15

 Nise, N. S. (2015). Control Systems Engineering. Wiley. 





