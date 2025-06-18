
# Change Log
All notable changes to the firmware will be documented in this file.
<!--  
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/). -->
 
## [Unreleased] - 2025-06-18
 
Here we write upgrading notes for brands. It's a team effort to make them as
straightforward as possible.
 
### Added
- **bldc_servo.cc**
    - Monitor servo torque and `exit(1)` when the `status_.torque_Nm` is greater than half the `max_torque_Nm`
    - Send a steady output of 100% Duty Cycle PWM on pin 3 of aux2 using `aux2_port_->WritePwmOut(3, 1.0);` <br>
    (Note: use `conf aux2.pin.3.mode 17` to set the **PWM Output** mode and `conf aux2.pin.3.pull 1` to use the **Pullup Resistor**)
    - ***UNTESTED*** Reading an analog signal on pin 2 of Aus aux2 using `aux2_port_->status()->analog_inputs[2];`. <br>
    (Note: use `conf aux2.pin.2.mode 16` to set the **Analog input**)

- **bldc_servo_structs.h**
    - Included the following parameters for the hydraulic actuator at each joint - 
        1. `float hyq_actual_dist = 0.0f // meters`
        2. `float hyq_base_dist = 0.0f // meters`
        3. `float hyq_max_pressure = 0.0f // PSI`
        4. `float hyq_bore_dia = 0.0f // meters` 
    
        These parameters can be set using the command <br>`conf set servo\.(hyq_actual_dist|hyq_base_dist|hyq_max_pressure|hyq_bore_dia) [-+]?\d+(\.\d+)?
`
 
### Changed
 *NA*
### Fixed
 *NA*
<!-- ## [1.2.4] - 2017-03-15
  
Here we would have the update steps for 1.2.4 for people to follow.
 
### Added
 
### Changed
  
- [PROJECTNAME-ZZZZ](http://tickets.projectname.com/browse/PROJECTNAME-ZZZZ)
  PATCH Drupal.org is now used for composer.
 
### Fixed
 
- [PROJECTNAME-TTTT](http://tickets.projectname.com/browse/PROJECTNAME-TTTT)
  PATCH Add logic to runsheet teaser delete to delete corresponding
  schedule cards.
 
## [1.2.3] - 2017-03-14
 
### Added
   
### Changed
 
### Fixed
 
- [PROJECTNAME-UUUU](http://tickets.projectname.com/browse/PROJECTNAME-UUUU)
  MINOR Fix module foo tests
- [PROJECTNAME-RRRR](http://tickets.projectname.com/browse/PROJECTNAME-RRRR)
  MAJOR Module foo's timeline uses the browser timezone for date resolution  -->