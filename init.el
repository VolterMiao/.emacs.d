;;********************* Monkey Frank's Emacs ****************************

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-key-binding)
(require 'init-org)

(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;;************************** Dropbox ************************************
(setq org-directory "~/.emacs.d/org")
(setq org-mobile-inbox-for-pull "~/.emacs.d/org/notes/org-mode.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")


;;************************** Global Settings ****************************

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

;; make GUI Emacs always sees the same $PATH
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

; define-advice?????
;(define-advice show-paren-function (:around (fn) fix-show-paren-function)
;  "Highlight enclosing parens."
;  (cond ((looking-at-p "\\s(") (funcall fn))
;	(t (save-excursion
;	     (ignore-errors (backward-up-list))
;	     (funcall fn)))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)



(global-auto-revert-mode t)
;;************************** Operation Settings **************************
(setq x-select-enable-clipboard t)

;; undo/redo
(setq winner-dont-bind-my-keys t)
(winner-mode 1)


(delete-selection-mode t)

(require 'smex)
(smex-initialize)





;;**************************** Plugins ***********************************
;; CEDET
;(add-to-list 'cedet-path "~/.emacs.d/plugins/cedet-1.1/"

;;;;;;;;;;;;;;;;;;;;;;;;;;; doc-view-mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.2)
 '(company-minimum-prefix-length 2)
 '(custom-safe-themes
   (quote
    ("c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" default)))
 '(doc-view-conversion-refresh-interval 1)
 '(doc-view-ghostscript-options
   (quote
    ("-dNOSAFER" "-dNOPAUSE" "-sDEVICE=png16m" "-dTextAlphaBits=4" "-dBATCH" "-dGraphicsAlphaBits=4" "-dQUIET")))
 '(doc-view-resolution 1000)
 '(doc-view-scale-internally t)
 '(org-support-shift-select (quote always)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ghostscript path
(setq doc-view-ghostscript-program "/usr/local/Cellar/ghostscript/9.16/bin/gs")


;;;;;;;;;;;;;;;;;;;;;;;;;; wakatime-mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-wakatime-mode)
;;(add-to-list 'load-path "~/.emacs.d/plugins/")
;(require 'wakatime-mode)
(setq wakatime-api-key "bf921285-9122-4e86-ba9a-1632707e0c7e")
(setq wakatime-cli-path "/Users/Frank/Library/Enthought/Canopy_64bit/User/bin/wakatime")


;;;;;;;;;;;;;;;;;;;;;;;;;;; C Language ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "K&R")
             (setq tab-width 4)
             (setq indent-tabs-mode t)
             (setq c-basic-offset 4)))

;(load-file "~/.emacs.d/plugins/cedet-1.1/common/cedet.el")
(global-ede-mode 1)



