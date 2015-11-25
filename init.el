;;;;;;;;;;;;;;;;;;;;;;;;;;; Monkey Frank's Emacs Configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Learning emacs...

;;;;;;;;;;;;;;;;;;;;;;;;;;; 系统设置 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 启动时进入debug模式
(setq debug-on-quit t)

;; 关闭出错时的蜂鸣提示声
(setq visible-bell t)

;; 关闭自动备份文件
(setq make-backup-files nil)



;;;;;;;;;;;;;;;;;;;;;;;;;;;; 操作设置 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 支持emacs和外部程序之间进行粘贴
(setq x-select-enable-clipboard t)

;; undo/redo之前操作的窗口
(setq winner-dont-bind-my-keys t)
(winner-mode 1)
(global-set-key (kbd "<f9> C-u") 'winner-undo)
(global-set-key (kbd "<f9> C-r") 'winner-redo)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 显示设置 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color theme [molokai]
(setq molokai-theme-kit t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'molokai t)

;; 半透明设置，Mac全屏时候无效
(global-set-key [(f12)] 'loop-alpha)
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

;; 光标不闪烁
(blink-cursor-mode nil)

;; 光标显示为竖线
(setq-default cursor-type 'bar)

;; 不显示工具栏
(tool-bar-mode -1)

;; 不显示滚动条
(scroll-bar-mode -1)

;; 在最上方的标题栏显示当前buffer的名字
(setq frame-title-format "%b")

;;;;;;;;;;;;;;;;;;;;;;;;;;; 插件加载 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CEDET
;(add-to-list 'cedet-path "~/.emacs.d/plugins/cedet-1.1/"

;; 显示行号 (不能在doc-view-mode下使用)
;(global-linum-mode 1)
;(require 'linum)

;; 快速窗口切换(M-0~9)
(add-to-list 'load-path "~/.emacs.d/plugins/")
(require 'window-numbering)
(window-numbering-mode 1)




;;;;;;;;;;;;;;;;;;;;;;;;;;; org-mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 标题缩进
(setq org-startup-indented t)

;; 隐藏星号
(setq org-hide-leading-stars t)

;; 设置org模式标题字体大小
(set-face-attribute 'org-level-1 nil :height 1.6 :bold t)
(set-face-attribute 'org-level-2 nil :height 1.4 :bold t)
(set-face-attribute 'org-level-3 nil :height 1.2 :bold t)

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




;;;;;;;;;;;;;;;;;;;;;;;;;;; doc-view-mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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

;; ghostscript路径设置
(setq doc-view-ghostscript-program "/usr/local/Cellar/ghostscript/9.16/bin/gs")









