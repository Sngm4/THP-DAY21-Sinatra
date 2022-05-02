class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    Gossip.all[id.to_i]
  end

  def self.update(id, author_update, content_update)
    csv_read_all = CSV.read("./db/gossip.csv")
    csv_read_all[id.to_i][0] = author_update
    csv_read_all[id.to_i][1] = content_update
    CSV.open("./db/gossip.csv", "w+") do |csv|
      csv_read_all.each do |line|
        csv << line
      end
    end
  end

end
