;;; wakatime-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "wakatime-mode" "wakatime-mode.el" (22460 19137
;;;;;;  0 0))
;;; Generated autoloads from wakatime-mode.el

(autoload 'wakatime-mode "wakatime-mode" "\
Toggle WakaTime (WakaTime mode).

\(fn &optional ARG)" t nil)

(defvar global-wakatime-mode nil "\
Non-nil if Global-Wakatime mode is enabled.
See the command `global-wakatime-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-wakatime-mode'.")

(custom-autoload 'global-wakatime-mode "wakatime-mode" nil)

(autoload 'global-wakatime-mode "wakatime-mode" "\
Toggle Wakatime mode in all buffers.
With prefix ARG, enable Global-Wakatime mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Wakatime mode is enabled in all buffers where
`(lambda nil (wakatime-mode 1))' would do it.
See `wakatime-mode' for more information on Wakatime mode.

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; wakatime-mode-autoloads.el ends here
