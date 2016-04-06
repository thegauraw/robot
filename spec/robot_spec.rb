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

  describe '#turn' do
    context 'currently facing NORTH' do
      it "faces EAST in RIGHT turn" do
        robot.right
        expect(robot.report).to eql "Output: 0,0,EAST"
      end
      it "faces WEST in LEFT turn" do
        robot.left
        expect(robot.report).to eql "Output: 0,0,WEST"
      end
    end
    context 'currently facing SOUTH' do
      before do
        robot.place(0,0,'SOUTH')
      end
      it "faces WEST in RIGHT turn" do
        robot.right
        expect(robot.report).to eql "Output: 0,0,WEST"
      end
      it "faces EAST in LEFT turn" do
        robot.left
        expect(robot.report).to eql "Output: 0,0,EAST"
      end
    end
    context 'currently facing EAST' do
      before do
        robot.place(0,0,'EAST')
      end
      it "faces SOUTH in RIGHT turn" do
        robot.right
        expect(robot.report).to eql "Output: 0,0,SOUTH"
      end
      it "faces NORTH in LEFT turn" do
        robot.left
        expect(robot.report).to eql "Output: 0,0,NORTH"
      end
    end
    context 'currently facing WEST' do
      before do
        robot.place(0,0,'WEST')
      end
      it "faces NORTH in RIGHT turn" do
        robot.right
        expect(robot.report).to eql "Output: 0,0,NORTH"
      end
      it "faces SOUTH in LEFT turn" do
        robot.left
        expect(robot.report).to eql "Output: 0,0,SOUTH"
      end
    end

  end

end
