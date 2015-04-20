(use-package elpy
  :ensure t
  :config
  (elpy-use-ipython)
  (after 'evil
    (evil-define-key 'motion python-mode-map (kbd "gd")
      'elpy-goto-definition)))

(use-package column-marker
  :ensure t
  :config
  (progn
  (defun my-column-marker ()
    (column-marker-3 80))
  (add-hook 'python-mode-hook 'my-column-marker)))

(provide 'my-python-mode)
