# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    project_id 1
    priority 1
    description "MyString"
    status false
    deadline "2013-05-05"
  end
end
