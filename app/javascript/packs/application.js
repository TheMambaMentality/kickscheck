// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

// jQuery の読み込み
import $ from "jquery";
window.$ = window.jQuery = $; // jQuery をグローバル変数に設定

// rails-ujs の有効化
Rails.start();
Turbolinks.start();
ActiveStorage.start();

// Bootstrap を使うなら（使わないならこの行は不要）
import "bootstrap";