#include "sys.h"
#include "keyboard.h"
#include "scancodes.h"

int keyboard_scancodes(int key)
{
  if (_capslock || _shift)
    if (key >= 'a' && key <= 'z')
      key -= 32;

  if (_capslock && _shift)
    if (key >= 'A' && key <= 'Z')
      key += 32;

		if (_shift)
			{
				if (key >= '0' && key <= '9')
				switch (key)
        {

					case '0':
						key = KEY_RIGHTPARENTHESIS;
						break;
					case '1':
						key = KEY_EXCLAMATION;
						break;
					case '2':
						key = KEY_AT;
						break;
					case '3':
						key = KEY_HASH;
						break;
					case '4':
						key = KEY_DOLLAR;
						break;
					case '5':
						key = KEY_PERCENT;
						break;
					case '6':
						key = KEY_CARRET;
						break;
					case '7':
						key = KEY_AMPERSAND;
						break;
					case '8':
						key = KEY_ASTERISK;
						break;
					case '9':
						key = KEY_LEFTPARENTHESIS;
						break;
				}
			else
      {

				switch (key) {
					case KEY_COMMA:
						key = KEY_LESS;
						break;

					case KEY_DOT:
						key = KEY_GREATER;
						break;

					case KEY_SLASH:
						key = KEY_QUESTION;
						break;

					case KEY_SEMICOLON:
						key = KEY_COLON;
						break;

					case KEY_QUOTE:
						key = KEY_QUOTEDOUBLE;
						break;

					case KEY_LEFTBRACKET :
						key = KEY_LEFTCURL;
						break;

					case KEY_RIGHTBRACKET :
						key = KEY_RIGHTCURL;
						break;

					case KEY_GRAVE:
						key = KEY_TILDE;
						break;

					case KEY_MINUS:
						key = KEY_UNDERSCORE;
						break;

					case KEY_EQUAL:
						key = KEY_PLUS;
						break;

					case KEY_BACKSLASH:
						key = KEY_BAR;
						break;
          case KEY_RETURN:
            key = '\n';
            break;
				}
			}
		}
    return key;
}
/* Handles the keyboard interrupt */
extern void keyboardInterrupt_handler();

void keyboard_init()
{
  kkybrd_set_leds(1,1,1);
  scancodes=Main_key_codes;
}
