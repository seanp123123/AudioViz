import ddf.minim.*;
import ddf.minim.analysis.*;
 //initializing minim and minim libraries
Minim minim;
AudioPlayer song;
FFT fft;
float centX;
float centY;




void setup()
{
  size(512, 700);
  //set centX, centY for controlling animations
  centX = width/2;
  centY = height/2;
 
  //start Minim object
  minim = new Minim(this);
 
 


  //randomized selection of song with polymorphism
  int r = (int) random(0,4);

  Selector s;
  switch(r)
  {
    case 0:
    s = new Betalibrae();
    //calls Betalibrae subclass through selector base class 
    song = s.getSong();
    break;
    
    case 1:
    s = new Rave();
     //calls Rave subclass through selector base class 
    song = s.getSong();
    break;
    
    case 2:
    s = new Grade();
     //calls Grade subclass through selector base class 
    song = s.getSong();
    break;
    
    case 3:
    s = new Quartz();
     //calls Quartz subclass through selector base class 
    song = s.getSong();
    break;
  } 
}




void draw()
{
  background(0);
  //use forward fft to analyse spectrum
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.forward(song.mix);
  song.play();

  stroke(255);
  
  for(int i = 0; i < song.left.size() - 1; i++)
  {
    for(int j =0;j < 5; j++)
    {
      //creates 5 rectangle animations of different sizes both horizontally and vertically across the origin 
      stroke(0,128,0,128);
      noFill();
      rect((centX-((width/10)*j)),(centY-((height/5*j)/2)*song.left.get(i)),((width/5)*j),((height/5*j)*song.left.get(i)));
      //horizontal rectangles
      rect((centX-((width/10)*j)*song.left.get(i)),(centY-((height/5*j)/2)),((width/5*j)*song.left.get(i)),(height/5*j));
      //vertical rectangles
     } 
      //Outer(light blue circle)
      stroke(0,200,255);
      fill(0,200,255,128);
      ellipse(centX,centY,(song.left.get(i)*400) ,((song.left.get(i)*400))); 
      //Inner(black rim circle)
      stroke(0);
      noFill();
      ellipse(centX,centY,(song.left.get(i)*250) ,(song.left.get(i)*250));  
      //Inner (dark blue oval)
      stroke(0,0,255);
      fill(0,0,255);
      ellipse(centX,centY,(song.left.get(i)*100) ,(song.left.get(i)*200));
       
  stroke(255, 0, 0, 128);
  
  for(i = 0; i < (fft.specSize()*2); i++)                    
  //for each part of the music sample
  {
    line(i*2, height, i*2, height - fft.getBand(i)*20);
    //displays lines based on volume of particular frequencies
    line((fft.specSize()-i)*2,(height - fft.getBand(i)*20),(fft.specSize()-i)*2 , height );
    //does the same except in reverse for uniformity (and because the high end seemed quite weak)
  }
 

 
      
      
 
  }

}

void stop()
{
  //closing minim and the song
  song.close();
  minim.stop();
  super.stop();
}

