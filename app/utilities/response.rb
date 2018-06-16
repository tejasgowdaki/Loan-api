class Response
  def success(data)
    { success: true, data: data }
  end

  def error(message)
    { success: false, message: message }
  end
end
