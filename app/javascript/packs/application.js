import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import "../../channels/application_cable/channel"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "../css/application.scss";

import $ from "jquery";
global.$ = jQuery;

import "bootstrap"