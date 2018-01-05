# encoding: UTF-8
class Survey < ApplicationRecord; end
class Question < ApplicationRecord; end
class QuestionGroup < ApplicationRecord; end
class Answer < ApplicationRecord; end
class Response < ApplicationRecord; end
class ResponseSet < ApplicationRecord; end

class UpdateBlankApiIdsOnQuestionGroup < ActiveRecord::Migration
  def self.up
    check = [Survey, Question, QuestionGroup, Answer, Response, ResponseSet]
    check.each do |clazz|
      clazz.where('api_id IS ?', nil).each do |c|
        c.api_id = Surveyor::Common.generate_api_id
        c.save!
      end
    end
  end

  def self.down
  end
end
