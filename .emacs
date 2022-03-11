;;;;;;;;;;;;;
;; general ;;
;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(setq inhibit-startup-screen t)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(global-auto-revert-mode t)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'default-frame-alist '(background-color . "#232024"))

;; ITERM2 MOUSE SUPPORT
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e)) 
  (setq mouse-sel-mode t)
  )

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)(setq xterm-mouse-mode -1)

;; key bindings
(global-set-key "\C-cc" 'delete-window)
(global-set-key "\C-cg" 'magit)
(global-set-key "\C-cw" 'delete-trailing-whitespace)
(global-set-key "\C-cd" 'dired-sidebar-toggle-sidebar)
(global-set-key "\C-c\C-c" 'comment-or-uncomment-region)
(global-set-key (kbd "C-;") 'other-window)
(global-set-key "\C-ce" 'org-set-effort)
(global-set-key "\C-c\C-f" 'helm-find)
(global-set-key "\C-ct" 'ansi-term)

;; variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-prefix-format
   '((agenda . "%-12t  %-10:c  ")
     (todo . "%10:c %i ")
     (tags . "%-8T %-3e")
     (search . "%-3:e  ")))
 '(org-agenda-remove-tags 'prefix)
 '(org-agenda-sorting-strategy
   '((agenda timestamp-up)
     (todo priority-down effort-up)
     (tags timestamp-up priority-down effort-up)
     (search priority-down effort-up)))
 '(org-agenda-sticky t)
 '(org-agenda-todo-ignore-deadlines 'far)
 '(org-agenda-window-setup 'current-window)
 '(org-columns-default-format "%1PRIORITY %1EFFORT %65ITEM %TAGS")
 '(org-export-headline-levels 6)
 '(org-export-with-drawers (quote (not "LOGBOOK" "PROPERTIES")))
 '(org-export-with-toc nil)
 '(org-startup-truncated t)
 '(package-selected-packages
   (quote
    (ox-gfm plantuml-mode jedi-core projectile flycheck company-jedi company helm dired-sidebar use-package magit))))

;;;;;;;;;;;
;; dired ;;
;;;;;;;;;;;

(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
            ))
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
             (dired-omit-mode 1)
            ))
(use-package dired-sidebar)

;;;;;;;;;;;
;; magit ;;
;;;;;;;;;;;

;; update magit buffers automatically
(with-eval-after-load 'magit-mode
  (add-hook 'after-save-hook 'magit-after-save-refresh-status t))

;;;;;;;;;;;;;;
;; flycheck ;;
;;;;;;;;;;;;;;

(global-flycheck-mode)

;;;;;;;;;;
;; helm ;;
;;;;;;;;;;

(use-package helm
  :config (helm-mode))

;;;;;;;;;;
;; jedi ;;
;;;;;;;;;;

(use-package jedi-core
  :ensure t
  :config
  (setq python-environment-directory "~/.emacs.d/.python-environments"))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

;;;;;;;;;;;;;
;; orgmode ;;
;;;;;;;;;;;;;

(require 'org-timeline)
(setq org-startup-indented t)
(setq org-agenda-start-with-log-mode t)
(setq org-agenda-files '("~/Documents/org"))
(setq org-todo-keywords
      '((sequence "TODO" "STRT" "REVW" "|" "DONE" "CANC")))
(setq org-agenda-time-grid nil)
(setq org-cycle-separator-lines 2)
(setq org-log-states-order-reversed nil)
(setq org-tags-match-list-sublevels nil)
(setq org-agenda-use-tag-inheritance nil)

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (cond ((= n-not-done 0) "DONE")
                    ((= n-done 0) "TODO")
                    (t "STRT")))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(setq org-agenda-sorting-strategy
      '(
        (agenda priority-down effort-up)
        (todo priority-down effort-up)
        (tags priority-down effort-up)
        (search priority-down effort-up)
        )
      )

;;;;;;;;;;;;;;;
;; cosmetics ;;
;;;;;;;;;;;;;;;

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-documentation ((t (:foreground "gray98"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "brightblack"))))
 '(font-lock-comment-face ((t (:foreground "magenta"))))
 '(font-lock-constant-face ((t (:foreground "brightblue"))))
 '(font-lock-keyword-face ((t (:foreground "green"))))
 '(font-lock-string-face ((t (:foreground "color-135"))))
 '(git-commit-comment-branch-local ((t (:foreground "brightcyan"))))
 '(git-commit-comment-file ((t (:foreground "color-162"))))
 '(git-commit-comment-heading ((t (:foreground "white"))))
 '(git-commit-summary ((t (:foreground "brightwhite"))))
 '(magit-diff-file-heading-highlight ((t (:extend t :background "color-161" :foreground "white" :weight bold))))
 '(magit-section-heading ((t (:extend t :foreground "brightblue" :weight bold))))
 '(magit-section-heading-selection ((t (:extend t :foreground "white"))))
 '(magit-section-highlight ((t (:extend t :background "color-218" :foreground "black" :weight bold))))
 '(org-agenda-calendar-event ((t (:inherit default :foreground "color-147"))))
 '(org-agenda-clocking ((t (:background "brightblue" :foreground "black"))))
 '(org-agenda-date-today ((t (:foreground "brightwhite" :slant italic :weight bold))))
 '(org-agenda-done ((t (:foreground "white"))))
 '(org-agenda-structure ((t (:foreground "white"))))
 '(org-checkbox-statistics-todo ((t (:foreground "color-161"))))
 '(org-column ((t (:strike-through nil :underline nil :slant normal :weight normal))))
 '(org-date ((t (:foreground "gray59" :underline t))))
 '(org-done ((t (:foreground "SpringGreen1" :weight bold))))
 '(org-headline-done ((t (:foreground "white"))))
 '(org-level-1 ((t (:extend nil :foreground "color-85" :weight bold))))
 '(org-level-2 ((t (:extend nil :foreground "brightwhite"))))
 '(org-level-3 ((t (:extend nil :foreground "color-218"))))
 '(org-level-4 ((t (:extend nil :foreground "color-181"))))
 '(org-level-5 ((t (:extend nil :foreground "color-146"))))
 '(org-level-6 ((t (:extend nil :foreground "color-152"))))
 '(org-level-7 ((t (:extend nil :foreground "white"))))
 '(org-level-8 ((t (:extend nil :foreground "white"))))
 '(org-link ((t (:inherit nil :foreground "turquoise1" :underline t))))
 '(org-timeline-block ((t (:inherit nil :background "gray63"))))
 '(org-timeline-elapsed ((t (:inherit nil :stipple "" :background "gray26" :foreground "gray96"))))
 '(org-todo ((t (:foreground "orange red" :weight bold))))
 '(org-upcoming-deadline ((t (:foreground "snow1"))))
 '(org-warning ((t (:foreground "brightmagenta"))))
 '(vertical-border ((t (:background "brightblack" :foreground "brightblack")))))

;; orgmode todo headers
(setq org-todo-keyword-faces
      (quote (
	      ("TODO" :foreground "brightred" :weight bold)
	      ("STRT" :foreground "color-69")
	      ("REVW" :foreground "color-61")
	      ("DONE" :foreground "color-48")
	      ("CANC" :foreground "color-39" :weight bold)
       ))
)

(dired-sidebar-show-sidebar)
