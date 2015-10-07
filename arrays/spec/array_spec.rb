require 'array'

describe "Array#my_uniq" do

  let(:arr) {[1,1,2,3,2,4]}

  it "returns an array" do
    expect(arr.my_uniq.class).to eq(Array)
  end

  it "returns a new array" do
    expect(arr.my_uniq).to_not eq(arr)
  end


  it "removes duplicate elements" do
    expect(arr.my_uniq).to contain_exactly(1,2,3,4)
  end

  it "returns elements in the order they were given" do
    expect(arr.my_uniq).to eq([1,2,3,4])
  end

  it "does not modify the original array" do
    arr.my_uniq
    expect(arr).to eq([1,1,2,3,2,4])
  end

end

describe "Array#two_sum" do

  let(:arr) { [-1, 0, 2, -2, 1] }
  let(:big_arr) { [-1, 3, 1, -3, -1, 6, 0, 1] }

  it "returns an empty array if no elements sum to zero" do
    expect([].two_sum).to eq([])
    expect([3].two_sum).to eq([])
    expect([3,6].two_sum).to eq([])
  end


  it "returns tuples of indices in increasing order" do
    expect(arr.two_sum).to eq([ [0, 4], [2, 3] ])
  end

  it "returns tuples sorted \"dictionary\" wise" do #never do this
    expect(big_arr.two_sum).to eq ( [[0, 2], [0, 7], [1, 3], [2, 4], [4, 7]] )
  end

  it "does not modify the original array" do
    original = arr.dup
    arr.two_sum
    expect(arr).to eq(original)
  end


end

describe "my_transpose" do

  let(:arr) { [ [0, 1, 2], [3, 4, 5], [6, 7, 8] ] }

  let(:small_arr) { [ [2,4], [5,7] ] }

  it "does not modify the original array" do
    my_transpose(arr)
    expect(arr).to eq([ [0, 1, 2], [3, 4, 5], [6, 7, 8] ])
  end

  it "transposes an array" do
    expect(my_transpose(arr)).to eq([ [0,3,6], [1,4,7], [2,5,8] ])
  end

  it "transposes an array of a different size" do
    expect(my_transpose(small_arr)).to eq([ [2,5], [4,7] ])
  end

  it "does not call the Arr#transpose method" do
    expect(arr).not_to receive(:transpose)
    my_transpose(arr)
  end

end

describe "stock_picker" do

    let(:day) { [100,125,150,2,40,4] }

    let(:bear_market) { [1000, 100, 20, 5, 1] }


  it "does not modify the original array" do
    original = day.dup
    stock_picker(day)
    expect(day).to eq(original)
  end

  it "returns an empty array if no set of days is profitable" do
    expect(stock_picker(bear_market)).to eq([])
    expect(stock_picker([1])).to eq([])
    expect(stock_picker([])).to eq([])
  end

  it "returns the most profitable pair of days" do
    expect(stock_picker(day)).to eq([0, 2])
  end

end

describe TowersOfHanoi do

    let(:game) {TowersOfHanoi.new}

    describe "#place_disc" do

      #
      # it "does not place larger disc on top of smaller disc" do
      #   game.towers = [[4,3,2],[5,1],[6]]
      #   allow(game).to receive(:gets).and_return("0,1\n")
      #   exxpect(game.place_disc).to receive(self)and_return("1,2\n")
      # end

      it "does place smaller disc on top of larger disc" do
        game.towers = [[4,3,2],[5,1],[6]]
        allow(game).to receive(:gets).and_return("1,2\n")
        game.place_disc
        expect(game.towers).to eq([[4,3,2],[5],[6,1]])
      end

      it "moves only one at a time" do
        game.towers = [[4,3,2],[5,1],[6]]
        allow(game).to receive(:gets).and_return("1,2\n")
        game.place_disc
        expect(game.towers).to eq([[4,3,2],[5],[6,1]])
      end

      # it "does not move in place"
      #

      it "updates placement" do
        game.towers = [[4,3,2],[5,1],[6]]
        allow(game).to receive(:gets).and_return("1,2\n")
        game.place_disc
        expect(game.towers).to eq([[4,3,2],[5],[6,1]])
      end
    end

    describe "#render" do

      let(:towers) { [ [6,5,4,3,2,1], [], [] ] }

      it "shows current stacks" do
        expect(game.render).to eq([ [6,5,4,3,2,1], [], [] ])
      end

    end

    # describe "#play_turn" do
    #
    #
    #   it "calls place_disc" do
    #     expect(game).to receive(:place_disc)
    #     allow(game).to receive(:gets).and_return("1,2\n")
    #     game.play_turn
    #
    #   end
    #
    #   it "calls render" do
    #     expect(game).to receive(:render)
    #     allow(game).to receive(:gets).and_return("1,2\n")
    #     game.play_turn
    #   end
    #
    #   it "calls won?" do
    #     expect(game).to receive(:won?)
    #     allow(game).to receive(:gets).and_return("1,2\n")
    #     game.play_turn
    #   end
    #
    #   it "calls itself" do
    #     expect(game).to receive(:play_turn).at_least(:twice).and_call_original
    #     allow(game).to receive(:gets).and_return("1,2\n")
    #     game.play_turn
    #   end


    end

    describe "#won?" do

      let(:winner) { [ [], [], [6,5,4,3,2,1] ] }

      let(:winner2) { [ [], [6,5,4,3,2,1], [] ] }

      it "returns true when discs are stacked in tower2 or tower3" do
        game.send(:towers=, [ [], [], [6,5,4,3,2,1] ])
        expect(game.won?).to eq(true)

        game.send(:towers=, [ [], [6,5,4,3,2,1], [] ])
        expect(game.won?).to eq(true)

      end

      it "returns false when win conditions haven't been met" do
        game.send(:towers=,[ [6,5,4,3,2,1], [], [] ])
        expect(game.won?).to eq(false)
      end

    end

end
