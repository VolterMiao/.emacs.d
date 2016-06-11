;;********************* Monkey Frank's Emacs ****************************
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-key-binding)

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
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;; org-mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-startup-indented t)
(setq org-hide-leading-stars t)

(require 'org)
(setq org-src-fontify-natively t)

;;(set-face-attribute 'org-level-1 nil :height 1.6 :bold t)
;;(set-face-attribute 'org-level-2 nil :height 1.4 :bold t)
;;(set-face-attribute 'org-level-3 nil :height 1.2 :bold t)

;; agenda-view快捷键设置
;; 生成todos目录下所有org文件的全局TODO清单
(global-set-key "\C-ca" 'org-agenda)

;; 加入agenda的org文件清单
(setq org-agenda-files (list "~/.emacs.d/org/todos/work.org"
                             "~/.emacs.d/org/todos/projects.org"
			     "~/.emacs.d/org/todos/study.org"
                             "~/.emacs.d/org/todos/me.org"
			     "~/.emacs.d/org/notes/org-mode.org"
                           ))
;; TODO标签
;; NEW --- 第一次出现在脑海中
;; PLANNING --- 方案思考中
;; OPEN --- 开始着手
;; BLOCKING --- 阻塞(记录原因)
;; DONE --- 完成
;; CANCEL --- 取消

(setq org-todo-keywords
      '((sequence "NEW(n!)" "PLANNING(p@/!)" "OPEN(o!)" "BLOCKING(b@/!)" "|" "DONE(d@/!)" "CANCELED(c@/!)")
     )) 

(defun org-summary-todo (n-done n-not-done)
      "Switch entry to DONE when all subentries are done, to TODO otherwise."
      (let (org-log-done org-log-states)   ; turn off logging
        (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
    
    (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)


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

(load-file "~/.emacs.d/plugins/cedet-1.1/common/cedet.el")
(global-ede-mode 1)



