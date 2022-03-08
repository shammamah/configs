;;;;;;;;;;;;;
;; general ;;
;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; key bindings
(global-set-key "\C-cc" 'delete-window)
(global-set-key "\C-cg" 'magit)
(global-set-key "\C-cw" 'delete-trailing-whitespace)

;; variables
(custom-set-variables
 '(package-selected-packages '(magit)))


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
 '(magit-section-highlight ((t (:extend t :background "color-218" :foreground "black" :weight bold)))))


;;;;;;;;;;;
;; magit ;;
;;;;;;;;;;;

;; update magit buffers automatically
(with-eval-after-load 'magit-mode
  (add-hook 'after-save-hook 'magit-after-save-refresh-status t))
