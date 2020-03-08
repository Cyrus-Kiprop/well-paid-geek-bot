module GeekyBot
    class Bot < SlackRubyBot::Bot
      help do
        title 'Well paid geek toolkit'
        desc 'This is a slack utility bot for a tech savvy. You can access various services i.e 
           -> getting job updates
           -> Programming memes
           -> Inspitional quotes
           -> Css tricks Articles
           -> More features we be coming soon
        .'
  
        command :jobs? do
          title 'jobs?'
          desc 'get the latest ruby jobs feed from stack overflow. Returns all the valid urls of the specific jobs. You can click on the links for more information about the job that interest/suits you'
        end
      end
    end
  end