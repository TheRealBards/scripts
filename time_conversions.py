from datetime import datetime

class time_conversions:
	@staticmethod
	def date_in_seconds(date):
		try:
			return int(datetime.strptime(date, '%d/%m/%Y').strftime('%s'))
		except:
			print('-- Please enter date in dd/mm/yyyy format --')
			return 0
	@staticmethod
	def time_to_date(time):
		try:
			return datetime.fromtimestamp(time).strftime("%A, %B, %d, %Y")
		except:
			print('-- Please enter time in seconds --')
			return 0
