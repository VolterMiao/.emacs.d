(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(require 'cl)

;; add whatever packages you want here
(defvar frank/packages '(
			 company
			 monokai-theme
			 hungry-delete
			 smex
			 swiper
			 counsel
			 smartparens
			 popwin
			 reveal-in-osx-finder
			 ) "Default packages")

(defun frank/packages-installed-p ()
  (loop for pkg in frank/packages
	when(not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (frank/packages-installed-p)
  (message "%s" "Refreshing packages database...")
  (package-refresh-contents)
  (dolist (pkg frank/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(require 'window-numbering)
(window-numbering-mode 1)

(smartparens-global-mode t)
(require 'hungry-delete)
(global-hungry-delete-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-company-mode t)

;;(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
