class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :author, :content
end
