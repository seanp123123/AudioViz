class Rave extends Selector
{
  AudioPlayer audio;
  
  Rave()
  {
    super();
    audio = minim.loadFile("Filter_Dread_-_Rave_320.mp3",512);
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
}
