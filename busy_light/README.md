# Busy Light

This allows me to control a strip of WS2812b LEDs via ESP32 running WLED.

The basic version at the moment uses [this](https://www.aliexpress.com/item/1005004630928292.html) 5-key macro keyboard.  
The keyboard runs Sayo's simplekey firmware and has a [WebUI](https://sayodevice.com/simplekey) which allows for easy configuration of the keys.  

I've got Key 2 bound so that it sends a F24 keystroke to the connected Mac.  The Mac is running Karabiner Elements, which has a 'complex modification' running which triggers a [`to.shell_command`](https://karabiner-elements.pqrs.org/docs/json/complex-modifications-manipulator-definition/to/shell-command/) when F24 is detected.
The `complex modification` is set up through the [Karabiner Complex Modifications Generator](https://genesy.github.io/karabiner-complex-rules-generator/), just paste in the contents of the [rule file](karabiner_elements_rule.json)

The script that is triggered by the keypress on the macro keyboard checks WLED API to see if the light is lit, and toggles the strip on or off as appropriate via the same API.
