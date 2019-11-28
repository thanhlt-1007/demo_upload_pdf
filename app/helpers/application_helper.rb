module ApplicationHelper
  def error_message record, attribute
    record.errors.to_hash(true)[attribute]&.first
  end
end
