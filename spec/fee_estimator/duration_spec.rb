require_relative '../spec_helper'
require 'fee_estimator/duration'

module FeeEstimator

  describe Duration do
    
    subject { Duration.new(400) }

    it "takes minutes and returns hours + minutes" do
      dur = Duration.new(400)
      dur.hours_minutes.must_equal [6, 40]
    end

    describe :hours_minutes_rounded do
      it "rounds to the nearest 15 minutes" do
        Duration.new(400).hours_minutes_rounded.must_equal [6, 45]
        Duration.new(125).hours_minutes_rounded.must_equal [2, 15]
        Duration.new(152).hours_minutes_rounded.must_equal [2, 30]
      end
    end

    describe :* do
      it "multiplies a duration by given number" do
        (subject * 30).minutes.must_equal(12000)
      end

      it "returns a new instance of Duration" do
        (subject * 30).must_be_instance_of Duration
      end
    end

    describe :hours do
      it "returns hours as a float" do
        subject.hours.must_equal 6.75
      end
    end
  end
end
