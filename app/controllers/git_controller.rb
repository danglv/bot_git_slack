class GitController < ApplicationController
  def event
    push = JSON.parse(request.body.read)
    puts "I got some JSON: #{push.inspect}"
    sender = push["sender"]
    sender_name = sender["login"]
    comment = push["comment"]["body"]
    html_url = push["issue"]["html_url"]

    web_hook_url ="https://hooks.slack.com/services/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"
    notifier = Slack::Notifier.new web_hook_url do
      defaults channel: "#general",
               username: "notifier"
    end
    notifier.ping "# For test: #{sender_name} just comment '#{comment}' in pr #{html_url}"
    render json: {message: "#{sender_name} just comment"}
  end
end
