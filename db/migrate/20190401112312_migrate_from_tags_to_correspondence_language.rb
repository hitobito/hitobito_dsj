class MigrateFromTagsToCorrespondenceLanguage < ActiveRecord::Migration
  def change
    add_column :people, :correspondence_language, :string, limit: 5

    reversible do |dir|
      dir.up do
        say_with_time 'Transfer language-tag to new column' do
          suppress_messages do
            execute <<-SQL.strip_heredoc
              UPDATE people
              INNER JOIN taggings ON (people.id = taggings.taggable_id AND taggings.taggable_type = 'Person')
              INNER JOIN tags ON (taggings.tag_id = tags.id AND tags.name LIKE 'Sprache:%')
              SET correspondence_language = lower(substring(tags.name FROM 9))
            SQL
          end
        end

        say_with_time 'Delete transfered language-tags' do
          suppress_messages do
            execute "DELETE FROM taggings WHERE tag_id IN ( SELECT id FROM tags WHERE name LIKE 'Sprache:%' );"
            execute "DELETE FROM tags WHERE name LIKE 'Sprache:%';"
          end
        end

        say_with_time 'Correct language-code for romansh' do
          suppress_messages do
            execute "UPDATE people SET correspondence_language = 'rm' WHERE correspondence_language = 'ro';"
          end
        end
      end

      dir.down do
        say_with_time 'Revert language-code for romansh' do
          suppress_messages do
            execute "UPDATE people SET correspondence_language = 'ro' WHERE correspondence_language = 'rm';"
          end
        end

        say_with_time 'Create language-tags' do
          suppress_messages do
            # IDs from previous DB-Version
            execute "INSERT INTO tags VALUES (1,'Sprache:De',0),(3,'Sprache:Fr',0),(5,'Sprache:It',0),(65,'Sprache:Ro',0),(140,'Sprache:En',0);"
          end
        end

        say_with_time 'Transfer language to tag' do
          suppress_messages do
            # IDs from previous DB-Version
            {de: 1, fr: 3, it: 5, ro: 65, en: 140}.each do |lang_code, tag_id|
              execute "INSERT INTO taggings (tag_id, taggable_id, taggable_type, context) SELECT #{tag_id}, people.id, 'Person', 'tags' FROM people WHERE correspondence_language = '#{lang_code}';"
              execute "UPDATE tags SET taggings_count = (SELECT count(*) FROM taggings WHERE tag_id = #{tag_id}) WHERE id = #{tag_id};"
            end
          end
        end
      end
    end
  end
end
