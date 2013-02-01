require 'htmlentities'
#
# We are opening up Exception and adding to_xml and to_json.
#
class Exception

  def exception_type
    self.class.to_s ? self.class.to_s.split("::").last : 'None'
  end

  def to_xml
    "<errors><error>#{HTMLEntities.new.encode(self.message)}</error><type>#{self.exception_type}</type></errors>"
  end

  def to_json
    "{\"error\":#{ActiveSupport::JSON.encode(self.message.gsub(/\r/, ' ').gsub(/\n/, ' ').squeeze(' '))}}"
  end

end
