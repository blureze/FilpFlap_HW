require_relative 'tsv_buddy'

class Tester
  include TsvBuddy
end

t = Tester.new.take_tsv(File.read('data/survey.tsv'))
