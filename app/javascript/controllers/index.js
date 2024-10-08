// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"
import Notification from "@stimulus-components/notification"
import Dropdown from "@stimulus-components/dropdown"

application.register('notification', Notification)
application.register('dropdown', Dropdown)

import DebounceController from "./debounce_controller"
application.register("debounce", DebounceController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MarkdownController from "./markdown_controller"
application.register("markdown", MarkdownController)

import MarkdownUploadController from "./markdown_upload_controller"
application.register("markdown-upload", MarkdownUploadController)

import SidebarController from "./sidebar_controller"
application.register("sidebar", SidebarController)
