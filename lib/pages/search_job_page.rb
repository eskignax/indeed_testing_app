class SearchJobPage
  include PageObject

  text_field :what, id: 'qinput'
  text_field :where, id: 'linput'
  button :job_search, xpath: "//android.widget.Button[contains(@content-desc,\"#{RunConfiguration.instance.strings[:search_job_page][:search_job_button]}\")]"
  element :change_country,'Android.view.View', id:'country_switcher'

  DEFAULT_SEARCH_DATA={
      what: 'Engineer',
      where: 'HCMC'
  }


  def search(data={})
    data = DEFAULT_SEARCH_DATA.merge(data)
    self.what= data[:what]
    self.where= data[:where]
    job_search
  end

  def change_country_search
    change_country_element.when_visible.click
  end

end
