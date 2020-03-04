require_relative '../lib/logic'

RSpec.describe Myself do
  describe '#about_me' do
    it 'returns a string' do
      myself = Myself.about_me
      expect(myself).to be_a(String)
    end
  end

  describe '#skillz' do
    it 'returns a string' do
      myself = Myself.skillz
      expect(myself).to be_a(String)
    end
  end

  describe '#education' do
    it 'returns a string' do
      myself = Myself.education
      expect(myself).to be_a(String)
    end
  end

  describe '#experience' do
    it 'returns a string' do
      myself = Myself.experience
      expect(myself).to be_a(String)
    end
  end

  describe '#projects' do
    it 'returns a string' do
      myself = Myself.projects
      expect(myself).to be_a(String)
    end
  end

  describe '#contact' do
    it 'returns a string' do
      myself = Myself.contact
      expect(myself).to be_a(String)
    end
  end
end
