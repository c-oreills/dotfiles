(use-package flycheck
  :ensure t
  :config
  (progn
    (defun my-flycheck-emacs-lisp-hook ()
      (flycheck-mode)
      (flycheck-disable-checker 'emacs-lisp-checkdoc))
    (add-hook 'emacs-lisp-mode-hook 'my-flycheck-emacs-lisp-hook)
    (defun my-flycheck-python-hook ()
      (flycheck-mode))
    (add-hook 'python-mode-hook 'my-flycheck-python-hook)))

(provide 'my-flycheck)
