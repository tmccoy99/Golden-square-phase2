class PlayList
  def initialize
    @tracks = []
  end
  
  def view_tracks
    @tracks
  end
  
  def add_track(track)
    @tracks << track
  end
end