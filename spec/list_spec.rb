# require 'rspec'
# require 'pg'
# require 'list'
#
# DB = PG.connect({:dbname => 'to_do_test'})
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec('DELETE FROM lists *;')
#   end
# end

require("spec_helper")

describe List do
  describe('.all') do
    it("starts off with no lists") do
      expect(List.all()).to eq([])
    end
  end

  describe('#name') do
    it 'tells you its name' do
      list = List.new({:name => "Grocery List", :id => nil})
      expect(list.name()).to eq("Grocery List")
    end
  end

  describe "#id" do
    it 'sets the ID when you save it' do
      list = List.new({:name => "Grocery List", :id =>nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe "#save" do
    it "lets you save lists to database" do
      list = List.new({:name => "Grocery List", :id => nil})
      list.save()
      expect(List.all).to eq([list])
    end
  end

  describe "#==" do
    it "is the same list if it has the same name" do
      list1 = List.new({:name => "Grocery List", :id => nil})
      list2 = List.new({:name => "Grocery List", :id => nil})
      expect(list1).to(eq(list2))
    end
  end

  describe('.find') do
    it('returns a list by its ID') do
      test_list = List.new({:name => "Grocery List", :id => nil})
      test_list.save()
      test_list2 = List.new({:name => "Grocery List", :id => nil})
      test_list2.save()
      expect(List.find(test_list2.id())).to(eq(test_list2))
    end
  end

end
