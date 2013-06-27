(ns whats-weinstein-doing.server
  (:require [noir.server :as server]))

(server/load-views-ns 'whats-weinstein-doing.views)

(defn -main [& m]
  (let [mode (keyword (or (first m) :dev))
        port (Integer. (get (System/getenv) "PORT" "8080"))]
    (server/start port {:mode mode
                        :ns 'whats-weinstein-doing})))

