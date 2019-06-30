(require 'package)
;;(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Custom packages
;;(let ((base "~/.emacs.d/lisp/"))
;;  (add-to-list 'load-path base)
;;(dolist (f (directory-files base))
;;(let ((name (concat base "/" f)))
;;(when (and (file-directory-p name) 
;;               (not (equal f ".."))
;;               (not (equal f ".")))
;;      (add-to-list 'load-path name)))))

;; Powerline
;;(use-package evil)
(use-package better-defaults)

;; Doom modeline
(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode))

;; Lua
(use-package lua-mode)

;; Go
(use-package go-mode)

;; OCaml
(load "/home/i3user/.opam/default/share/emacs/site-lisp/tuareg-site-file")

;; TS
(use-package typescript-mode)

;; Flycheck
(use-package flycheck)

;; Counsel
(use-package ivy
  :bind
  (:map ivy-minibuffer-map
        ("RET" . ivy-alt-done))
  :custom
  (ivy-initial-inputs-alist nil))

(use-package counsel
  :bind
  ("M-x" . counsel-M-x)
  ("C-x d" . counsel-find-file)
  ("C-h v" . counsel-describe-variable)
  ("C-h f" . counsel-describe-function)
  ("C-x b" . counsel-ibuffer))

;; remember to refresh
;; https://github.com/domtronn/all-the-icons.el
(use-package all-the-icons
  :defer 0.5)

(use-package all-the-icons-ivy
  :after (all-the-icons ivy)
  :custom (all-the-icons-ivy-buffer-commands '(ivy-switch-buffer-other-window ivy-switch-buffer))
  :config
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-dired-jump)
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-find-library)
  (all-the-icons-ivy-setup))

(load-file ".emacs.d/elpa/elcord/elcord.el")


(use-package all-the-icons-dired)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)



;; Evil

(use-package which-key
  :demand t
  :config
  (which-key-mode)
  :bind
  ("C-h m" . which-key-show-major-mode)
  ("C-h b" . which-key-show-top-level))

(use-package evil
  :demand t
  :config
  (evil-mode 1))

(add-hook 'minibuffer-exit-hook '(run-with-timer 0.2 nil 'evil-emacs-state))


;; Other customization shit

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(global-set-key (kbd "C-<tab>") 'indent-for-tab-command)
(global-set-key (kbd "M-<tab>") 'indent-for-tab-command)

(setq inhibit-startup-message t) 
(load-theme 'mood-one t) 
(global-linum-mode t) 

(bind-key* "TAB" 'tab-to-tab-stop)
(setq-default tab-width 4)

(set-face-attribute 'default nil
                    :family "Fira Code 11"
                    :weight 'normal
                    :width 'normal)

(setq Tex-PDF-mode t)

(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-initial-inputs-alist nil)
 '(package-selected-packages
   (quote
    (clang-format flycheck-color-mode-line flycheck mood-one-theme doom-modeline dracula-theme go-mode lua-mode spacemacs-theme monokai-theme typescript-mode all-the-icons-ivy all-the-icons-dired counsel evil which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
