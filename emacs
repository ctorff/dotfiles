;; define repositories
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
;;(global-evil-leader-mode)
(evil-mode 1)

;;; esc quits everthing
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)


;(setq org-todo-keywords
;    '((sequence "TODO(t)" "|" "DONE(!d)")
;      (sequence "|" "CANCELED(c)")))

; --- basic config -----------------------------------------------------------

;; most anoying thing ever...
(setq visible-bell t)

(set-default-font "Dejavu Sans Mono-10")

(custom-set-variables '(inhibit-startup-screen t))
(custom-set-faces)
