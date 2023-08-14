# eyetracking
<p>This MATLAB program is designed to detect movements of eigenfeatures in an area of interest and plot them with user-added notes. </p>
Requirements
<ul>
  <li>MATLAB software</li>
  <li>Image Processing Toolbox for MATLAB (optional, but recommended for optimal performance)</li>
</ul>
Getting Started
<ol>
  <li>Clone or download this repository to your local machine</li>
  <li>Open the MATLAB software and navigate to the folder where the repository was cloned/downloaded</li>
  <li>Run the <code>main.m</code> file to start the program</li>
  <li>Alternativaly you can run the <code>mainautomatic.m</code> file to start the analysis of nystagmus in nursling</li>
  <li>add timestamps and notes for your plot</li>
  <li>The program will prompt you to select the area of interest image</li>
  <li>The program will perform detection of movements of eigenfeatures in the image</li>
  <li>The program will replay your video with added eigenfeatures</li>
  <li>The program will prompt you to select the medial palpebral commissures and pupils in the image</li>
  <li>The program will plot eye movements</li>
  <li>The final plot with user-added notes can be saved as an image file</li>
</ol>
Test File and Sample Plot
<p>A test video file (<code>video.mp4</code>) and a sample plot (<code>sample_online.png</code>) are provided in the repository to demonstrate the functionality of the program.</p><br>
<p>A video file (<code>horizontal nystagmus.mp4</code>)</p>
Notes
<ul>
  <li>The program is designed for use with 2D color images</li>
  <li>The detection of eigenfeature movements is based on the Lucas-Kanade method</li>
</ul>
Feedback
<p>If you encounter any issues or have suggestions for improvement, please open an issue on the repository's GitHub page.</p>
