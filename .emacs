(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes 'gruber-darker)
 '(custom-safe-themes
   '("527ad0b513378351ae2c230fc1c6edb96e02ba18cb8d44a9af75c8b18635556f" default))
 '(package-selected-packages
   '(flycheck company lsp-mode rustic nlinum vterm-toggle multi-vterm smex smbc)))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'gruber-darker)
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
(setq display-time-format "%Y-%m-%d at %H:%M")
(display-battery-mode)
(setq split-height-threshold 0)
(setq split-width-threshold nil)
