FactoryGirl.define do
  factory :answer do
    my_answer "My Answer"
    question_id {FactoryGirl.create(:question).id}
    user_id {FactoryGirl.create(:user).id}
  end

end
