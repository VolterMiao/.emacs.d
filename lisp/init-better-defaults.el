(setq visible-bell nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("fk" "frank")
					    ))

(scroll-bar-mode -1)
(setq frame-title-format "%b")
(linum-mode -1)

(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)
(setq dired-dwim-target t)

(provide 'init-better-defaults)
