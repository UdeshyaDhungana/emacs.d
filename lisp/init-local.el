;;; For my personal configuration

;; Use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defalias 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t)
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;Maximize on start

(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)
;; launch ansi term shortcut
(global-set-key (kbd "<s-M-return>") 'ansi-term)


;; scrolling
(setq scroll-conservatively 100)
;; disable bell
(setq ring-bell-function 'ignore)
;; Disable annyoances
(when window-system (global-hl-line-mode t))
(setq make-backup-files nil)
(setq auto-save-default nil)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Ido mode
(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

;; iBuffer
(global-set-key (kbd "C-x b") 'ibuffer)


;; Better windows
(defun split-and-follow-horizontally()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(setq electric-pair-pairs '(
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\{ . ?\})))
(electric-pair-mode t)

(line-number-mode 1)
(column-number-mode 1)

;; kill current buffer
(defun kill-curr-buffer()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-curr-buffer)


;; clock
(display-time-mode 1)

;; show parenthesis
(show-paren-mode)

;; for kde gaps
(setq frame-resize-pixelwise t)

;; ========================================
;; Ido-vertical
(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))


;; org bullets
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))


(provide 'init-local)
