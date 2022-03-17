class Search
  def search(type)
    raise 'Unknown search type' unless type.respond_to?(:search)

    type.search
  end
end

class Job
  def search
    search_jobs
  end

  private

  def search_jobs
    # searching
  end
end

class User
  def search
    search_users
  end

  private

  def search_users
    # searching
  end
end