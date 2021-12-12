(setq inhibit-startup-message t)

(scroll-bar-mode -1) ;; hide scrollbar
(tool-bar-mode -1) ;; tool bar scrollbar
;;(tooltip-bar-mode -1) ;; tooltip scrollbar
(set-fringe-mode 10) ;; set fringe scrollbar
(menu-bar-mode -1) ;; menu scrollbar

(setq visible-bell t) ;; No alerting

(set-face-attribute 'default nil :font "Klarna Text Mono" :height 150) ;; The font is only available on the Office laptop, desktop create a fallback

(load-theme 'tango-dark)

;; Initialize package sources
(require 'package)
(add-to-list 'package-archives '("melpa" . "MELPA") t)
(package-list-packages)

(setq package-archives '(("melpa" . "MELPA")
 ("org" . "Index of /elpa/")
 ("elpa" . "GNU ELPA Packages")))

(package-initialize)
(unless package-archive-contents
(package-refresh-contents))

;; Initialize use-package on non-linux platform

;;(unless (package-installed-p 'use-package)
;;(package-install 'use-package))

