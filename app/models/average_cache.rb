class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Car"
  belongs_to :rateable, :polymorphic => true
end
