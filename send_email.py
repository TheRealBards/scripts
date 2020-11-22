import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

fromaddr = "<from_addr>"
toaddr = "<to_addr>"

msg = MIMEMultipart()
msg['From'] = fromaddr
msg['To'] = toaddr
msg['Subject'] = ""

body = '''
'''

msg.attach(MIMEText(body, 'plain'))

server = smtplib.SMTP('127.0.0.1', 25)
server.starttls()
text = msg.as_string()

server.sendmail(fromaddr, toaddr, text)

server.quit()
