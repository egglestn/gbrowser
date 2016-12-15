crumb :root do
  link "Dashboard", root_path
end

# DEVELOPERS

crumb :samples do
  link Sample.model_name.human.pluralize, samples_path
end

crumb :sample do |sample|
  link sample.name, sample_path(sample)
  parent :samples
end

crumb :sample_edit do |sample|
  link t("views.edit"), samples_path(sample)
  parent :sample, sample
end

crumb :sample_new do
  link t("views.add_type",
         type: Sample.model_name.human)
  parent :samples
end

# DOCUMENTS

crumb :documents do
  link Document.model_name.human.pluralize, documents_path
end

crumb :document do |document|
  link document.title, document_path
  parent :documents
end

crumb :document_edit do |document|
  link t("views.edit")
  parent :document, document
end

crumb :document_new do
  link t("views.add_type",
         type: Document.model_name.human)
  parent :documents
end

# USERS

crumb :users do
  link User.model_name.human.pluralize, users_path
end

crumb :user do |user|
  link "%{first_name} %{last_name}" % {
    first_name: user.first_name,
    last_name: user.last_name
  }, user_path
  parent :users
end

crumb :user_edit do |user|
  link t("views.edit")
  parent :user, user
end

crumb :user_new do
  link t("views.add_type",
         type: User.model_name.human)
  parent :users
end
