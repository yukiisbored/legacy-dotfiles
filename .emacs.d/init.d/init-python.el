;;; init-python.el --- Format for init files
;; Author: Muhammad Kaisar Arkhan (yuki_is_bored)

;;; Commentary:

;;; Code:

(require 'req-package)

(req-package virtualenvwrapper
  :init
  (setq venv-location "~/.virtualenvs")
  :config
  (venv-initalize-interactive-shells)
  (venv-initalize-eshell))

(req-package jedi
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t))

(provide 'init-python)

;;; init-python.el ends here
