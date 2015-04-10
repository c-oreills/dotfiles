(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  (use-package projectile
    :ensure t
    :config
    (projectile-global-mode))
  (use-package helm-projectile
    :ensure t
    :config
    (helm-projectile-on)
    (after 'evil
      (define-key evil-normal-state-map
	(kbd "C-p") 'helm-projectile-find-file))))

(provide 'my-helm)
