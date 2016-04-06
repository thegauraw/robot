require 'spec_helper'

describe Robot do
  let(:robot) { Robot.new }
  before :each do
    robot.place(0,0,'NORTH')
  end

  describe '#place' do
    it "sets location and direction of Robot object" do

      expect("#{robot.x},#{robot.y},#{robot.f}").to eql "0,0,NORTH"
    end
  end

  describe '#report' do
    it 'returns the current position and state of the Robot object' do
      expect(robot.report).to eql "Output: 0,0,NORTH"
    end
  end

end
