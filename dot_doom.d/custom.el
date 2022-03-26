(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(projectile-auto-discover t)
 '(projectile-dynamic-mode-line nil)
 '(projectile-enable-caching t)
 '(projectile-enable-cmake-presets t)
 '(projectile-git-submodule-command nil)
 '(projectile-ignored-project-function 'doom-project-ignored-p)
 '(projectile-mode t nil (projectile))
 '(projectile-per-project-compilation-buffer t)
 '(safe-local-variable-values
   '((projectile-project-compilation-cmd . "bundle exec jekyll build")
     (projectile-project-install-cmd . "bundle install")
     (projectile-project-run-cmd . "cp ./build/pwrbox.uf2 /run/media/tbjers/RPI-RP*/")
     (projectile-project-run-cmd . "cp ./build/pwrbox.uf2 /media/tbjers/RPI-RP*/")
     (projectile-project-install-cmd . "cp ./build/pwrbox.uf2 /media/tbjers/RPI-RP*/")
     (projectile-project-compilation-cmd . "cmake --build build")
     (projectile-project-configure-cmd . "rm -Rf build && cmake -S . -B build"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
