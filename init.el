
;; *************** MISC ****************

;; Escape will now also quit as C-g does
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)





;; *************** PACKAGE / CODE MANAGEMENT ****************

;; Install MELPA repository along with default ELPA repo.
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

;; Added by Package.el. This must come before configurations of
;; installed packages. Don't delete this line.
(package-initialize)

;; Refresh package repository information (fetch the package list and their respective versions)
(unless package-archive-contents (package-refresh-contents))

;; Install use-package package if not already installed (https://github.com/jwiegley/use-package)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; load use-package package
(require 'use-package)

;; tell use-package to always install not yet installed packages when
;; such a package appears
(setq use-package-always-ensure t)





;; *************** APPEARANCE ****************

;; Load the IDEA like theme from themes folder (https://github.com/ianyepan/jetbrains-darcula-emacs-theme)
(use-package jetbrains-darcula-theme
  :config
  (load-theme 'jetbrains-darcula t))

;; Dont show ugly start page - will start in scratch buffer
(setq inhibit-startup-message t)

;; Disable menu bar
(menu-bar-mode -1)

;; Disable scroll bar
(scroll-bar-mode -1)

;; Disable tool bar
(tool-bar-mode -1)

;; Adds a thin border left and right
(set-fringe-mode 20)

;; Enable visual bell - highlights events with a flinkering on the frames top and bottom
(setq visible-bell t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; set font size - well my eyes are not the best :)
(set-face-attribute 'default nil :height 150)

;; install doom-modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; show also minor modes in doom-modeline
(setq doom-modeline-minor-modes t)

;; NOTE: requires one time: M-x all-the-icons-install-fonts
;; (https://github.com/domtronn/all-the-icons.el#installation)
(use-package all-the-icons
  :ensure t)


;; ************ ORG MODE ***************

;; Agenda view configuration
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/userdata/todo/todo.org")))
 '(package-selected-packages
   (quote
    (doom-modeline ivy jetbrains-darcula-theme use-package))))

;; org-mode keybindings
(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)


;; PlantUML config
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))

;; platuml jar for plantuml package
(setq org-plantuml-jar-path
      (expand-file-name "/opt/plantuml/plantuml.jar"))

;; configure org-bullets package
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; org-mode custom colours (faces) for todo item states
(setq org-todo-keyword-faces
      '(("ROUTINE" . "choclate4")
	("IDEA" . "khaki4")
	("INBOX" . "dim gray")
	("SCHEDULED" . "deep sky blue")
	("LATER" . "darkOrchid3")
	("DOING" . "yellow")
	("BLOCKED" . "red")
	("WAITING" . "orange")
	("DONE" . "green")
	("NEXT" .  "cornflower blue")))





;;  ************ Convenience things ***************

;; Install Ivy autocompletion package
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))
