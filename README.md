# Audio-Visualized
Audio-Visualizer program that utilizes Processing's Sound Library and FFT to create visuals from an audio input.

## Creators
Ryan Koble https://www.ryankoble.com/  
Jamie Catacutan http://jamie-catt.com/

## Process
We began this project with the intention of creating an audio-visualization program using Processing, however, we didn't have specfic goals for what the visualization would look like. Because neither of us had created an audio-visualization program in the past, we wanted to first explore the capabilities of Processing for creating a program like this, and then explore what the visualization should look like.

To begin, we looked at Processing's resources and found and installed the Sound Library. This enabled the program to access the Fast Fourier Transform (FFT) analyzer (https://processing.org/reference/libraries/sound/FFT.html) and an audio input.

For the visualation, we began with Processing's simple particle system (https://processing.org/examples/simpleparticlesystem.html).

Combining the code together from these sketches was initially difficult for us, but through this process, we understood Processing and Java better and improved in our abilities to analyze code.

In the end, our program visualized an audio input along the x-axis in the middle of the y-axis using an explosion of particles whose colors and location are determined by the frequency that is detected. This program can be optimized for different audio sources to map the frequency range of the input to the entire screen.

In the example below, the visualization is optimized for an acoustic guitar input.

## Documentation
https://www.youtube.com/watch?v=LMvTwha9elA
