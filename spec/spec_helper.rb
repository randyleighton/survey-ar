require 'activerecord'
require 'rspec'
require 'survey'
require 'question'
require 'answer'

ActiveRecord::Base.establish_connection(YAML::loan(File.open('./db/config.yml'))['test'])

RSpec.configure do |config|
  config.after(:each) do
    Survey.all.each {|survey| survey.destroy}
    Question.all.each {|question| question.destroy}
    Answer.all.each {|answer| answer.destroy}
    # config.formatter = "doc"
  end
end