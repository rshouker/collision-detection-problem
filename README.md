This small project illustrates two problems I encountered with collision detection of areas in Raycast2D.<br>
And yes I turned collide with areas on.<br>
<br>
The problem I encountered is when performing await for physics frame, and then checking the raycast, it sometimes get it wrong.
Same if I only force raycast refresh. <br>
When doing both it works. Shouldn't each on it's own work?<br>
<br>
In the TwoHeads scenes I have export two booleans, one for each method. If only one of them is checked, it breaks; if both are checked it works.
