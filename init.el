;;********************* Monkey Frank's Emacs ****************************
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-packages)


;;************************** Global Settings ****************************
(setq visible-bell nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)

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
(global-hl-line-mode t)
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

(global-auto-revert-mode t)
;;************************** Operation Settings **************************
(setq x-select-enable-clipboard t)

;; undo/redo
(setq winner-dont-bind-my-keys t)
(winner-mode 1)
(global-set-key (kbd "<f9> C-u") 'winner-undo)
(global-set-key (kbd "<f9> C-r") 'winner-redo)

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f3>") 'open-init-file)
(delete-selection-mode t)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)


(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)



(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("fk" "frank")
					    ))

;;************************** Apperance Settings **************************

(setq initial-frame-alist (quote ((fullscreen . maximized))))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'colonoscopy t)


(global-set-key (kbd "<f12>") 'loop-alpha)
(setq alpha-list '((55 35) (100 100) (95 65) (85 55) (75 45)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))                ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
  )

(blink-cursor-mode nil)
(setq-default cursor-type 'bar)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq frame-title-format "%b")
(linum-mode -1)
(setq inhibit-splash-screen t)

;;**************************** Plugins ***********************************
;; CEDET
;(add-to-list 'cedet-path "~/.emacs.d/plugins/cedet-1.1/"

(add-to-list 'load-path "~/.emacs.d/plugins/")
(require 'window-numbering)
(window-numbering-mode 1)



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



