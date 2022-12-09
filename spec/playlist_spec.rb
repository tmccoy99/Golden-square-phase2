require "playlist"

RSpec.describe PlayList do
  context "view_tracks called before adding any tracks" do
    it "returns empty array" do
      playlist = PlayList.new
      expect(playlist.view_tracks).to eq []
    end
  end
  
  context "calling view_tracks after calling add on strings" do
    it "returns the strings in an array" do
      playlist = PlayList.new
      playlist.add_track("Paint it black")
      expect(playlist.view_tracks).to eq ["Paint it black"]
      playlist.add_track("California girls")
      expect(playlist.view_tracks).to eq ["Paint it black", "California girls"]
    end
  end
end