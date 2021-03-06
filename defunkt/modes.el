;; others
(load "defunkt/dired")
(load "defunkt/ruby")
(load "defunkt/shell")
(load "defunkt/javascript")
(load "defunkt/erlang")

; bash
(setq auto-mode-alist (cons '("\\.bashrc" . sh-mode) auto-mode-alist))

; obj-c
(setq auto-mode-alist (cons '("\\.m" . objc-mode) auto-mode-alist))

; yaml
(setq auto-mode-alist (cons '("\\.ya?ml" . yaml-mode) auto-mode-alist))

; magit
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

; markdown
(add-to-list 'load-path "~/.emacs.d/vendor/markdown-mode")
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(add-hook 'markdown-mode-hook 
          '(lambda () 
             (define-key markdown-mode-map (kbd "<tab>") 'defunkt-indent)))

; paredit
(autoload 'paredit-mode "paredit"
     "Minor mode for pseudo-structurally editing Lisp code."
     t)
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))

; jasper
(setq auto-mode-alist (cons '("\\.jr" . emacs-lisp-mode) auto-mode-alist))

; mode-compile
(autoload 'mode-compile "mode-compile"
   "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)

(autoload 'mode-compile-kill "mode-compile"
 "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

; ido
;(ido-mode t)
;(setq ido-enable-flex-matching t)

; css
;(define-key css-mode-map [tab] 'defunkt-indent)

;;
;; erc
;;
;; channel name in prompt
(setq erc-prompt (lambda ()
                   (if (and (boundp 'erc-default-recipients) (erc-default-target))
                       (erc-propertize (concat (erc-default-target) ">") 'read-only t 'rear-nonsticky t 'front-nonsticky t)
                     (erc-propertize (concat "ERC>") 'read-only t 'rear-nonsticky t 'front-nonsticky t))))

(setq erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK" "MODE"))
(setq erc-autojoin-channels-alist '(("freenode.net" "#github" "#fauna")))

;; cucumber / feature ;;bkerley's submodule for cucumber/feature-mode is broken + don't need cucumber stuff
;;(add-to-list 'load-path "~/.emacs.d/vendor/feature-mode")
;;(autoload 'feature-mode "feature-mode.el" "Mode for editing cucumber files" t)
;;(setq auto-mode-alist (cons '("\\.feature" . feature-mode) auto-mode-alist))
