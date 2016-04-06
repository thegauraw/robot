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

  describe '#right' do
    context 'currently facing NORTH' do
      it "faces EAST in RIGHT turn" do
        robot.right
        expect(robot.report).to eql "Output: 0,0,EAST"
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
    end
    context 'currently facing EAST' do
      before do
        robot.place(0,0,'EAST')
      end
      it "faces SOUTH in RIGHT turn" do
        robot.right
        expect(robot.report).to eql "Output: 0,0,SOUTH"
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
    end
  end

  describe '#left' do
    context 'currently facing NORTH' do
      it "faces WEST in LEFT turn" do
        robot.left
        expect(robot.report).to eql "Output: 0,0,WEST"
      end
    end
    context 'currently facing SOUTH' do
      before do
        robot.place(0,0,'SOUTH')
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
      it "faces NORTH in LEFT turn" do
        robot.left
        expect(robot.report).to eql "Output: 0,0,NORTH"
      end
    end
    context 'currently facing WEST' do
      before do
        robot.place(0,0,'WEST')
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

    context 'is at location other than edge in that direction' do
      context 'has y-axis greater than 0 and is facing SOUTH' do

        it 'does not change the state/position' do
          robot.place(Robot::TABLE_SIZE-1, Robot::TABLE_SIZE-1,'SOUTH')
          robot.move
          expect(robot.report).to eql "Output: #{Robot::TABLE_SIZE-1},#{Robot::TABLE_SIZE-2},SOUTH"
        end
      end
      context 'has x-axis greater than 0 and is facing WEST' do

        it 'does not change the state/position' do
          robot.place(Robot::TABLE_SIZE-1,Robot::TABLE_SIZE-1,'WEST')
          robot.move
          expect(robot.report).to eql "Output: #{Robot::TABLE_SIZE-2},#{Robot::TABLE_SIZE-1},WEST"
        end
      end

      context 'has y-axis less than TABLE_SIZE and is facing NORTH' do

        it 'does not change the state/position' do
          robot.place(Robot::TABLE_SIZE,Robot::TABLE_SIZE,'NORTH')
          robot.move
          expect(robot.report).to eql "Output: #{Robot::TABLE_SIZE},#{Robot::TABLE_SIZE},NORTH"
        end
      end
      context 'has x-axis less than TABLE_SIZE and is facing EAST' do

        it 'does not change the state/position' do
          robot.place(Robot::TABLE_SIZE,Robot::TABLE_SIZE,'EAST')
          robot.move
          expect(robot.report).to eql "Output: #{Robot::TABLE_SIZE},#{Robot::TABLE_SIZE},EAST"
        end
      end
    end
  end

  describe '#follow' do
    context 'with place command' do
      subject {robot.follow('PLACE 0,0,EAST')}
      it 'calls place method' do
        expect(robot).to receive(:place).with('0','0','EAST')
        subject
        # expect(robot.report).to eql "Output: 0,0,EAST"
      end
    end
    context 'with right method' do
      subject {robot.follow('RIGHT')}
      it 'calls right method' do
        expect(robot).to receive(:right)
        subject
        # expect(robot.report).to eql "Output: 0,0,EAST"
      end
    end
    context 'with left method' do
      subject {robot.follow('LEFT')}
      it 'calls left method' do
        expect(robot).to receive(:left)
        subject
        # expect(robot.report).to eql "Output: 0,0,WEST"
      end
    end
    context 'with move method' do
      subject {robot.follow('MOVE')}
      it 'calls move method' do
        expect(robot).to receive(:move)
        subject
        # expect(robot.report).to eql "Output: 0,1,NORTH"
      end
    end
    context 'with report method' do
      subject {robot.follow('REPORT')}
      it 'calls report method' do
        expect(robot).to receive(:report)
        subject
        # expect(robot.report).to eql "Output: 0,0,NORTH"
      end
    end
  end
end
