(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  (use-package projectile
    :ensure t
    :config
    (projectile-global-mode)
    (setq projectile-completion-system 'helm))
  (use-package helm-ag
    :ensure t)
  (use-package helm-descbinds
    :ensure t
    :config
    (helm-descbinds-mode))
  (use-package helm-projectile
    :ensure t
    :config
    (helm-projectile-on)
    (global-set-key (kbd "C-p") 'helm-projectile-find-file)
    (after 'evil
      (define-key evil-normal-state-map
	(kbd "C-p") 'helm-projectile-find-file)
      (define-key evil-normal-state-map
	(kbd "C-n") 'helm-projectile-ag)
      ))
  ; use helm-M-x completion
  (global-set-key (kbd "M-x") 'helm-M-x)
  (setq helm-M-x-fuzzy-match t)
  ; helm-mini for buffers lists with fuzzy matching
  (global-set-key (kbd "C-b") 'helm-mini)
  (after 'evil
    (define-key evil-normal-state-map
      (kbd "C-b") 'helm-mini))
  (setq helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t)
  ; rebind tab to do persistent action (C-i for terminals)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  ; list actions using C-z
  (define-key helm-map (kbd "C-z") 'helm-select-action)
  ; Use C-o to open in other window
  (define-key helm-map (kbd "C-o") 'helm-ff-run-switch-other-window)
  (helm-autoresize-mode t))

(provide 'my-helm)
