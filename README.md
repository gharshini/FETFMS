# Fetal-eye-tracking-from-ultrasound-scans

Guidelines for Eye Tracking

There are two .m files that are to be used to perform the eye tracking 
1.	Main_Program
2.	Test
Main Program:
It has multiple segments to do the tracking starting from loading the image to generating the excel sheet.
Test:
It is a small subprogram which is used to check whether the tracking is performed properly for both right and left eye. It is always called before proceeding to Section 4
Guidelines for Main_Program:
Pre-Processing
1.	Choosing videos for Processing
a.	Rejection Criteria 
i.	Too much head motion
ii.	Eyeball not clear in more than 40% of the video length
iii.	Eye lens not visible in more than 40% of the video length
iv.	Only one eye is clear for tracking**

Section 1:
Loading the Video Clip
 
1.	Set the Gestational age of patient
2.	Provide the path in which the video clips are located.
3.	Run the Program


Section 2:
Tracking of Eyeball
1.	Choosing of frame
a.	Use implay(img_gray), then 
b.	Find a frame where both eyeballs and eye lens are clear. Eyeball can be observed by looking at the intensity contour marked by the eye socket (bright area surrounding the eyeball). Eye lens is the bright and small slit, or ellipse within the eyeball.  
c.	Ppp_l* is to be changed to the frame number obtained from above.

2.	Choosing the Eyeball region
a.	Encircle the eyeball; make sure the geometrical figure is as close to a circle as possible.   ( if not a perfect circle)
b.	The contour of the eyeball is not completely visible in most of the videos,
c.	In such cases, the partial contour of the eyeball is taken as reference plane to draw the circular eyeball region (This selection of partial contour helps the subject person to more or less stick with the actual shape of the eyeball).
d.	Once the contour is set and center is obtained, proceed to the next section
e.	Repeat the same for the other eye

Section 3:
Tracking of lens
1.	Choosing of frame
a.	Use implay(img_gray), then 
b.	Choose the frame in which the lens is visible (even if the area of lens is <5 pixels).
 
c.	Ppp_l* is to be changed to the frame number obtained from above.

2.	Choosing the eye lens
a.	Not to choose the lens tracking if it is <15 frame between two missing points.
b.	Start choosing the eye lens from 1st frame
c.	There are few occasions in which the area of lens is so small such that it is not visible to the human eye, but still the program is able to track it. 
d.	In such case, do not neglect those frames while generating the plots
e.	In instances where the lens disappears and the tracker moves to a different location, Use implay (img_video_(l or R) to find the exact frame where the tracker deviated.
f.	Using the same video find the frame where the lens reappears and repeat the above steps. 
g.	Write down the frame numbers where the tracker stops and where it starts again. 

3.	Running Test:
a.	Every time when the lens tracking is done (Section 3). Always run the Test.m file in-order to check the tracking.
b.	Make sure all the frames in which lens appears are tracked properly and then move to section 4

Section 4
Coordinate matching
1.	After running Test.m file and confirming that the lens is tracked properly through all frames
2.	Then the coordinate of the lens is mapped back to the original coordinate of the video by running section 4.
 
Section 5:
Cropping criteria for missing eye lens 
1.	Use the frame numbers where the lens is missing obtained from section 3. 
2.	Write down the frame intervals that you will be including after “If” as written bellow. 

 

3.	Example
a.	i<40 || i>70 means that the frames 40-70 will be cropped out
b.	i<40|| i>70 && i<110 means that the frames 40-70 and frames greater than 110 will be cropped out
4.	Run the section again
*Repeat sections 2-4 using the right eye. Instead of using l, we will use r.
Section 6:
Cropping criteria for head motion
4.	Head Motion Correction
a.	Generate the plot, check for region with sudden jump over 40 degrees, get the frame number
b.	Crop those frames as  done earlier with lens or eyeball



There are four .mp4 files as an example 
