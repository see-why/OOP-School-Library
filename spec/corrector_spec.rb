require_relative '../classes/corrector'

describe Corrector do
  context 'Corrector class Test' do
    corrector = Corrector.new

    it 'corrects name' do
      expect(corrector.correct_name('Henry')).to eql('Henry')
      expect(corrector.correct_name('henry')).to eql('Henry')
      expect(corrector.correct_name('Henry Danger')).to eql('Henry dang')
      expect(corrector.correct_name('henry danger')).to eql('Henry dang')
      expect(corrector.correct_name('Henry')).not_to eql('henry danger')
    end
  end
end
