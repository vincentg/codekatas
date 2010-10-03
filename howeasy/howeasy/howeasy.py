class HowEasy:
	
	def point_val(self, problem_statement):
		tokens = problem_statement.split(' ')
		valid_words, total_letters = 0, 0
		for token in tokens:
			if not self.__word(token):
				continue
			else:
				valid_words += 1
				total_letters += self.__get_number_of_letters(token)
		return self.__get_difficulty(total_letters, valid_words)
	
	def __get_difficulty(self, total_letters, valid_words):
		average_word_length = total_letters / valid_words if valid_words != 0 else 0
		if average_word_length <= 3:
			return 250
		elif average_word_length == 4 or average_word_length == 5:
			return 500
		else:
			return 1000
	
	def __get_number_of_letters(self, word):
		if len(word) > 0 and word[-1] == '.':
			return len(word)-1
		else:
			return len(word)
	
	def __word(self, token):
		token_length = len(token)
		for i in xrange(0, token_length):
			if i == token_length and token[i] == token[-1]:
				return True	# nothing lef to validate
			elif not token[i].isalpha():
				return False
		return True