
# Change Log
All notable changes to the firmware will be documented in this file. 
<!--  
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/). -->
 
## [Unreleased] - 2025-06-18
  
### Added
- **bldc_servo.cc**
  - Implemented torque monitoring logic: firmware will terminate (`exit(1)`) if `status_.torque_Nm` exceeds 50% of `max_torque_Nm`.
  - Added steady PWM output capability on pin 3 of `aux2` using:
    ```cpp
    aux2_port_->WritePwmOut(3, 1.0);
    ```
    **Configuration required:**
    ```bash
    conf aux2.pin.3.mode 17     # Set pin mode to PWM Output
    conf aux2.pin.3.pull 1      # Enable pull-up resistor
    ```
  - Preliminary implementation for reading analog input from pin 2 of `aux2`:
    ```cpp
    aux2_port_->status()->analog_inputs[2];
    ```
    **Configuration required:**
    ```bash
    conf aux2.pin.2.mode 16     # Set pin mode to Analog Input
    ```
    *Note: Analog read functionality is currently untested.*

- **bldc_servo_structs.h**
  - Introduced configuration parameters for hydraulic actuator integration:
    ```cpp
    float hyq_actual_dist = 0.0f;  // meters
    float hyq_base_dist = 0.0f;    // meters
    float hyq_max_pressure = 0.0f; // PSI
    float hyq_bore_dia = 0.0f;     // meters
    ```
  **Configuration required:**
    ```bash
    conf set servo.(hyq_actual_dist|hyq_base_dist|hyq_max_pressure|hyq_bore_dia) <floating point value>
    ```

### Changed
_None_

### Fixed
_None_

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
