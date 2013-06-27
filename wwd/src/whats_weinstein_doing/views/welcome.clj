(ns whats-weinstein-doing.views.welcome
  (:require [whats-weinstein-doing.views.common :as common])
  (:use [noir.core :only [defpage]]
        [twitter.oauth]
        [twitter.callbacks]
        [twitter.callbacks.handlers]
        [twitter.api.restful])
  (:import
    (twitter.callbacks.protocols SyncSingleCallback)))

;; Environment variables for Twitter auth
(def wwd-consumer-key
  (get (System/getenv) "WWD_CONSUMER_KEY"))
(def wwd-consumer-secret
  (get (System/getenv) "WWD_CONSUMER_SECRET"))
(def wwd-access-token
  (get (System/getenv) "WWD_ACCESS_TOKEN"))
(def wwd-access-token-secret
  (get (System/getenv) "WWD_ACCESS_TOKEN_SECRET"))

;; Talk to the Twitters
(def my-creds (make-oauth-creds wwd-consumer-key
                                wwd-consumer-secret
                                wwd-access-token
                                wwd-access-token-secret))

(def tweet (statuses-user-timeline
             :oauth-creds my-creds
             :params {:screen-name "ericqweinstein" :count 1}))
;; Routes
(defpage [:get "/"] []
         (common/layout
           [:div.hero-unit
            [:h1 "What's Weinstein Doing?"]]
            [:p.lead.center "{ " (-> tweet :body (first) :text) " }"]
            [:a.pull-right {:href "/about"} "About"]))

(defpage [:get "/about"] []
         (common/layout
           [:div.hero-unit
            [:h1 "I'm Eric."]]
            [:p.lead.center "I made this so people would stop asking me what I'm doing."]
            [:p.lead.center "(Just kidding. I made this to play around with Clojure.)"]
            [:a.pull-right {:href "https://github.com/ericqweinstein/garage/tree/master/wwd"} "Source"]
            [:a.pull-right {:href "/"} "Home"]))

