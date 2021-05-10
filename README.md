# ECE228_Project
Since the beginning of great composers, music has always been a painstaking process to write and compose. 
This process no longer needs to be restricted to manual labor done by humans, but instead can be automated using AI. 
While the idea of a neural composer is not a new one, we intend to build on a currently existing neural composer 
and improve its results by applying the process of learning put forth by Manan Oza et al in their 2019 paper 
“Progressive Generative Adversarial Binary Networks for Music Generation''. This would allow video games and
movie scores to be generated on the fly without needing human interference. 
HackerPoet has built a neural composer that is trained on a MIDI dataset of video game theme songs. 
Currently, the composer converts all training data into piano roll format and treats every note as a 
single strike with no holds, decomposing 96 note samples into time steps of 96 units per measure and 
adding a third dimension of 16 measures to capture the symmetry of repeated measures and motifs in 
highly structured songs. Each measure is encoded into a feature vector, which then are fed into an autoencoder which produces another feature vector for the entire song, then is finally run through decoders to be converted ba
ck into independent measures. The baseline composer network is essentially two identical encoders 
with opposite feed directions. The hyperparameters for each measure encoder are then adjusted to 
improve the results. The training of GANs is subject to issues of instability and mode collapsing.
Manan Oza et al proposes that by progressively training the model by adding additional convolutional 
layers as training phases stabilize, the music “exhibits lesser fragmentation of the notes and improved 
periodicity and melodic perception.” By adding layers after the previous ones have converged to HackerPoet’s 
neural composer, we seek to improve the quality of the music that has been generated. 
We intend to use the Lakh Piano Roll dataset to train our model, which consists of ~ 
150000 multitrack piano rolls. Pianoroll is a music string format which represents music in 
the form of a matrix. More details on piano roll will be discussed later in the proposal.
