# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post, type: :model do

  it "is valid" do
    valid_post = build(:post)
    expect(valid_post).to be_valid
  end

  it "is invalid without a title" do
    missing_title = build(:post, title: "")
    expect(missing_title).to be_invalid
  end

  it "is invalid with too short content" do
    shorty = build(:post, content: "l")
  expect(build(:post, content: "too short")).to be_invalid
end

  it "is invalid with a long summary" do
    long_summary = build(:post, summary: "So this is a paragraph, and it describes things. Sometimes it contains run on sentences that seem to never end but thats really because we need to hit a certain character length to be uniform with the validations. Besides that, its really not that bad, and quite commical. I mean there is a few grammatical errors, but it is a string so who cares?!?!?")
    expect(long_summary).to be_invalid
  end

  it "is invalid with a category outside the choices" do
    invalid_cat = build(:post, category: "catemagory")
    expect(invalid_cat).to be_invalid
  end

  it "is invalid if not clickbait" do
    non_clickbait = build(:post, title: "Nope nope Nope")
    expect(non_clickbait).to be_invalid
  end

  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end
end
