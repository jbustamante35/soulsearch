# SoulSearch
Added feature to phytoMorph that identifies initial root at the start of a time-lapse

# Fix this to use HypoQuantyl's method

## Summary
This program will use a Machine Learning (ML) algorithm to segment a plant root in the first
frame of a time-lapse experiment. It is intended to be an additional feature for the
Spalding lab's PhytoMorph program, which performs a kinematics analysis on growing roots.

The current system requires the user to manually click along the midline of a root at the
beginning of a time-lapse experiment (frame 1) in order to initialize PhytoMorph's
segmentation algorithm that forms a contour around the user's midline. The manual aspect
of PhytoMorph hinders it from being truly high-throughput and would make a large screen
of many genotypes difficult to analyze.

SoulSearch is intended to address this issue by using an ML algorithm to perform the
initial segmentation step typically performed by a human. Currently (as of 9/19/2018),
I am strategizing multiple methods in which this ML algorithm will function:
    1) Imitate the clicks a user would normally make
    2) Manually draw contours around root images
    3) Form a contour from a user-defined midline (similar to Method 1)

I am currently in favor of Method 1, since there is already an algorithm in PhytoMorph
that will generate a contour around a user's clicks. This means I wouldn't have to
draw a ton of contours around roots.

## Installation
Clone this repository into your desired location with

```
git clone https://github.com/jbustamante35/soulsearch
```


## Author
**Julian Bustamante**, Cellular and Molecular Biology (<jbustamante@wisc.edu> <br />
    University of Wisconsin - Madison <br />
    Department of Botany <br />
