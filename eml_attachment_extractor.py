from os.path import expanduser
import os, sys
import email

BASE_DIR = os.getcwd()

def extractor(eml_file=False, save=False):
        if eml_file:
                msg = email.message_from_file(open(eml_file))
                numOfAttachments = len(msg.get_payload())
                if numOfAttachments == 2:
                        attachment = msg.get_payload()[1]
                attachment_name = attachment.get_filename()
                if save:
                        with open(BASE_DIR + '/' + attachment_name, 'wb') as f:
                                f.write(attachment.get_payload(decode=True))
                else:
                        return attachment_name, attachment.get_payload(decode=True)
        else:
                print("Please specify file name")

if __name__ == '__main__':
        '''This function can be used as a standalone extractor or can be imported for use in another script.'''
        eml_file = input('Please enter filename\n>>> ')
        attachment_name, attachment = extractor(eml_file)
        print(attachment_name)
