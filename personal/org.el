;; Bind this to C-c n I
(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

(require 'org-attach)
(setq org-link-abbrev-alist '(("att" . org-attach-expand-link)))

;; For displaying inline images in org files
(setq org-image-actual-width nil)

;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))

(setq org-plantuml-jar-path
      (expand-file-name "/opt/homebrew/Cellar/plantuml/1.2025.2/libexec/plantuml.jar"))

(setq org-confirm-babel-evaluate nil)(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Documents/Documents - yujui’s MacBook Pro 2023/RoamNote")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     ("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Project")
      :unnarrowed t)
     ("j" "Jira" plain "* Link\n- Log: [[~/code/debug/${title}][${title}]]\n- Jira: [[https://jira.realtek.com/browse/${title}][${title}]]\n\n* Analysis: [^]\n** Analysis\n\n"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Jira\n#+OPTIONS: ^:nil")
      :unnarrowed t)
     ("i" "Issue Summary" plain "* Description\n%?\n* Symptom\n\n* Related Jira Items\n\n* TODO Add initial tasks\n\n"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: IssueSummary")
      :unnarrowed t)
     ("r" "Realtek Doc" plain "* Author\n\n* Date\n\n* Link\n\n* Description\n%?\n\n"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: RealtekDoc")
      :unnarrowed t)
     )
   )
  (org-roam-dailies-capture-templates
   '(("d" "default" plain "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n")
      :unnarrowed t)
     ("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Project")
      :unnarrowed t)
     )
   )
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n I" . org-roam-node-insert-immediate)
         ("C-c n g" . org-roam-ui-open)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode))

;; For displaying inline images in org files
(setq org-image-actual-width nil)
