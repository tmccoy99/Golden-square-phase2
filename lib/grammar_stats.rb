class GrammarStats
  def initialize
    @true_results = 0 ; @results = 0
  end

  def check(text)
    result = ("A".."Z").include?(text[0]) && ["!", "?", "."].include?(text[-1])
    @results += 1
    @true_results += result ? 1 : 0
    result
  end

  def percentage_good
    return 100 if @results == 0
    (100 * @true_results / @results.to_f).round
  end
end