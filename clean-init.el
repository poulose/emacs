(setq inhibit-startup-message t)

;; (setenv LANG en_US.ISO_8859-1) ;; set english with Umlaut support - Latin-1

;; Use UTF-8 istead of ISO-8859-1
(prefer-coding-system 'utf-8)  
(set-language-environment "UTF-8")

(scroll-bar-mode -1) ;; hide scrollbar
(tool-bar-mode -1) ;; tool bar scrollbar
;;(tooltip-bar-mode -1) ;; tooltip scrollbar
(tooltip-hide) ;; alt for above
(set-fringe-mode 10) ;; set fringe scrollbar
(menu-bar-mode -1) ;; menu scrollbar

(setq visible-bell t) ;; No alerting


;;(load-theme 'tango-dark)
(load-theme 'wombat)


;; Make ESC quit prompts
;;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)

;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(package-list-packages)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
;;(package-list-packages)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-linux platform

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)


(dolist (modes '( org-mode-hook
             		 term-mode-hook
			 eshell-mode-hook
			 shell-mode-hook))
  (add-hook modes (lambda () (display-line-numbers-mode 0))))
;; evaluate available variable - eval prompt - Shift+ Meta+ : and type the variable

(use-package command-log-mode)

(use-package ivy
  
;; :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))

(use-package rainbow-delimiters
  :hook ( prog-mode . rainbow-delimiters-mode)
  )

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
(setq which-key-idle-delay 1))

(use-package counsel
  :after ivy
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  councsel-mode 1))

(use-package ivy-rich
  :afer (ivy counsel)
  :init (ivy-rich-mode 1))



;; load REPL - sbcl
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;; load org roam
(use-package org-roam
  :ensure t
  :init
  (setq org-mode-v2-ack t)
  :custom
  ;;FIX 16/06/2024: created orginal folder to notesRoam and backup in notesRoam_bkp for git backup
  (org-roam-directory "/Users/admin/code/src/github/reponame/notesRoam")
 
  ;; Attempt Rebuild with new copied folder directory - issues seems like temporary filesx
  ;;(org-roam-directory "/Users/admin/code/src/github/reponame/notesRoam")
  ;; Original directory directory with errors due to space or carriage return in folder name
  ;; (org-roam-directory "/Users/admin/code/src/github/reponame/notesRoam$'\n'")
  ;; Created directory with an invalid space, but works fine

  ;; ignore temp files - next attempt to remove errors in DB build
  (setq org-roam-file-exclude-regexp "\\(?:[#%&]\\|\\.~\\|\\.bak\\|\\.tmp\\|\\.elc\\|\\.gz\\|\\.zip\\)$")  

  (org-roam-completion_everywhere: t)
  :bind(("C-c n l" . org-roam-buffer-toggle)
	("C-c n f" . org-roam-node-find)
	("C-c n i" . org-roam-node-insert)
	("C-c n g" . org-roam-graph)
	("C-c n c" . org-roam-capture)	
	:map org-mode-map
	("C-M-i" . completion-at-point))
  :config
  (org-roam-setup))
;; Line truncation / wrap
(add-hook 'org-mode-hook
      (lambda ()
        (toggle-truncate-lines nil) ))
