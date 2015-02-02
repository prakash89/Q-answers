FactoryGirl.define do
	factory :question do
		title "some text"
		description "some more text"
    user_id {FactoryGirl.create(:user).id}
	end
end