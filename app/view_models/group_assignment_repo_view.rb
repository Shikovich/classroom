# frozen_string_literal: true

class GroupAssignmentRepoView < AssignmentRepoView
  def team_members
    @team_members ||= assignment_repo.group.repo_accesses.map(&:user)
  end

  def team_url
    @team_url ||= team.html_url
  end

  def team_name
    @team_name ||= team.name
  end

  def team
    assignment_repo.github_team
  end

  def members_text
    pluralize(team_members.length, 'member')
  end
end
