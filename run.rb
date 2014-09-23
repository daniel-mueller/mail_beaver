#
# This script sends a random picture
# from the current directory and deletes
# it afterwards
#
require 'mail_beaver'
mail_beaver = MailBeaver.new
time = mail_beaver.execute
puts 'Done sending an email. Time:' + time.inspect + '.'

