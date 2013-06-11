require 'spec_helper'

describe Task do
  let(:defaults) { {description: 'buy milk', priority: 10} }
  let(:subject) { described_class.new(defaults) }

  context "listing items by priority" do
    before(:each) do
      described_class.new(description: 'B', priority: 100).save!
      described_class.new(description: 'C', priority: 1).save!
      described_class.new(description: 'A', priority: 100).save!
    end

    it "lists higher priorities first, then by description" do
      expect(described_class.all_by_priority.map(&:description)).to eq(['A', 'B', 'C'])
    end
  end

  context "mandatory data" do
    it "requires description" do
      subject.description = nil
      expect(subject.valid?).to be_false
      expect(subject.errors.keys.include?(:description)).to be_true
    end

    it "requires priority" do
      subject.priority = nil
      expect(subject.valid?).to be_false
      expect(subject.errors.keys.include?(:priority)).to be_true
    end
  end

  context "defaults" do
    it "has 0 priority" do
      expect(described_class.new.priority).to eq(0)
    end
  end
end
