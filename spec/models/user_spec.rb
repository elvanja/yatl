require 'spec_helper'

describe User do
  context "mandatory data" do
    it "requires email" do
      subject.email = nil
      expect(subject.valid?).to be_false
      expect(subject.errors.keys.include?(:email)).to be_true
    end
  end
end
