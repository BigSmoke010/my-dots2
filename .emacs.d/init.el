(setq inhibit-startup-message t)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(menu-bar-mode -1)            ; Disable the menu bar
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
;; Set up the visible bell
(setq visible-bell t)
					;set font
(set-face-attribute 'default nil :font "Fira Code 12")
					; enable modes
(column-number-mode)
(global-display-line-numbers-mode t)
(electric-pair-mode 1)
(global-hl-line-mode +1)
					;load theme
(load-theme 'doom-tokyo-night t)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)
(require 'eglot)
(add-to-list 'load-path "/home/walid/.emacs.d/key-chord/")
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(require 'use-package)

;;icons
(use-package all-the-icons
  :ensure t)

(require 'format-all)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'after-init-hook 'global-company-mode)
;;auto format all
(add-hook 'prog-mode-hook 'format-all-mode)
(setq format-all-mode t)
(setq format-all-buffer-name "*format-all*")
(add-hook 'before-save-hook 'format-all-buffer)
(add-hook 'html-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'format-all-buffer nil 'local)))
(setq-default format-all-executable "prettier")
(setq-default format-all-args '("--parser" "html"))
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'lua-mode-hook 'eglot-ensure)
(add-hook 'markdown-mode-hook 'eglot-ensure)
(add-to-list 'eglot-server-programs '(lua-mode . ("lua-language-server")))

;; rainbow ((()))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; ivy and counsel for better searching
(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-wrap t
        ivy-height 10
        ivy-initial-inputs-alist nil)
  :config
  (ivy-mode 1))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)))

					;doom modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

					;evil-mode
(require 'evil-snipe)
(setq evil-snipe-scope 'buffer)
(evil-snipe-mode +1)
(evil-snipe-override-mode +1)
(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (setq evil-leader/in-all-states 1)
  (evil-leader/set-key "bn" 'next-buffer)
  (evil-leader/set-key "bp" 'previous-buffer)
  (evil-leader/set-key "e" 'evil-snipe-s)
  (evil-leader/set-key "si" 'counsel-imenu)
  (evil-leader/set-key "gcc" 'comment-region)
  (evil-leader/set-key "gx" 'uncomment-region))
(require 'evil)
(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)
(evil-mode 1)

					;company;; Set scroll margin and conservatively
(setq scroll-margin 10)
(setq scroll-conservatively 10000)
(add-hook 'after-init-hook 'global-company-mode)

;; undo-tree
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.undo")))
(global-undo-tree-mode)

;; dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

					;no touch
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
