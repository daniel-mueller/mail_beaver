require 'mail'

class MailBeaver

  @recipient

  @file
  @file_names
  @pic_path
  @absolute_path

  def initialize(recipient = 'danielmueller@limebird.de')
    @pic_path = File.join(File.dirname(__FILE__), '/pics/*')
    @file_names = Dir[@pic_path]
    @file = @file_names.sample
    @absolute_path = File.join(@pic_path, @file)
    @recipient = recipient
  end

  def execute
    send_mail
    delete_file
    Time.new
  end


  def send_mail
    mail = Mail.new
    mail.from = 'thesender@mailbeaver.org'
    mail.to = @recipient.defined? ? @recipient : 'fallback@default.com'
    mail.subject = 'Pictures'
    mail.header['X-Custom-Header'] = 'custom value'
    mail.attachments[@file] = File.read(@absolute_path)
    mail.deliver
  end

  def delete_file
    File.delete(@absolute_path)
  end
end