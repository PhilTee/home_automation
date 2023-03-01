#!/usr/bin/python3

import email, imaplib, subprocess, re
from email.header import decode_header

# CONFIG
username = ""
password = ""
youtube_regex = re.compile(r".*music\.youtube\.com\/playlist")


def obtain_header(msg):
  # decode the email subject
  subject, encoding = decode_header(msg["Subject"])[0]
  if isinstance(subject, bytes):
    subject = subject.decode(encoding)

  # decode email sender
  From, encoding = decode_header(msg.get("From"))[0]
  if isinstance(From, bytes):
    From = From.decode(encoding)

  return subject, From


def run_downloader(url):
  process = subprocess.Popen(
    ['yt-dlp', '-o' "/opt/plexmedia/music/%(artist)s/%(album)s/%(playlist_index)s. %(title)s.%(ext)s", '--add-metadata', '--yes-playlist', '-x', '--audio-format', 'mp3', url],
    stdout=subprocess.PIPE,
    universal_newlines=True
  )

  while True:
    output = process.stdout.readline()
    print(output.strip())
    # Do something else
    return_code = process.poll()
    if return_code is not None:
      print('RETURN CODE', return_code)
      # Process has finished, read rest of the output 
      for output in process.stdout.readlines():
        print(output.strip())
      break

  return return_code == 0


def fetch_emails():
  status, messages = mailbox.select("INBOX")
  if status != "OK":
    print("Error connecting to IMAP server")
    exit
  return messages


def get_mailbox():
  imap = imaplib.IMAP4_SSL("outlook.office365.com")
  imap.login(username, password)
  return imap


def is_sender_authorised(sender):
  return sender.lower() == 'philtownes1@gmail.com'


def is_youtube_url(candidate_string):
  return True if youtube_regex.match(candidate_string) else False
    

mailbox = get_mailbox()
emails = fetch_emails()
countEmails = int(emails[0])


for i in range(countEmails, 0, -1):
  res,msg = mailbox.fetch(str(i), "(RFC822)")
 
  for response in msg:
    if isinstance(response, tuple):
      msg = email.message_from_bytes(response[1]) 
      subject,sender = obtain_header(msg)
      if is_youtube_url(subject):
        print("MATCH")
        if run_downloader(subject):
          print("DELETE")
          mailbox.store(str(i), '+FLAGS', '\\Deleted')

      else:
        print("MISS")
      
      print("-" * 100)

# Delete messages flagged for deletion, close & logout from mailbox
mailbox.expunge()
mailbox.close()
mailbox.logout()
