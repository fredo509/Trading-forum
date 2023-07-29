# frozen_string_literal: true

class CommentSerializer < ActiveModel::Serializer
  attributes :author_id, :text
end
