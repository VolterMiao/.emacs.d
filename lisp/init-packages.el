;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (package-initialize)
;;   (add-to-list 'package-archives
;; 	       '("melpa" . "http://melpa.org/packages/")))

;; (require 'cl)

;; ;; add whatever packages you want here
;; (defvar frank/packages '(
;; 			 company
;; 			 monokai-theme
;; 			 hungry-delete
;; 			 smex
;; 			 swiper
;; 			 counsel
;; 			 smartparens
;; 			 popwin
;; 			 reveal-in-osx-finder
;; 			 markdown-mode
;; 			 ggtags
;; 			 projectile
;; 			 go-mode
;; 			 org-pomodoro
;; 			 helm-ag
;; 			 yasnippet
;; 			 auto-yasnippet
;; 			 mwe-log-commands
;; 			 which-key
;; 			 ) "Default packages")

;; (defun frank/packages-installed-p ()
;;   (loop for pkg in frank/packages
;; 	when(not (package-installed-p pkg)) do (return nil)
;; 	finally (return t)))

;; (unless (frank/packages-installed-p)
;;   (message "%s" "Refreshing packages database...")
;;   (package-refresh-contents)
;;   (dolist (pkg frank/packages)
;;     (when (not (package-installed-p pkg))
;;       (package-install pkg))))

(require 'window-numbering)
(window-numbering-mode 1)


(require 'hungry-delete)
(global-hungry-delete-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-company-mode t)

(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

(require 'ggtags)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
	      (ggtags-mode 1))))

(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'go-mode)

(require 'yasnippet)
(yas-reload-all)
(yas-global-mode 1)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(require 'which-key)

(require 'mwe-log-commands)
(which-key-mode)

(provide 'init-packages)
