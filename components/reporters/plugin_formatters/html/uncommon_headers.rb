=begin
    Copyright 2010-2014 Tasos Laskos <tasos.laskos@gmail.com>
    All rights reserved.
=end

class Arachni::Reporters::HTML

# @author Tasos "Zapotek" Laskos <tasos.laskos@gmail.com>
class PluginFormatters::UncommonHeaders < Arachni::Plugin::Formatter
    include TemplateUtilities

    def run
        ERB.new( tpl ).result( binding )
    end

    def tpl
        <<-HTML
        <ul>
        <% results.each do |url, headers| %>
            <li>
                <a href="<%= escapeHTML url %>"><%= escapeHTML url %></a>

                <dl class="dl-horizontal">
                    <% headers.each do |name, value| %>
                        <dt><%= escapeHTML name %></dt>
                        <dd><code><%= escapeHTML value %></code></dd>
                    <% end %>
                </dl>

            </li>
        <% end %>
        </ul>
        HTML
    end

end
end
