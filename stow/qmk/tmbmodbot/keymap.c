/* Copyright 2023 @ Keychron (https://www.keychron.com)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#include QMK_KEYBOARD_H

enum layers{
    MAC_BASE,
    MAC_FN,
    WIN_BASE,
    WIN_FN,
};

enum custom_keycodes {
    BRW_UP,
    BRW_DN,
    TMUX_L,
    TMUX_R,
    SC_SHOT,
    TRM_PST,
};

// default
#define KC_TASK LGUI(KC_TAB)
#define KC_FLXP LGUI(KC_E)

// Hypr or ESC

#define HY_ESC HYPR_T(KC_ESC)

// Left-hand home row mods
#define HOME_Z LGUI_T(KC_Z)
#define HOME_X LALT_T(KC_X)
#define HOME_C LCTL_T(KC_C)
#define HOME_V LSFT_T(KC_V)

// Right-hand home row mods
#define HOME_M RSFT_T(KC_M)
#define HOME_CM RCTL_T(KC_COMM)
#define HOME_DT LALT_T(KC_DOT)
#define HOME_SL RGUI_T(KC_SLSH)

// Additional keycodes
#define SFT_BK RSFT_T(KC_BSPC)

/**/
/*uint16_t get_quick_tap_term(uint16_t keycode, keyrecord_t *record) {*/
/*    switch (keycode) {*/
/*        case HOME_J:*/
/*            return QUICK_TAP_TERM + 50;*/
/*        case HOME_K:*/
/*            return QUICK_TAP_TERM + 50;*/
/*        case HOME_L:*/
/*            return QUICK_TAP_TERM + 50;*/
/*        default:*/
/*            return QUICK_TAP_TERM;*/
/*    }*/
/*}*/

bool get_hold_on_other_key_press(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case LT(1, HY_ESC):
            // Immediately select the hold action when another key is pressed.
            return true;
        default:
            // Do not select the hold action when another key is pressed.
            return false;
    }
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
    case BRW_UP:
        if (record->event.pressed) {
           SEND_STRING(SS_LCTL(SS_TAP(X_PGUP)));
        } else {
        }
        break;

    case BRW_DN:
        if (record->event.pressed) {
           SEND_STRING(SS_LCTL(SS_TAP(X_PGDN)));
        } else {
        }
        break;
    case TMUX_L:
        if (record->event.pressed) {
            // when keycode QMKURL is pressed
        SEND_STRING(SS_LCTL("x") SS_DELAY(1) SS_LSFT("("));
        } else {
            // when keycode QMKURL is released
        }
        break;
    case TMUX_R:
        if (record->event.pressed) {
        SEND_STRING(SS_LCTL("x") SS_DELAY(1) SS_LSFT(")"));
        }
        break;
    /*case SC_SHOT:*/
    /*    if (record->event.pressed) {*/
    /*    SEND_STRING(SS_LCTL("4")  SS_DOWN(R_SFT()) SS_DOWN(R_GUI()));*/
    /*    }*/
    /*    break;*/
    }
    return true;
};

/*const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {*/
/*    [0] = {*/
/*        {MY_CUSTOM_MACRO, MY_OTHER_MACRO},*/
/*        // ...*/
/*    },*/
/*};*/

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [MAC_BASE] = LAYOUT_91_ansi(
        KC_MUTE,  KC_ESC,   KC_BRID,  KC_BRIU,  KC_MCTL,  KC_LPAD,  RM_VALD,   RM_VALU,  KC_MPRV,  KC_MPLY,  KC_MNXT,  KC_MUTE,  KC_VOLD,    KC_VOLU,  KC_INS,   KC_DEL,   KC_MUTE,
        BRW_UP,   KC_GRV,   KC_1,     KC_2,     KC_3,     KC_4,     KC_5,      KC_6,     KC_7,     KC_8,     KC_9,     KC_0,     KC_MINS,    KC_EQL,   KC_BSPC,            KC_PGUP,
        BRW_DN,   KC_TAB,   KC_Q,     KC_W,     KC_E,     KC_R,     KC_T,      KC_Y,     KC_U,     KC_I,     KC_O,     KC_P,     KC_LBRC,    KC_RBRC,  KC_BSLS,            KC_PGDN,
        _______,  HY_ESC,   KC_A,     KC_S,     KC_D,     KC_F,     KC_G,      KC_H,     KC_J,     KC_K,     KC_L,     KC_SCLN,  KC_QUOT,              KC_ENT,             KC_HOME,
        _______,  KC_LSFT,            HOME_Z,   HOME_X,   HOME_C,   HOME_V,    KC_B,     KC_N,     HOME_M,   HOME_CM,  HOME_DT,  HOME_SL,              SFT_BK,   KC_UP,
        _______,  KC_LCTL,  KC_LOPT,  KC_LCMD,  MO(MAC_FN),         KC_SPC,                        KC_SPC,             KC_RCMD,  MO(MAC_FN), KC_RCTL,  KC_LEFT,  KC_DOWN,  KC_RGHT),

    [MAC_FN] = LAYOUT_91_ansi(
        RM_TOGG,  _______,  KC_F1,    KC_F2,    KC_F3,    KC_F4,    KC_F5,     KC_F6,    KC_F7,    KC_F8,    KC_F9,    KC_F10,   KC_F11,     KC_F12,   _______,  _______,  RM_TOGG,
        TMUX_L,   _______,  _______,  _______,  _______,  _______,  _______,   _______,  _______,  _______,  _______,  _______,  _______,    _______,  _______,            _______,
        TMUX_R,   RM_TOGG,  RM_NEXT,  RM_VALU,  RM_HUEU,  RM_SATU,  RM_SPDU,   _______,  _______,  _______,  _______,  _______,  _______,    _______,  _______,            _______,
        _______,  _______,  RM_PREV,  RM_VALD,  RM_HUED,  RM_SATD,  RM_SPDD,   _______,  _______,  _______,  _______,  _______,  _______,              _______,            _______,
        _______,  _______,            _______,  _______,  _______,  _______,   _______,  NK_TOGG,  _______,  _______,  _______,  _______,              _______,  _______,
        _______,  _______,  _______,  _______,  _______,            _______,                       _______,            _______,  _______,    _______,  _______,  _______,  _______),

    [WIN_BASE] = LAYOUT_91_ansi(
        KC_MUTE,  KC_ESC,   KC_F1,    KC_F2,    KC_F3,    KC_F4,    KC_F5,     KC_F6,    KC_F7,    KC_F8,    KC_F9,    KC_F10,   KC_F11,     KC_F12,   KC_INS,   KC_DEL,   KC_MUTE,
        _______,  KC_GRV,   KC_1,     KC_2,     KC_3,     KC_4,     KC_5,      KC_6,     KC_7,     KC_8,     KC_9,     KC_0,     KC_MINS,    KC_EQL,   KC_BSPC,            KC_PGUP,
        _______,  KC_TAB,   KC_Q,     KC_W,     KC_E,     KC_R,     KC_T,      KC_Y,     KC_U,     KC_I,     KC_O,     KC_P,     KC_LBRC,    KC_RBRC,  KC_BSLS,            KC_PGDN,
        _______,  KC_CAPS,  KC_A,     KC_S,     KC_D,     KC_F,     KC_G,      KC_H,     KC_J,     KC_K,     KC_L,     KC_SCLN,  KC_QUOT,              KC_ENT,             KC_HOME,
        _______,  KC_LSFT,            KC_Z,     KC_X,     KC_C,     KC_V,      KC_B,     KC_N,     KC_M,     KC_COMM,  KC_DOT,   KC_SLSH,              KC_RSFT,  KC_UP,
        _______,  KC_LCTL,  KC_LWIN,  KC_LALT,  MO(WIN_FN),         KC_SPC,                        KC_SPC,             KC_RALT,  MO(WIN_FN), KC_RCTL,  KC_LEFT,  KC_DOWN,  KC_RGHT),

    [WIN_FN] = LAYOUT_91_ansi(
        RM_TOGG,  _______,  KC_BRID,  KC_BRIU,  KC_TASK,  KC_FLXP,  RM_VALD,   RM_VALU,  KC_MPRV,  KC_MPLY,  KC_MNXT,  KC_MUTE,  KC_VOLD,    KC_VOLU,  _______,  _______,  RM_TOGG,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,   _______,  _______,  _______,  _______,  _______,  _______,    _______,  _______,            _______,
        _______,  RM_TOGG,  RM_NEXT,  RM_VALU,  RM_HUEU,  RM_SATU,  RM_SPDU,   _______,  _______,  _______,  _______,  _______,  _______,    _______,  _______,            _______,
        _______,  _______,  RM_PREV,  RM_VALD,  RM_HUED,  RM_SATD,  RM_SPDD,   _______,  _______,  _______,  _______,  _______,  _______,              _______,            _______,
        _______,  _______,            _______,  _______,  _______,  _______,   _______,  NK_TOGG,  _______,  _______,  _______,  _______,              _______,  _______,
        _______,  _______,  _______,  _______,  _______,            _______,                       _______,            _______,  _______,    _______,  _______,  _______,  _______),
};

#if defined(ENCODER_MAP_ENABLE)
const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][NUM_DIRECTIONS] = {
    [MAC_BASE] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_VOLD, KC_VOLU) },
    [MAC_FN]   = { ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(RM_VALD, RM_VALU) },
    [WIN_BASE] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_VOLD, KC_VOLU) },
    [WIN_FN]   = { ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(RM_VALD, RM_VALU) }
};
#endif // ENCODER_MAP_ENABLE
