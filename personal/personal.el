;;; personal.el --- Emacs Prelude: Personal settings
;;
;;; Commentary:
;; Personal settings to augment those of Prelude
;; Install Emacs through homebrew with --cocoa --srgb

;;; Code:

(prelude-require-packages '(powerline
                            helm-gtags
                            smart-tabs-mode
                            vlf
                            nyan-mode
                            fill-column-indicator
                            pdf-tools
                            powerline))

(require 'powerline)
(require 'moe-theme)
(require 'darkokai-theme)
(require 'vlf-setup)
(require 'pdf-tools)

;; Set C coding style
(defun prelude-c-mode-common-defaults ()
  (setq c-default-style "linux"
        c-basic-offset 8)
  (c-set-offset 'substatement-open 0))

;; Additional c-mode highlightness
(add-hook 'c-mode-common-hook (lambda ()
    (font-lock-add-keywords nil '(
        ("!" . font-lock-string-face)
    ))
))

;; helm-gtags-mode
(require 'helm-gtags)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t)
 '(helm-gtags-fuzzy-match t)
 '(helm-gtags-maximum-candidates 9999)
 '(helm-gtags-use-input-at-cursor t)
 '(helm-gtags-highlight-candidate t)
 '(helm-gtags-display-style 0)          ; Show detail information if this value is 'detail, show reference point of function etc.
 '(helm-gtags-cache-max-result-size 9999)
 '(helm-gtags-cache-select-result t)
 )

(setq helm-gtags-display-style nil)     ; Showing detail is really slow, turn it off
(setq helm-gtags-preselect t)
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-G") 'helm-gtags-create-tags)
     (define-key helm-gtags-mode-map (kbd "M-T") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-O") 'helm-gtags-find-tag-other-window)
     (define-key helm-gtags-mode-map (kbd "M-R") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-S") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))

;; smart-tabs
;; (require 'smart-tabs-mode)
;; (add-hook 'c-mode-common-hook
;;           (lambda () (setq indent-tabs-mode t)))
;; (smart-tabs-insinuate 'c 'c++)
;; (smart-tabs-add-language-support c++ c++-mode-hook
;;   ((c-indent-line . c-basic-offset)
;;    (c-indent-region . c-basic-offset)))

;; customize whitespace-mode
;;(setq whitespace-style '(face empty))
(setq whitespace-style
      '(face          ; visualize by using faces
        trailing                 ; visualize trailing blanks via faces
        tabs                     ; visualize TABs via faces
        spaces                   ; visualize SPACEs and HARD SPACEs
        ;lines-tail    ; highlighted lines which have columns beyond 80, doesn't look good with old codes
        ))


;; enforcing the 80 column rule with a line
(require 'fill-column-indicator)
(setq fci-rule-column 80)
(setq fci-rule-width 2)
(setq fci-rule-color "black")
;; (add-hook 'c-mode-hook 'fci-mode)

;; customize font size
(set-face-attribute 'default nil :height 150)

;; avy
(avy-setup-default)
(global-set-key (kbd "C-c C-j") 'avy-resume)
(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

;; nyan-mode
(require 'nyan-mode)
(nyan-mode t)
(nyan-start-animation)

;; maximize initial window
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; avoid accidental quit of emacs
(setq confirm-kill-emacs 'y-or-n-p)

;; highlight symbol
(global-set-key (kbd "M-s h .") 'highlight-symbol-at-point)
(global-set-key (kbd "M-s h u") 'unhighlight-regexp)

;; use underline rather than bar to avoid conflict with the highlighted symbol
(global-hl-line-mode t)
(set-face-background 'hl-line nil)
(set-face-foreground 'hl-line nil)
(set-face-attribute hl-line-face nil :underline "#888888")

;; customize the mode line
(powerline-moe-theme)

;; projectile, ref https://docs.projectile.mx/projectile/configuration.html
(setq projectile-switch-project-action #'projectile-dired)
(setq projectile-enable-caching t)

;; show magit log margin with full date time string by default
(setq magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))

;; Binds useful features to key combinations
(require 'prelude-key-chord)

;; hexl display data in bytes rather than words
(setq hexl-bits 0)

;; key binding for macos browser
(global-set-key (kbd "M-O") 'browse-url-default-macosx-browser)

(defun my-disable-flycheck-in-scratch ()
  (when (string= (buffer-name) "*scratch*")
    (flycheck-mode -1)))

(add-hook 'after-change-major-mode-hook
          #'my-disable-flycheck-in-scratch)

(require 'prelude-helm-everywhere)

;; Turn off truncate lines
;;(setq-default truncate-lines t)
(add-hook 'prog-mode-hook
          (lambda ()
            (setq truncate-lines t)))

;; For faster rg, but then the link in *rg* does not work
;;(setq rg-command-line-flags '("--color=never"))

;; Remove message in the scratch buffer
(setq initial-scratch-message nil)

;; Cursor color
(set-cursor-color "#C6E87A")

;; agent-shell
;; https://github.com/xenodium/agent-shell
(defun personal-agent-shell-disable-completion ()
  "Disable automatic completion in `agent-shell-mode' buffers."
  (when (bound-and-true-p agent-shell-completion-mode)
    (agent-shell-completion-mode -1))
  (when (bound-and-true-p company-mode)
    (company-mode -1))
  (when (bound-and-true-p corfu-mode)
    (corfu-mode -1)))

(use-package agent-shell
  :ensure t
  :hook (agent-shell-mode . personal-agent-shell-disable-completion)
  :config
  (require 'agent-shell-openai)
  (global-set-key (kbd "C-c a") #'agent-shell)
  (setq agent-shell-file-completion-enabled nil)
  ;; use codex by default
  (setq agent-shell-preferred-agent-config
        (agent-shell-openai-make-codex-config))
  ;; choose to create a new session or select from past sessions when starting
  (setq agent-shell-session-strategy 'prompt)
  ;; Codex "fast" is a service tier, not an agent-shell session mode.
  (setq agent-shell-openai-codex-acp-command
        '("codex-acp"
          "-c" "service_tier=\"fast\""
          "-c" "model_reasoning_effort=\"xhigh\""))
  ;; login based auth
  (setq agent-shell-openai-authentication
        (agent-shell-openai-make-authentication :login t))
  ;; To get previous messages when resuming
  (setq agent-shell-session-restore-strategy 'full)
  )

(use-package agent-recall
  :ensure t
  :hook (agent-shell-mode . agent-recall-track-sessions)
  :config
  (setq agent-recall-search-paths '("~/" "~/code/debug" "~/code/rtwlan")
        agent-recall-search-function 'grep
        ;;agent-recall-browse-sort 'modified-desc
        agent-recall-browse-sort 'project))

(provide 'personal)
;;; personal.el ends here
