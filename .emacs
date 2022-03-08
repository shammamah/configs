;;;;;;;;;;;;;
;; general ;;
;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(setq inhibit-startup-screen t)

;; key bindings
(global-set-key "\C-cc" 'delete-window)
(global-set-key "\C-cg" 'magit)
(global-set-key "\C-cw" 'delete-trailing-whitespace)
(global-set-key "\C-cd" 'dired-sidebar-toggle-sidebar)

;; variables
(custom-set-variables
 '(package-selected-packages '(dired-sidebar use-package magit)))

;;;;;;;;;;;
;; dired ;;
;;;;;;;;;;;

(use-package dired-sidebar)

;;;;;;;;;;;
;; magit ;;
;;;;;;;;;;;

;; update magit buffers automatically
(with-eval-after-load 'magit-mode
  (add-hook 'after-save-hook 'magit-after-save-refresh-status t))

;;;;;;;;;;;;;
;; orgmode ;;
;;;;;;;;;;;;;

(setq org-agenda-files '("~/Documents/org"))
(setq org-todo-keywords
      '((sequence "TODO" "STRT" "REVW" "|" "DONE" "CANC")))

;;;;;;;;;;;;;;;
;; cosmetics ;;
;;;;;;;;;;;;;;;

(custom-set-faces

 ;; general
 '(font-lock-comment-delimiter-face ((t (:foreground "brightblack"))))
 '(font-lock-comment-face ((t (:foreground "magenta"))))
 '(font-lock-constant-face ((t (:foreground "brightblue"))))
 '(font-lock-keyword-face ((t (:foreground "green"))))
 '(font-lock-string-face ((t (:foreground "color-135"))))

 ;; commits... but magit cute
 '(git-commit-comment-branch-local ((t (:foreground "brightcyan"))))
 '(git-commit-comment-file ((t (:foreground "color-162"))))
 '(git-commit-comment-heading ((t (:foreground "white"))))
 '(git-commit-summary ((t (:foreground "brightwhite"))))

 ;; diffs... but magit cute
 '(magit-diff-file-heading-highlight ((t (:extend t :background "color-161" :foreground "white" :weight bold))))
 '(magit-section-heading ((t (:extend t :foreground "brightblue" :weight bold))))
 '(magit-section-heading-selection ((t (:extend t :foreground "white"))))
 '(magit-section-highlight ((t (:extend t :background "color-218" :foreground "black" :weight bold))))

 ;; orgmode
 '(org-checkbox-statistics-todo ((t (:foreground "color-161"))))
 '(org-headline-done ((t (:foreground "white"))))
 '(org-level-1 ((t (:extend nil :foreground "color-85" :weight bold))))
 '(org-level-2 ((t (:extend nil :foreground "brightwhite"))))
 '(org-level-3 ((t (:extend nil :foreground "color-218"))))
 '(org-level-4 ((t (:extend nil :foreground "color-181"))))
 '(org-level-5 ((t (:extend nil :foreground "color-146"))))
 '(org-level-6 ((t (:extend nil :foreground "color-152"))))
 '(org-level-7 ((t (:extend nil :foreground "white"))))
 '(org-level-8 ((t (:extend nil :foreground "white")))))

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
