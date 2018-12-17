require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.new(title: "New question body", body: "New Question Body", resolved: false) }
  let(:answer) { Answer.new(question: question, body: "New Answer body") }

  it "should respond to body" do
    expect(answer).to respond_to(:body)

  end
end
