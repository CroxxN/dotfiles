(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'flatland t)
(require 'package)
(add-to-list 'package-archives '("MELPA" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'smex)
(smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(put 'upcase-region 'disabled nil)
(ido-mode 1)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))
(setq display-time-24hr-format t)
(display-time-mode 1)
(setq ido-show-dot-for-dired t)
(setq display-time-format "%Y-%m-%d at %H:%M")
(display-battery-mode)
(setq split-height-threshold 0)
(setq split-width-threshold nil)
(require 'lsp-mode)
(require 'multiple-cursors)
(require 'tree-sitter)
(require 'tree-sitter-hl)
(require 'tree-sitter-query)
;; (require 'tree-sitter-langs)
(add-hook 'c-mode-hook #'tree-sitter-mode)
(global-tree-sitter-mode)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(define-key global-map (kbd "RET") 'newline-and-indent)
(put 'downcase-region 'disabled nil)
(move-text-default-bindings)
(defun indent-region-advice (&rest ignored)
  (let ((deactivate deactivate-mark))
    (if (region-active-p)
        (indent-region (region-beginning) (region-end))
      (indent-region (line-beginning-position) (line-end-position)))
    (setq deactivate-mark deactivate)))
(setq major-mode-remap-alist
 '((yaml-mode . yaml-ts-mode)
   (bash-mode . bash-ts-mode)
   (js2-mode . js-ts-mode)
   (typescript-mode . typescript-ts-mode)
   (json-mode . json-ts-mode)
   (css-mode . css-ts-mode)
   (c-mode . c-ts-mode)
   (rust-mode . rust-ts-mode)
   (python-mode . python-ts-mode)))

(advice-add 'move-text-up :after 'indent-region-advice)
(advice-add 'move-text-down :after 'indent-region-advice)
(require 'empv)
(setq empv-invidious-instance "https://invidious.nerdvpn.de/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-theme 'flatland)
 '(custom-safe-themes
   '("f33ec918886ae515a4a2d339c8e32c0284e44e6980c041772c0e8060a17b55ee" "a56cc18045d90be8f770ae409fc86274f8e5de2999a16b604ff84f8015e8d1e5" "527ad0b513378351ae2c230fc1c6edb96e02ba18cb8d44a9af75c8b18635556f" default))
 '(package-selected-packages
   '(flash-region yasnippet-classic-snippets zoxide yasnippet-snippets magit wrap-region flycheck yasnippet company lsp-mode rustic nlinum vterm-toggle multi-vterm smex smbc)))

(require 'emacs-surround)
(global-set-key (kbd "C-q") 'emacs-surround)

(wrap-region-mode t)
