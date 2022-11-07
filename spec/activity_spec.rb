require './lib/activity'

RSpec.describe Activity do

  it "has a name" do
    activity = Activity.new("Brunch")
    expect(activity.name).to eq("Brunch")
  end

  it "has an empty participants hash" do
    activity = Activity.new("Brunch")
    expect(activity.participants).to be_a Hash
    expect(activity.participants.count).to eq(0)
  end

  it "can add a participant" do
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    expect(activity.participants).to eq({"Maria"=>20})
  end

  it "gives total cost of all participants" do
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    expect(activity.total_cost).to eq(20)
    activity.add_participant("Luther", 40)
    expect(activity.participants.count).to eq(2)
    expect(activity.total_cost).to eq(60)
  end

  it "can split the total cost" do
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    expect(activity.split).to eq(30)
  end

  it "can calculate how much a participant owes to pay an equal share" do
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    expect(activity.owed).to eq({"Maria" => 10,"Luther" => -10})
  end

end
