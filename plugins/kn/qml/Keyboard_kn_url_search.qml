/*
 * Copyright 2013 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4

import MaliitKeyboard 2.0

import keys 1.0

KeyPad {
    anchors.fill: parent

    content: c1
    symbols: "languages/Keyboard_symbols.qml"

    Column {
        id: c1
        anchors.fill: parent

        spacing: 0

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { label: "ಾ"; extended: ["ಅ", "ಆ", "೧"]; extendedShifted: ["ಅ", "ಆ", "೧"]; leftSide: true; }
            CharKey { label: "ಿ"; shifted: "ೀ"; extended: ["ಇ", "ಈ" "೨"]; extendedShifted: ["ಇ", "ಈ" "೨"] }
            CharKey { label: "ು"; shifted: "ೂ"; extended: ["ಉ", "ಊ", "೩"]; extendedShifted: ["ಉ", "ಊ", "೩"] }
            CharKey { label: "ೃ"; extended: ["ಋ", "೪"]; extendedShifted: ["ಋ", "೪"] }
            CharKey { label: "ೆ"; shifted: "ೇ"; extended: ["ಎ", "ಏ", "೫"]; extendedShifted: ["ಎ", "ಏ", "೫"] }
            CharKey { label: "ೈ"; extended: ["ಐ", "೬"]; extendedShifted: ["ಐ", "೬"] }
            CharKey { label: "ೊ"; shifted: "ೋ"; extended: ["ಒ", "ಓ", "೭"]; extendedShifted: ["ಒ", "ಓ", "೭"] }
            CharKey { label: "ೌ"; extended: ["ಔ", "೮"]; extendedShifted: ["ಔ", "೮"] }
            CharKey { label: "ಂ"; extended: ["೯"]; extendedShifted: ["೯"] }
            CharKey { label: "ಃ"; extended: ["೦"]; extendedShifted: ["೦"]; rightSide: true; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { label: "ಕ"; shifted: "ಯ"; extended: ["ಖ"]; leftSide: true; }
            CharKey { label: "ಗ"; shifted: "ರ"; extended: ["ಘ"]; }
            CharKey { label: "ಙ"; extended: ["ಲ"]; }
            CharKey { label: "ಚ"; shifted: "ವ"; extended: ["ಛ"]; }
            CharKey { label: "ಜ"; shifted: "ಶ"; extended: ["ಝ"]; }
            CharKey { label: "ಞ"; extended: ["ಷ"]; }
            CharKey { label: "ಟ"; shifted: "ಸ"; extended: ["ಠ"]; }
            CharKey { label: "ಡ"; shifted: "ಹ"; extended: ["ಢ"]; }
            CharKey { label: "ಣ"; extended: ["ಳ"]; rightSide: true; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            ShiftKey {}
            CharKey { label: "ತ"; shifted: "ಥ"; }
            CharKey { label: "ದ"; shifted: "ಧ"; }
            CharKey { label: "ನ"; }
            CharKey { label: "ಪ"; shifted: "ಫ"; }
            CharKey { label: "ಬ"; shifted: "ಭ"; }
            CharKey { label: "ಮ"; }
            BackspaceKey {}
        }

        Item {
            anchors.left: parent.left
            anchors.right: parent.right

            height: panel.keyHeight + Device.row_margin;

            SymbolShiftKey { id: symShiftKey;                            anchors.left: parent.left; height: parent.height; }
            LanguageKey    { id: languageMenuButton;                     anchors.left: symShiftKey.right; height: parent.height; }
            CharKey        { id: slashKey;    label: "/"; shifted: "/";  anchors.left: languageMenuButton.right; height: parent.height; }
            SpaceKey       { id: spaceKey;                               anchors.left: slashKey.right; anchors.right: urlKey.left; noMagnifier: true; height: parent.height; }
            UrlKey         { id: urlKey; label: ".com"; extended: [".co.uk", ".net", ".org", ".edu", ".gov", ".ac.uk"]; anchors.right: dotKey.left; height: parent.height; }
            CharKey        { id: dotKey;      label: "."; shifted: "."; extended: ["?", "-", "_", "!", "+", "%","#","/"]; extendedShifted: ["?", "-", "_", "!", "+", "%","#","/"]; anchors.right: enterKey.left; height: parent.height; }
            ReturnKey      { id: enterKey;                               anchors.right: parent.right; height: parent.height; }
        }
    } // column
}
