class DatepickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    template.content_tag :div, class: 'input-group date_picker' do
      date_field = @builder.text_field(attribute_name,
                                       input_html_options)

      span = template.content_tag :span, '', class: 'input-group-addon' do
        template.content_tag :i, '', class: 'fa fa-calendar fa-fw'
      end

      date_field + span
    end
  end

  def value
    object.send(attribute_name).try(:strftime, '%Y-%m-%d') if object
  end

  def input_html_options
    super.merge(class: 'col-md-4 form-control', value: value)
  end
end
