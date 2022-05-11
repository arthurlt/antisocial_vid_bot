import os
import telebot

if not 'BOT_TOKEN' in os.environ:
	print('BOT_TOKEN environment variable not set, exiting...')
	quit()
else:
	bot = telebot.TeleBot(os.environ['BOT_TOKEN'])

if 'CUSTOM_BIBLIOGRAM' in os.environ:
	bibliogramInstance = os.environ['CUSTOM_BIBLIOGRAM']
else:
	bibliogramInstance = None

@bot.message_handler(func=lambda message: True)
def echo_all(message):
	bot.reply_to(message, message.text)

bot.infinity_polling()