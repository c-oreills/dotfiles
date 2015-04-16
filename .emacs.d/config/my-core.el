;; from <https://github.com/bling/dotemacs/>
(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
          '(progn ,@body)))

; Save backup files in .emacs.d/backups
(setq backup-directory-alist `(("." . (concat user-emacs-directory "backups")))
      backup-by-copying t
      version-control t)

(provide 'my-core)
