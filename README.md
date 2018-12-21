# fivem-speed
Makes the vehicle you're in when you run the command explode after the speed falls below a set threshold. If you get out of the vehicle, the bomb will still be attached to that vehicle. Can be used to make a bomb like the movie Speed, or to just make a car bomb (by getting in someone else's car and setting the speed and delay very low, so they explode at the first intersection).

To use with the default speed/delay, get in a vehicle and type `/speed`. The speed and delay can be passed in as arguments, like `/speed 15` to arm the bomb after reaching 15mph and `/speed 15 1` to arm the bomb after reaching 15mph and detonate 1 second after falling below that speed.

If the vehicle hasn't exploded yet, run `/speed` again to deactivate the bomb.

## Download & Installation

### Using Git
```
cd resources
git clone https://github.com/propstg/fivem-speed.git
```

### Manually
- Download https://github.com/propstg/fivem-speed/archive/master.zip
- Put it in the `resources` directory

## Installation
- Add this to your `server.cfg`:

```
start fivem-speed
```

# Legal
### License
The MIT License (MIT)

Copyright (c) 2018 blarglebottoms

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.