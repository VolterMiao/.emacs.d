(require 'org)

(setq org-startup-indented t)
(setq org-hide-leading-stars t)

(setq org-src-fontify-natively t)

(set-face-attribute 'org-level-1 nil :height 1.6 :bold t)
(set-face-attribute 'org-level-2 nil :height 1.4 :bold t)
(set-face-attribute 'org-level-3 nil :height 1.2 :bold t)

(setq org-todo-keywords
      '((sequence "NEW(n!)" "PLANNING(p@/!)" "OPEN(o!)" "BLOCKING(b@/!)" "|" "DONE(d@/!)" "CANCELED(c@/!)")
     )) 

(defun org-summary-todo (n-done n-not-done)
      "Switch entry to DONE when all subentries are done, to TODO otherwise."
      (let (org-log-done org-log-states)   ; turn off logging
        (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
    
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; 加入agenda的org文件清单
(setq org-agenda-files '("~/.emacs.d/gtd.org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	 "* TODO [#B] %?\n %i\n"
	 :empty-lines 1)))

(provide 'init-org)
