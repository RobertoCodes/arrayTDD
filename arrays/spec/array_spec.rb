require 'array'

describe "Array#my_uniq" do

  let(:arr) {[1,1,2,3,2,4]}

  it "should return an array" do
    expect(arr.my_uniq.class).to eq(Array)
  end

  it "should return a new array" do
    expect(arr.my_uniq).to_not eq(arr)

  end

  it "should return elements in the order they were given"

  it "should not modify"

  it "remove duplicate elements"

end
