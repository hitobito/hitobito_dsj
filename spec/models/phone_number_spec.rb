require 'spec_helper'

describe PhoneNumber do

  it 'is extended in wagon' do
    expect(subject).to be_a Dsj::PhoneNumber
  end

  it 'stores the number normalized for more consistent searching' do
    expect(subject).to respond_to :normalized
  end

  it 'converts the number upon saving' do
    expect do
      subject.normalized = nil
      subject.number     = '+41 79 123 45 67'
      subject.save
    end.to change(subject, :normalized).from(nil).to '41791234567'
  end
end
