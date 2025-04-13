#include QMK_KEYBOARD_H

enum dasbob_layers { _QWERTY, _LOWER, _RAISE };

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

    [_QWERTY] = LAYOUT_split_3x5_3(
        KC_Q,       KC_W,       KC_E,       KC_R,       KC_T,           KC_Y,       KC_U,       KC_I,       KC_O,       KC_P,

        LCTL_T(KC_A),   LALT_T(KC_S),       LSFT_T(KC_D),       LGUI_T(KC_F),       KC_G,
        KC_H,           LGUI_T(KC_J),       LSFT_T(KC_K),       LALT_T(KC_L),       LCTL_T(KC_SCLN),

        KC_Z,       KC_X,       KC_C,       KC_V,       KC_B,           KC_N,       KC_M,       KC_COMM,    KC_DOT,     KC_SLSH,

                                KC_DEL,     LT(1, KC_BSPC),     _______,        KC_ENTER,     LT(2, KC_SPC),      KC_CAPS
    ),

    [_LOWER] = LAYOUT_split_3x5_3(
        KC_1,           KC_2,       KC_3,       KC_4,       KC_5,           KC_6,       KC_7,       KC_8,       KC_9,           KC_0,
        KC_TAB,         _______,    _______,    _______,    _______,        LGUI_T(KC_LEFT),    LSFT_T(KC_DOWN),    LALT_T(KC_UP),      LCTL_T(KC_RIGHT),       KC_EQUAL,
        LSFT(KC_TAB),   KC_BRIGHTNESS_DOWN,    KC_BRIGHTNESS_UP,    KC_KB_VOLUME_DOWN,    KC_KB_VOLUME_UP,        _______,    _______,    KC_QUOTE,   KC_NONUS_HASH,  KC_MINUS,

                                    _______,    _______,    _______,        KC_UNDERSCORE,    _______,    _______
    ),

    [_RAISE] = LAYOUT_split_3x5_3(
        KC_F1,      KC_F2,      KC_F3,      KC_F4,      KC_F5,          KC_F6,      KC_F7,      KC_F8,      KC_F9,      KC_F10,
        LCTL_T(KC_TAB),     LALT_T(KC_LBRC),    LSFT_T(KC_RBRC),    _______,    _______,        _______,    _______,    _______,    KC_F11,     KC_F12,
        KC_NONUS_BACKSLASH,    _______,    _______,    _______,    _______,        _______,    _______,    _______,    _______,    _______,

                                _______,    _______,     CW_TOGG,        _______,    _______,    _______
    ),
};
