module NounProjectApi
  # A base class for different retriever classes.
  class Retriever
    include Connection

    # Find an item based on it's id.
    def find(id)
      fail(ArgumentError, "Missing id/slug") unless id

      result = access_token.get("#{API_BASE}#{self.class::API_PATH}#{id}")
      fail(ArgumentError, "Bad request") unless result.code == "200"

      self.class::ITEM_CLASS.new(result.body)
    end
  end
end
