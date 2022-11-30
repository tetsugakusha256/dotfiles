#include QMK_KEYBOARD_H

enum layer_names {
    _QWERTY,
    _NUMBER,
    _RAISE,
    _ADJUST
};

enum custom_keycodes {
  QWERTY = SAFE_RANGE,
  NUMBER,
  RAISE,
  ADJUST,
};

#define EISU LALT(KC_GRV)


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  /* Qwerty
   * ,----------------------------------------------------------------------------------------------------------------------.
   * | ESC  |   1  |   2  |   3  |   4  |   5  |   [  |                    |   ]  |   6  |   7  |   8  |   9  |   0  |Pscree|
   * |------+------+------+------+------+------+------+--------------------+------+------+------+------+------+------+------|
   * |  `   |   Q  |   W  |   E  |   R  |   T  |   -  |                    |   =  |   Y  |   U  |   I  |   O  |   P  |  \   |
   * |------+------+------+------+------+------+------+--------------------+------+------+------+------+------+------+------|
   * | Tab  |   A  |   S  |   D  |   F  |   G  |  Del |                    | Bksp |   H  |   J  |   K  |   L  |   ;  |  "   |
   * |------+------+------+------+------+------+---------------------------+------+------+------+------+------+------+------|
   * | Shift|   Z  |   X  |   C  |   V  |   B  | Space|                    | Enter|   N  |   M  |   ,  |   .  |   /  | Shift|
   * |-------------+------+------+------+------+------+------+------+------+------+------+------+------+------+-------------|
   * | Ctrl |  GUI |  ALt | EISU |||||||| Lower| Space|  Del |||||||| Bksp | Enter| Raise|||||||| Left | Down |  Up  | Right|
   * ,----------------------------------------------------------------------------------------------------------------------.
   */
  [_QWERTY] = LAYOUT(
    KC_ESC,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_LBRC,                           KC_RBRC,     KC_6,     KC_7,   KC_8,    KC_9,    KC_0,    KC_BSPC,
    KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_MINS,                           KC_EQL ,     KC_Y,     KC_U,   KC_I,    KC_O,    KC_P,    KC_BSPC,
    CTL_T(KC_ESC), KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_DEL ,                           KC_QUOT,     KC_H,     KC_J,   KC_K,    KC_L,    KC_SCLN,    KC_BSPC,
    KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    LGUI(KC_5) ,                       LGUI(KC_6) , KC_N,     KC_M,   KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT,
    KC_LCTL, KC_MEH, KC_LGUI,   KC_LALT,              NUMBER, RAISE ,KC_ENT,                 KC_QUOT,     KC_ENT,   KC_SPC, LT(1,KC_SPC), RAISE, KC_RALT,   KC_ENT
  ),

  /* Lower
   * ,----------------------------------------------------------------------------------------------------------------------.
   * |  F11 |  F1  |  F2  |  F3  |  F4  |  F5  |   \  |                    |   |  |  F6  |  F7  |  F8  |  F9  |  F10 |  F12 |
   * |------+------+------+------+------+------+------+--------------------+------+------+------+------+------+------+------|
   * |  ~   |   +  |   /  |   *  |   -  |   +  |   =  |                    |   &  |   #  |   {  |   }  |   <  |   >  |  %   |
   * |------+------+------+------+------+------+------+--------------------+------+------+------+------+------+------+------|
   * | Tab  |   1  |   2  |   3  |   4  |   5  |  Del |                    | Bksp |   $  |   (  |   )  |   ?  |   !  |  "   |
   * |------+------+------+------+------+------+---------------------------+------+------+------+------+------+------+------|
   * | Shift|   6  |   7  |   8  |   9  |   0  | Space|                    | Enter|   @  |   [  |   ]  |   ~  |   _  | Shift|
   * |-------------+------+------+------+------+------+------+------+------+------+------+------+------+------+-------------|
   * | Ctrl |  GUI |  ALt | EISU |||||||| Lower| Space|  Del |||||||| Bksp | Enter| Raise|||||||| Home |PageDn|PageUp|  End |
   * ,----------------------------------------------------------------------------------------------------------------------.
   */
  [_NUMBER] = LAYOUT(
    KC_F11,  KC_F1,   KC_F2,   KC_F3,   KC_F4,    KC_F5,   KC_BSLS,                        KC_PIPE, KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10, KC_F12,
    _______, KC_PPLS, KC_PSLS, KC_PAST, KC_PMNS,  KC_PPLS, KC_PEQL,                        KC_AMPR, KC_PERC, KC_COLN, KC_LCBR, KC_RCBR, KC_GT, KC_HASH,
    _______, KC_1,    KC_2,    KC_3,    KC_4,     KC_5,    KC_PDOT,                        KC_CIRC, KC_EXLM, KC_QUES, KC_LPRN, KC_RPRN, KC_DLR,_______,
    _______, KC_6,    KC_7,    KC_8,    KC_9,     KC_0,    _______ ,                       _______, KC_AT,   KC_TILD, KC_LBRC, KC_RBRC, KC_UNDS,_______,
    _______, _______, _______,    _______,      EISU,   _______ ,_______,          _______,_______, _______,           EISU, _______, _______, _______
  ),

  /* Raise
   * ,----------------------------------------------------------------------------------------------------------------------.
   * |  F11 |  F1  |  F2  |  F3  |  F4  |  F5  |   {  |                    |   }  |  F6  |  F7  |  F8  |  F9  |  F10 |  F12 |
   * |------+------+------+------+------+------+------+--------------------+------+------+------+------+------+------+------|
   * |  ~   |   !  |   @  |   #  |   $  |   %  |   _  |                    |   +  |   ^  |   &  |   *  |   (  |   )  |  |   |
   * |------+------+------+------+------+------+------+--------------------+------+------+------+------+------+------+------|
   * | Tab  |   1  |   2  |   3  |   4  |   5  |  Del |                    | Bksp |   H  |   J  |   K  |   L  |   :  |  "   |
   * |------+------+------+------+------+------+---------------------------+------+------+------+------+------+------+------|
   * | Shift|   6  |   7  |   8  |   9  |   0  | Space|                    | Enter|   N  |   M  |   <  |   >  |   ?  | Shift|
   * |-------------+------+------+------+------+------+------+------+------+------+------+------+------+------+-------------|
   * | Ctrl |  GUI |  ALt | EISU |||||||| Lower| Space|  Del |||||||| Bksp | Enter| Raise|||||||| Home |PageDn|PageUp|  End |
   * ,----------------------------------------------------------------------------------------------------------------------.
   */
  [_RAISE] = LAYOUT(
    _______, _______, _______,  _______, _______,  _______, _______,                        _______, _______,   KC_KB_VOLUME_DOWN,   KC_KB_VOLUME_UP,   KC_KB_MUTE,   _______,  _______,
    _______, KC_BTN1, _______,  _______, KC_PASTE,  _______, _______,                        _______, _______, KC_PGDN, KC_PGUP, _______, _______, _______,
    _______, _______, _______,  _______, _______,  _______, _______,                       _______, KC_LEFT,    KC_DOWN,    KC_UP,    KC_RIGHT,    _______, _______ ,
    _______, _______, KC_CUT,  KC_COPY, _______,  _______, _______,                       _______, _______,    KC_WH_D,    KC_WH_U,    _______,   _______, _______,
    _______, _______, _______,  _______,           _______, _______,_______,         _______,_______ , _______,            _______, _______, _______, _______
  ),

  /* Adjust
   * ,----------------------------------------------------------------------------------------------------------------------.
   * |      |      |      |      |      |      |      |                    |      |      |      |      |      |      |      |
   * |------+------+------+------+------+------+---------------------------+------+------+------+------+------+------+------|
   * |      | Reset|RGB ON|  MODE|  HUE-|  HUE+|      |                    |      |  SAT-|  SAT+|  VAL-|  VAL+|      |      |
   * |------+------+------+------+------+------+---------------------------+------+------+------+------+------+------+------|
   * |      |      | BL ON|  BRTG|  INC|   DEC|      |                    |      |      |      |      |      |      |      |
   * |------+------+------+------+------+------+---------------------------+------+------+------+------+------+------+------|
   * |      |      |      |      |      |      |      |                    |      |      |      |      |      |      |      |
   * |-------------+------+------+------+------+------+------+------+------+------+------+------+------+------+-------------|
   * |      |      |      |      ||||||||      |      |      ||||||||      |      |      ||||||||      |      |      |      |
   * ,----------------------------------------------------------------------------------------------------------------------.
   */
  [_ADJUST] = LAYOUT(
    _______, _______, _______, _______, _______, _______,_______,                       _______, _______, _______, _______, _______, _______, _______,
    _______, QK_BOOT  , RGB_TOG, RGB_MOD, RGB_HUD, RGB_HUI,_______,                       _______, RGB_SAD, RGB_SAI, RGB_VAD, RGB_VAI, _______, _______,
    _______, _______, BL_TOGG, BL_BRTG, BL_INC , BL_DEC ,_______,                       _______, _______, _______, _______, _______, _______, _______,
    _______, _______, _______, _______, _______, _______,_______,                       _______, _______, _______, _______, _______, _______, _______,
    _______, _______, _______, _______,          _______,_______,_______,       _______,_______, _______,          _______, _______, _______, _______
  )
};

#ifdef AUDIO_ENABLE
float tone_qwerty[][2]     = SONG(QWERTY_SOUND);
#endif

void persistent_default_layer_set(uint16_t default_layer) {
  eeconfig_update_default_layer(default_layer);
  default_layer_set(default_layer);
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case QWERTY:
      if (record->event.pressed) {
         print("mode just switched to qwerty and this is a huge string\n");
        set_single_persistent_default_layer(_QWERTY);
      }
      return false;
      break;
    case NUMBER:
      if (record->event.pressed) {
        layer_on(_NUMBER);
        update_tri_layer(_NUMBER, _RAISE, _ADJUST);
      } else {
        layer_off(_NUMBER);
        update_tri_layer(_NUMBER, _RAISE, _ADJUST);
      }
      return false;
      break;
    case RAISE:
      if (record->event.pressed) {
        layer_on(_RAISE);
        update_tri_layer(_NUMBER, _RAISE, _ADJUST);
      } else {
        layer_off(_RAISE);
        update_tri_layer(_NUMBER, _RAISE, _ADJUST);
      }
      return false;
      break;
    case ADJUST:
      if (record->event.pressed) {
        layer_on(_ADJUST);
      } else {
        layer_off(_ADJUST);
      }
      return false;
      break;
  }
  return true;
}
// Redefining CAPS_WORDS to add "o" (KC_SCLN) in colemak to the list of key that doesn't cancel the mode
bool caps_word_press_user(uint16_t keycode) {
    switch (keycode) {
        // Keycodes that continue Caps Word, with shift applied.
        case KC_A ... KC_Z:
        case KC_SCLN:
        case KC_MINS:
            add_weak_mods(MOD_BIT(KC_LSFT));  // Apply shift to next key.
            return true;

        // Keycodes that continue Caps Word, without shifting.
        case KC_1 ... KC_0:
        case KC_BSPC:
        case KC_DEL:
        case KC_UNDS:
            return true;

        default:
            return false;  // Deactivate Caps Word.
    }
}

