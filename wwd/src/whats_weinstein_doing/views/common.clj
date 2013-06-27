(ns whats-weinstein-doing.views.common
  (:use [noir.core :only [defpartial]]
        [hiccup.page :only [include-css html5]]))

(defpartial layout [& content]
            (html5
              [:head
               [:title "WWD"]
               (include-css "/css/bootstrap.min.css")
               (include-css "/css/custom.css")]
              [:body
               [:div#wrapper
                content]]))

