;; Make availble package functions
(require 'package)

;; add a new package source
(customize-set-variable 'package-archives
                        (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")))
;; Initializes package list
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; Only evaluate this when compiling this file
(eval-when-compile
  ;; For each package on the list do
  (dolist (package '(use-package diminish bind-key))
    ;; Install if not yet installed
    (unless (package-installed-p package)
      (package-install package))
    ;; Require package making it available on the rest of the configuration
    (require package)))

;; GIT interface for Emacs
(use-package magit
  :ensure t
  :bind ("C-c m s" . magit-status))

;; Auto-complete interface
(use-package company
  :ensure t
  :diminish company-mode
  :bind ("M-/" . company-complete)  
  :config
  (global-company-mode))

;; Sidebar navigation with extras
(use-package treemacs
  :ensure t  
  :config
  (treemacs-filewatch-mode t)
  (treemacs-git-mode 'extended)
  (treemacs-follow-mode -1)
  (add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode -1))))

;; Makes treemacs show different colors for committed, staged and modified files
(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package elixir-mode
  :ensure t
  :bind (:map elixir-mode-map
	      ("C-c C-f" . elixir-format)))

(setq column-number-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (treemacs-magit treemacs company magit diminish use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
