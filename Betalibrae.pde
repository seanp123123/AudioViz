class Betalibrae extends Selector
{
  AudioPlayer audio;
  
  Betalibrae()
  {
    super();
    audio = minim.loadFile("mp3_beta_librae.mp3",512);
  }
    void playSong()
  {
    audio.rewind();
    audio.play();
    
    String s = "you are listening to 'Betalibrae' by Umfang";
  }

  
  AudioPlayer getSong()
  {
     return audio; 
  }
  //function of subclasses is essentially to select the correct file to play
}
