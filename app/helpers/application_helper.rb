module ApplicationHelper
	FLASH_CLASSES = {
	  notice: 'alert alert-info',
	  success: 'alert alert-success',
	 }.freeze
  def flash_class(level)
  	FLASH_CLASSES[level]
  end

  def active(path)
      current_page?(path) ? 'active' : ''
  end
end
