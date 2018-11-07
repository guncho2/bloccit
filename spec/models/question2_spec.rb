require 'rails_helper'

RSpec.describe Question2, type: :model do
  let(:question2) { Question2.new(title: "New question2 title", body: "New Question2 Body", resolved: false) }

  it "should respond  to title" do
    expect(question2).to respond_to(:title)
  end

  it "should respond  to body" do
    expect(question2).to respond_to(:body)
  end

  it "should respond  to resolved" do
    expect(question2).to respond_to(:resolved)
  end

end
