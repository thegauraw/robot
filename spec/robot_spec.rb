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

  describe '#move' do
    context 'is at the end/edge in that direction' do
      context 'has y-axis 0 and is facing SOUTH' do

        it 'does not change the state/position' do
          robot.place(0,0,'SOUTH')
          robot.move
          expect(robot.report).to eql "Output: 0,0,SOUTH"
        end
      end
      context 'has x-axis 0 and is facing WEST' do

        it 'does not change the state/position' do
          robot.place(0,0,'WEST')
          robot.move
          expect(robot.report).to eql "Output: 0,0,WEST"
        end
      end

      context 'has y-axis TABLE_SIZE and is facing NORTH' do

        it 'does not change the state/position' do
          robot.place(Robot::TABLE_SIZE,Robot::TABLE_SIZE,'NORTH')
          robot.move
          expect(robot.report).to eql "Output: #{Robot::TABLE_SIZE},#{Robot::TABLE_SIZE},NORTH"
        end
      end
      context 'has x-axis TABLE_SIZE and is facing EAST' do

        it 'does not change the state/position' do
          robot.place(Robot::TABLE_SIZE,Robot::TABLE_SIZE,'EAST')
          robot.move
          expect(robot.report).to eql "Output: #{Robot::TABLE_SIZE},#{Robot::TABLE_SIZE},EAST"
        end
      end
    end

    # context 'is at location other than edge in that direction' do
    #   context 'is facing ' do
    #     it 'change x-coordinate'
    #   end
    # end
  end
end
