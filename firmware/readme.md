# reremeter firmware

The firmware in this dicretory provides with everything you need to get started with the hardware. As we used a STM microprocessor, the CubeMX .ioc file provides you with a good starting point. 

### Necessary steps to get started

- Build your own reremeter.
- Get and embedded IDE and matching tools. We used SEGGER Embedded Studio and the J-Link EDU Mini.
- Installing STM32 Cube MX is helpful as well. This enables you to generate new project files for the IDE you chose. The [configuration file](nir_scope_usb.ioc) is provided in this directory.
- Include all the provided files into your freshly generated project. 
- Compile the project and upload it to the microcontroller. 
