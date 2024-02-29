# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

  def find(id)
    found_candidate = @candidates.find { |candidate| candidate[:id] == id }
  end
  
  def experienced?(candidate)
    candidate[:years_of_experience] >= 2
  end
  
  def qualified_candidates(candidates)
    candidates_array = Array.new
    candidates.each do |candidate|
      if experienced?(candidate) && github_points?(candidate) && ruby_or_python?(candidate) && applicant_age?(candidate) && applicant_age?(candidate)
        candidates_array.push(candidate)
      end
    end
    candidates_array
  end
  
  # More methods will go below

  def github_points?(candidate)
    candidate[:github_points] >= 100
  end

  def ruby_or_python?(candidate)
    candidate[:languages].any? {|language| language == "Ruby" || language =="Python"}
  end

  def application_age?(candidate)
    (Date.today - candidate[:date_applied]).to_i < 15
  end

  def applicant_age?(candidate)
    candidate[:age] > 17
  end

  def ordered_by_qualifications(candidates)
    candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]]}
  end