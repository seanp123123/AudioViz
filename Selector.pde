class Selector
{
  AudioPlayer audio;
   Selector()
  {
    
  }
 void playSong()
  {
    audio.rewind();
    audio.play();
  }
  void displaySong()
  {
  }
  
  AudioPlayer getSong(){
    return audio;
    
  }
  
}
