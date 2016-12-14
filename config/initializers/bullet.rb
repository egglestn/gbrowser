if Rails.env.development?
    Bullet.enable = true
    # Turn off alerts temporarily, while we have prototype code that is not optimised
    # Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
    Bullet.add_footer = Features.bullet_footer?
    # Not using slack
    # Bullet.slack = { webhook_url: 'https://alliants.slack.com/', channel: '#PROJECTNAME', username: 'bullet-notifier' }
end

