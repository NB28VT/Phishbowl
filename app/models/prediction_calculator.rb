class PredictionCalculator
  attr_accessor :songs_in_right_place, :songs_played_out_of_place

  # Song arrays for JS text highlighting

  def initialize
    @songs_in_right_place = []
    @songs_played_out_of_place = []
  end

  def pick_checker(play_index, set_index, prediction_song)
    song = @concert.concert_songs.where(
      play_index: play_index,
      set_index: set_index
    ).first.song

    if prediction_song == song
      @prediction_score += 3
      @songs_in_right_place << song
    elsif @concert.concert_songs.include?(prediction_song)
      @prediction_score += 1
      @songs_played_out_of_place << song
    end
  end

  def check_encore(song)
    if @concert.concert_songs.where(play_index: 1, set_index: 3)
      pick_checker(1, 3, song)
    end
  end

  def check_random_pick(prediction)
    if @concert.concert_songs.any? { |song_id| song_id = prediction.random_pick_song.id }
      @prediction_score += 2
      @songs_played_out_of_place << prediction.random_pick_song
    end
  end

  def songs_in_first_set
    (@concert.concert_songs.where(set_index: 1).first).songs_in_set
  end

  def songs_in_second_set
    (@concert.concert_songs.where(set_index: 2).first).songs_in_set
  end


  def get_prediction_score(prediction)
    @concert = prediction.concert
    @prediction_score = 0

    # HANDLE EXCEPTIONS FOR CONCERTS WITH LESS THAN 3 SETS HERE

    pick_checker(1, 1, prediction.set_one_opener_song)
    pick_checker(songs_in_first_set, 1, prediction.set_one_closer_song)
    pick_checker(1, 2, prediction.set_two_opener_song)
    pick_checker(songs_in_second_set, 2, prediction.set_two_closer_song)
    check_encore(prediction.encore_song)
    check_random_pick(prediction)

    @prediction_score
  end
end
