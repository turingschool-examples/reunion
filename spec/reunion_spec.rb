require './lib/reunion'
require './lib/activity'

RSpec.describe Reunion do

  it "has readable attributes" do
    reunion = Reunion.new("1406 BE")
    expect(reunion.name).to eq("1406 BE")
    expect(reunion.activities).to be_a Array
    expect(reunion.activities).to eq([])
  end

  it "can add an activity" do
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    reunion.add_activity(activity_1)
    expect(reunion.activities).to eq([activity_1])
  end

  it "can add total cost from multiple activities" do
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    expect(reunion.total_cost).to eq(60)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)
    expect(reunion.total_cost).to eq(180)
  end

  it "can perform breakout method" do
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)
    expect(reunion.breakout).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})
  end

  it "gives summary of breakout in string format" do
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)
    expect(reunion.summary).to eq("Maria: -10\nLuther: -30\nLouis: 40")
  end


end
