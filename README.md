# NPTEL-CPLD-WEL
 NPTEL workshop at IIT Bombay logic design and verification on CPLD
![Logo](logo.png?raw=true "CPLD logo")

**Setup**

Install Quartus prime lite from intel's website, install modelsim altera as well. Pull the repo and create a new project in quartus selecting the directory of the project which you want to create. Tool name is model sim altera, VHDL language, Board name filter 144c5 max 5 board select last one from the list. Import all the files in the src/ folder inside the Quartus project. Edit the Testbench.vhdl file to include the directory of the TRACEFILE.txt make DUT the top level entity by right clicking on it and selecting make top level entity. 


Go to assignments and then settings and then simulation then under more EDA netlist settings

![Step1](step1.png?raw=true "step 1")

Turn off functional simulation netlist

![Step2](step2.png?raw=true "step 2")

Then select compile testbench from the same menu and give your testbench a name and select the testbench file. Also name the instance of the top level entity you want to test in this case it is dut_instance.

![Step3](step3.png?raw=true "step 3")

**Pin planner**

You can select the board from assignments -> settings -> simulation and top right corner select board and then type 144c5 in the name filter and select the last board from the list

Then open pin planner by pressing ctrl+shift+n or go to assignments and then pin planner.

![Step4](step4.png?raw=true "step 4")

Assign pin according to the max 5 pin assignment chart

![Step4](step5.png?raw=true "step 5")
**Upload code to MAX 5 CPLD board**

```console
foo@bar:~/CPLD$ jtag
foo@bar:~/CPLD$ cable ft2232
foo@bar:~/CPLD$ detect
foo@bar:~/CPLD$ svf my_project_svf.svf progress
```

**Scanchain**

To use scanchain, First close jtag by ctrl+c, then cd to the directory where scan_vjtag.exe is located.
```console
foo@bar:~/CPLD$ cd src
foo@bar:~/CPLD/src$ scan_vjtag.ext TRACEFILE.txt output.txt 
```
Scanchain can be used with or withuot the testbench. Make sure to include the top level entity, and the two files (v_jtag.debuginfo and v_jtag.qip) from the v_jtag -> synthesis folder in the project before making the topLevel.vhdl file the top entity. Also edit the number of inputs and outputs in that file.