;;; current buffer

(current-buffer)

;;; function

(defun the-meaning-of-life (answer)
  (message " The answer is %s" answer)
  )

(the-meaning-of-life '47)
;;; evaluate C-x C-e
q
(get-buffer-create "scratchy")

(current-buffer)

;; progn - Run mutiple expressions

(
 (set-buffer (get-buffer "scratch"))
 (current-buffer)
 )
